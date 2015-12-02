package aode.lx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
*@author: 黄柏樟
*@date: 2015/7/7
*@explain:
*/
@Controller("indexController")
@RequestMapping("/index")
public class Index {

    @RequestMapping("company")
    public String company(){
        return "company";
    }


}
