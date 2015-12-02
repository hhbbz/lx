package aode.lx.controller.admin;

import aode.lx.service.MemberService;
import aode.lx.service.OrdersService;
import aode.lx.service.ProductService;
import aode.lx.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 黄柏樟 on 2015/8/9.
 * @Explain:
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private ProductTypeService productTypeService;
    @Autowired
    private ProductService productService;
    protected String admin_dir = "/WEB-INF/jsp/";
    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("memberCount",this.memberService.count());
        model.addAttribute("ordersCount",this.ordersService.count());
        model.addAttribute("productTypeCount",this.productTypeService.count());
        model.addAttribute("productCount",this.productService.count());
        return admin_dir+"index";
    }

}
