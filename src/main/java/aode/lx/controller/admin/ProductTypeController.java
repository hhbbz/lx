package aode.lx.controller.admin;

import aode.lx.entity.AjaxResult;
import aode.lx.model.ProductType;
import aode.lx.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
*@author: 黄柏樟
*@date: 2015/6/19
*@explain:
*/
@Controller
@RequestMapping("admin/productType")
public class ProductTypeController extends BaseAdminController<ProductType,Long>{
    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping("list")
    public String list(Model model){
        model.addAttribute("list",productTypeService.findAll());
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable Long id){
        try {
            productTypeService.delete(id);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }
    @RequestMapping("/save")
    @ResponseBody
    public AjaxResult save(ProductType productType,Model model){
        productTypeService.save(productType);
        ajxlist.setSuccess(true);
        ajxlist.setMsg("保存成功");
        ajxlist.setObj(productType);
        return ajxlist;
    }
    @RequestMapping("/update")
    @ResponseBody
    public AjaxResult update(ProductType productType){
        try {
            productTypeService.save(productType);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }



}
