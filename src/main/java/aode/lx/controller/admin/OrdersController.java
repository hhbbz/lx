package aode.lx.controller.admin;

import aode.lx.entity.AjaxResult;
import aode.lx.model.MemberProductOrders;
import aode.lx.model.Orders;
import aode.lx.service.OrdersService;
import aode.lx.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/6/29
*@explain:
*/
@Controller
@RequestMapping("admin/orders")
public class OrdersController extends BaseAdminController<Orders,Long>{
    @Autowired
    private OrdersService orderService;
    @Autowired
    private ProductService productService;
    @RequestMapping("addUI")
    public String addUI(Model model){
        model.addAttribute("product_list", productService.findAll());
        return TEMPLATE_PATH+"saveUI";
    }
    @RequestMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable Long id){
        try {
            orderService.delete(id);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }
    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("show/{id}")
    public String show(@PathVariable Long id,Model model){
        Orders orders = new Orders();
        orders = this.orderService.findOne(id);
        List<MemberProductOrders> memberProductOrderses = new ArrayList<MemberProductOrders>();
        memberProductOrderses = orders.getMemberProductOrders();
        model.addAttribute("orders",orders);
        model.addAttribute("memberProductOrderses",memberProductOrderses);
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText,int sEcho){
        return this.orderService.dataTable(searchText,sEcho);
    }
}
