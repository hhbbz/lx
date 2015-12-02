package aode.lx.controller;

import aode.lx.entity.AjaxResult;
import aode.lx.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 黄柏樟 on 2015/7/30.
 * @Explain:
 */
@Controller("memberOrdersController")
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @RequestMapping("addOrders/{loginName}")
    @ResponseBody
    public AjaxResult addOrders( @PathVariable String loginName,String name,String address,String mark,String number[],String total){
        if(mark.trim().isEmpty()||address.trim().isEmpty()){
            return new AjaxResult(false,"送货地址和电话不能为空");
        }else{
            System.out.println(number.length);
            this.ordersService.addOrders(loginName, name , address, mark , number , total);
            return new AjaxResult(true,"index");
        }

    }

}
