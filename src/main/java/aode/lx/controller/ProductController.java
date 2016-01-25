package aode.lx.controller;

import aode.lx.entity.PageBean;
import aode.lx.model.Product;
import aode.lx.persistence.SearchFilter;
import aode.lx.service.ProductService;
import aode.lx.utils.PageRequestBulider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/7/6
*@explain:
*/
@Controller("memberProductController")
@RequestMapping("/")
public class ProductController {
    @Autowired
    private ProductService productService;
    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("product_list", this.productService.findAll());
        return "index";
    }
    @RequestMapping("detail/{id}")
    public String show(@PathVariable String id,Model model){
        model.addAttribute("product",this.productService.findOne(id));
        return "detail";
    }
    @RequestMapping("indexPagers")
    @ResponseBody
    public long indexPagers(){
        long count = this.productService.count();
        if(count%9==0){
            return count/9;
        }else {
            return (count/9)+1;
        }

/*        PageRequest pageRequest = PageRequestBulider.getPageRequest(request);
        Map<String, SearchFilter> additionalFilters=new HashMap<String, SearchFilter>();
        pageRequest=new PageRequest(0,9,new Sort(new Sort.Order(Sort.Direction.DESC,"date")));
        return productService.searchPaginated(additionalFilters, pageRequest);*/
    }
    @RequestMapping("pagers/{pages}")
    @ResponseBody
    public Page<Product> pagers(PageBean pageBean, HttpServletRequest request,@PathVariable int pages){
        PageRequest pageRequest = PageRequestBulider.getPageRequest(request);
        Map<String, SearchFilter> additionalFilters=new HashMap<String, SearchFilter>();
        pageRequest=new PageRequest(pages,9,new Sort(new Sort.Order(Sort.Direction.DESC,"date")));
        return productService.searchPaginated(additionalFilters, pageRequest);
    }
}
