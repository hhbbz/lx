package aode.lx.controller.weChat;

import aode.lx.utils.Encrypt;
import aode.lx.utils.weChat.MessageUtil;
import org.dom4j.DocumentException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/11/27.
 * @Explain: 微信初始化验证控制器
 */
@Controller("weChatIndexController")
@RequestMapping("weChat/index")
public class IndexController {
    public static final String TOKEN = "hhbbz";
    @RequestMapping(value = "getInfo" , method = RequestMethod.GET)
    public void init(HttpServletRequest request , HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String echostr = request.getParameter("echostr");
        String nonce = request.getParameter("nonce");
        String arrs[] = {IndexController.TOKEN , nonce , timestamp};
        Arrays.sort(arrs);
        StringBuffer sb = new StringBuffer();
        for(String a : arrs){
            sb.append(a);
        }
        String sha1 = Encrypt.sha1(sb.toString());
        if(sha1.equals(signature)){
            response.getWriter().println(echostr);
        }
    }
    @RequestMapping(value = "getInfo" , method = RequestMethod.POST)
    public void getInfo(HttpServletRequest request , HttpServletResponse response) throws IOException, DocumentException {
        Map<String , String> msgMap = MessageUtil.xmlMsgToMsg(request);
        String respCon = MessageUtil.handleMsg(msgMap) ;
        response.setContentType("application/xml;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(respCon);
    }

}
