package aode.lx.controller;

import aode.lx.entity.AjaxResult;
import aode.lx.model.Member;
import aode.lx.model.MemberProduct;
import aode.lx.service.CartService;
import aode.lx.service.MemberProductService;
import aode.lx.utils.JsonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 黄柏樟 on 2015/7/21.
 * @Explain:
 */
@Controller("cartController")
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private MemberProductService memberProductService;

    @RequestMapping("/addCart")
    @ResponseBody
    public AjaxResult addCart(@RequestBody MemberProduct memberProduct, HttpSession session){
        try {
            Member member = (Member) session.getAttribute("loginMember");
            memberProduct.setCart(this.cartService.findOneByLoginName(member.getLoginName()));
            this.memberProductService.save(memberProduct);
            return new AjaxResult(true,"成功添加至购物车");
        }catch (Exception e){
            e.printStackTrace();
            return new AjaxResult(false,"内部错误,请稍后购买");
        }
    }
    @RequestMapping("show/{loginName}")
    public String show(@PathVariable String loginName,Model model){
        List<MemberProduct> memberProducts = this.cartService.findOneByLoginName(loginName).getMemberProduct();
        model.addAttribute("cart", memberProducts);
        JsonMapper jsonMapper = new JsonMapper();
        model.addAttribute("jsonProduct",jsonMapper.toJson(memberProducts));
        return "cart";
    }
    @RequestMapping("delete/{id}")
    @ResponseBody
    public boolean delete(@PathVariable String id){
        this.memberProductService.delete(id);
        return true;
    }
}
