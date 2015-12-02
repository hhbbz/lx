package aode.lx.controller.admin;

import aode.lx.entity.AjaxResult;
import aode.lx.model.User;
import aode.lx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/8/9.
 * @Explain:
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseAdminController<User,Long> {
    @Autowired
    private UserService userService;
    @RequestMapping("/list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }
    @RequestMapping("/dataTable")
    @ResponseBody
    public Map dataTable(String searchText,int sEcho){
        return userService.dataTable(searchText,sEcho);
    }
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable Long id){
        try {
            userService.delete(id);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }

    @RequestMapping("update")
    public String update(User user,RedirectAttributes redirectAttributes){
        try {
            if(this.userService.save(user)!=null){
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
    public String add(User user,RedirectAttributes redirectAttributes){
        try {
            if(this.userService.save(user)!=null){
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
        model.addAttribute(userService.findOne(id));
        return TEMPLATE_PATH+"saveUI";
    }
    @RequestMapping("show/{id}")
    public String show(@PathVariable Long id,Model model){
        model.addAttribute(userService.findOne(id));
        return TEMPLATE_PATH+"show";
    }
    @RequestMapping("addUI")
    public String addUI(){
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping("login")
    public String login(User user,HttpSession session,RedirectAttributes redirectAttributes){
        try {
            User loginUserr=this.userService.login(user);
            if (loginUserr!=null){
                session.setAttribute("loginUser",loginUserr);
                return "redirect:/admin/index";
            }else {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return REDIRECT_URL+"loginUI";
            }
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "发生错误"));
            return REDIRECT_URL+"loginUI";
        }
    }
    @RequestMapping("logout")
    public String logout(RedirectAttributes redirectAttributes,HttpSession session){
             session.removeAttribute("loginUser");
             redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "退出成功"));
             return REDIRECT_URL+"loginUI";
    }

    @RequestMapping("loginUI")
    public String loginUI(){
        return TEMPLATE_PATH+"loginUI";
    }
}
