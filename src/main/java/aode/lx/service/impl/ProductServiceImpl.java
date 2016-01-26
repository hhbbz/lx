package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.ProductRepository;
import aode.lx.model.Attachment;
import aode.lx.model.Product;
import aode.lx.persistence.SearchFilter;
import aode.lx.service.AttachmentService;
import aode.lx.service.ProductService;
import aode.lx.utils.FileUploadUtil;
import aode.lx.utils.StringUtil;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by admin on 2015/6/19.
 */
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product,String> implements ProductService {
    @Autowired
    private AttachmentService attachmentService;
    @Autowired
    private ProductRepository productRepository;
    public BaseJapRepository<Product, String> getRepository() {
        return productRepository;
    }

    @Override
    public Map dataTable(String searchText, int sEcho) {
        Map<String, SearchFilter> searchFilterMap= new HashMap<String,SearchFilter>();
        searchFilterMap.put("ORLIKE_name",new SearchFilter("name", SearchFilter.Operator.ORLIKE, searchText));
        /*searchFilterMap.put("ORLIKE_money",new SearchFilter("money", SearchFilter.Operator.ORLIKE, searchText));*/
        searchFilterMap.put("ORLIKE_type",new SearchFilter("productType.name", SearchFilter.Operator.ORLIKE,searchText));
        Page<Product> pageBean=this.searchPaginated(searchFilterMap);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", this.count());//当前总数据条数
        map.put("iTotalDisplayRecords", pageBean.getTotalElements());//查询结果的总条数
        map.put("aaData", pageBean.getContent());
        return map;
    }
    @Override
    public void add(Product product,MultipartFile picture){
        FileUploadUtil.uploadProductPicture(picture, product);
        product.setId(UUID.randomUUID().toString());//UUID
        // 切割文章内用获取图片名称
        List<String> pics = StringUtil.getImgStr(product.getIntroduction());
        for (String pictureName:pics){
            Attachment attachment=attachmentService.findOne(pictureName);
            if (attachment!=null){
                attachment.setPid(product.getId());
                this.attachmentService.save(attachment);
            }
        }
        this.productRepository.save(product);
    }

    @Override
    public void update(Product product, MultipartFile picture) {
        FileUploadUtil.uploadProductPicture(picture, product);
        List<String> pics = StringUtil.getImgStr(product.getIntroduction());
        List<Attachment> alist=attachmentService.findByPid(product.getId());
        for (Attachment attachment:alist){
            if (! pics.contains(attachment.getFileName())){
                FileUploadUtil.deleteFile(FileUploadUtil.ATTACHMENT_PATH, attachment.getFileName());
                this.attachmentService.delete(attachment);
            }
        }
        for (String pictureName:pics){
            Attachment attachment=attachmentService.findOne(pictureName);
            if (attachment!=null){
                attachment.setPid(product.getId());
                this.attachmentService.save(attachment);
            }
        }
    }
}
