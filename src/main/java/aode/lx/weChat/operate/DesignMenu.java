package aode.lx.weChat.operate;

import aode.lx.weChat.entity.WeChatContext;
import aode.lx.weChat.entity.WeChatMenu;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/11/30.
 */
@Component
public class DesignMenu extends BaseOperate{
    public void createMenu(){
        try {
            List<WeChatMenu> wms = new ArrayList<WeChatMenu>();
            WeChatMenu wml = new WeChatMenu();
            wml.setId(1);
            wml.setName("学习网站");
            wml.setType("view");
            wml.setUrl("http://www.baidu.com");
            wms.add(wml);
            WeChatMenu wm2 = new WeChatMenu();
            wm2.setName("测试资源");
            List<WeChatMenu> wm2Sub = new ArrayList<WeChatMenu>();
            wml = new WeChatMenu();
            wml.setId(2);
            wml.setName("事件测试");
            wml.setType("click");
            wml.setKey("A0001");
            wm2Sub.add(wml);
            wml = new WeChatMenu();
            wml.setId(2);
            wml.setName("扫描");
            wml.setType("scancode_waitmsg");
            wml.setKey("A0001");
            wm2Sub.add(wml);
            Map<String , List<WeChatMenu>> map = new HashMap<String , List<WeChatMenu>>();
            map.put("button", wm2Sub);
            String json = JSON_MAPPER.toJson(map);
            String url = MENU_ADD_URL;
            url = url.replaceAll("ACCESS_TOKEN" , WeChatContext.getAccessToken());
            CloseableHttpResponse resp = HTTP_CLIENT.createMenu(url, json);
            System.out.println(EntityUtils.toString(resp.getEntity()));
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
