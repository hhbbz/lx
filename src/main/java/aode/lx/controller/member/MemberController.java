package aode.lx.controller.member;

import aode.lx.entity.AjaxResult;
import aode.lx.model.Cart;
import aode.lx.model.Member;
import aode.lx.service.CartService;
import aode.lx.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
*@author: 黄柏樟
*@date: 2015/7/14
*@explain:
*/
@Controller("memberController")
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private CartService cartService;

    @RequestMapping("register")
    public String register(Member member,RedirectAttributes redirectAttributes){
        try {
            Cart cart = new Cart();
            cart.setLoginName(member.getLoginName());
            this.memberService.save(member);
            this.cartService.save(cart);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "注册成功"));
            return "redirect:loginUI";
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "内部错误，注册失败"));
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "该用户名已存在"));
        return "redirect:registerUI";
    }
    @RequestMapping("login")
    public String login(Member member,HttpSession session,RedirectAttributes redirectAttributes){
        try {
            Member loginMember=this.memberService.login(member);
            if (loginMember!=null){
                session.setAttribute("loginMember",loginMember);
                redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "欢迎回来"));
                return "redirect:/";
            }else {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return "redirect:loginUI";
            }
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "发生错误"));
            return "redirect:loginUI";
        }
    }
    @RequestMapping("registerUI")
    public String registerUI(Member member){
        return "registerUI";
    }
    @RequestMapping("loginUI")
    public String loginUI(Member member){
        return "loginUI";
    }
    @RequestMapping("logout")
    public String logout(HttpSession session,RedirectAttributes redirectAttributes){
        session.removeAttribute("loginMember");
        redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "退出成功"));
        return "redirect:/";
    }
    @RequestMapping("orders")
    public String orders(){
        return "orders";
    }

}
