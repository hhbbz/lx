package aode.lx.controller.admin;

import aode.lx.entity.AjaxResult;
import aode.lx.model.Product;
import aode.lx.service.ProductService;
import aode.lx.service.ProductTypeService;
import aode.lx.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/6/19
*@explain:
*/
@Controller
@RequestMapping("admin/product")
public class ProductController extends BaseAdminController<Product,String>{
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;
    @RequestMapping("add")
    public String add(@RequestParam("picture") MultipartFile picture,RedirectAttributes redirectAttributes,
                      String name,String introduction,double money,Long productType){
        try {
            Product product = new Product();
            product.setName(name);
            product.setIntroduction(introduction);
            product.setMoney(money);
            product.setDate(new Date());
            product.getProductType().setId(productType);
            this.productService.add(product, picture);
            redirectAttributes.addFlashAttribute("msg", successResult);
            return TEMPLATE_PATH+"list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("addUI")
    public String addUI(Model model){
        model.addAttribute("productType_list", productTypeService.findAll());
        return TEMPLATE_PATH+"saveUI";
    }
    @RequestMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable String id){
        try {
            Product product = this.productService.findOne(id);
            FileUploadUtil.deleteFile(FileUploadUtil.PRODUCT_PATH,product.getPicture());
            this.productService.delete(product);
            return successResult;
        } catch (Exception e) {
            return errorResult;
        }

    }
    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("update")
    public String update(@RequestParam("picture") MultipartFile picture,String id,String name,String introduction,double money,Long productType){
        Product product = productService.findOne(id);
        product.setDate(new Date());
        product.setIntroduction(introduction);
        product.setName(name);
        product.setMoney(money);
        product.getProductType().setId(productType);
        this.productService.update(product, picture);
        this.productService.save(product);
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("updateUI/{id}")
    public String updateUI(@PathVariable String id , Model model){
        model.addAttribute("product", productService.findOne(id));
        model.addAttribute("productType_list", productTypeService.findAll());
        return TEMPLATE_PATH+"saveUI";
    }
    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText,int sEcho){
        System.out.println(this.productService.dataTable(searchText,sEcho));
        return this.productService.dataTable(searchText,sEcho);
    }

}
