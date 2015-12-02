package aode.lx.controller.admin;

import aode.lx.model.Cart;
import aode.lx.model.Member;
import aode.lx.entity.AjaxResult;
import aode.lx.service.CartService;
import aode.lx.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/7/14
*@explain:
*/
@Controller("adminMemberController")
@RequestMapping("/admin/member")
public class MemberController extends BaseAdminController<Member,Long> {
    @Autowired
    private MemberService memberService;
    @Autowired
    private CartService cartService;

    @RequestMapping("/")
    public ModelAndView index(){
        return new ModelAndView("index");
    }
    @RequestMapping("/list")
    public String login(Member member){
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("/dataTable")
    @ResponseBody
    public Map dataTable(String searchText,int sEcho){
        return memberService.dataTable(searchText,sEcho);
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable Long id){
        try {
            memberService.delete(id);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }

    @RequestMapping("update")
    public String update(Member member,RedirectAttributes redirectAttributes){
        try {
            if(this.memberService.save(member)!=null){
                redirectAttributes.addFlashAttribute("msg",RESULT_OK);
            }
            return REDIRECT_URL+"list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return REDIRECT_URL+"list";
    }
    @RequestMapping("add")
    public String add(Member member,RedirectAttributes redirectAttributes){
        try {
            if(this.memberService.save(member)!=null){
                Cart cart = new Cart();
                cart.setLoginName(member.getLoginName());
                this.cartService.save(cart);
                redirectAttributes.addFlashAttribute("msg",RESULT_OK);
            }
            return REDIRECT_URL+"list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return REDIRECT_URL+"list";
    }
    @RequestMapping("updateUI/{id}")
    public String updateUI(@PathVariable Long id,Model model){
        model.addAttribute(memberService.findOne(id));
        return TEMPLATE_PATH+"saveUI";
    }
    @RequestMapping("show/{id}")
    public String show(@PathVariable Long id,Model model){
        model.addAttribute(memberService.findOne(id));
        return TEMPLATE_PATH+"show";
    }
    @RequestMapping("addUI")
    public String addUI(){
        return TEMPLATE_PATH+"saveUI";
    }
}
