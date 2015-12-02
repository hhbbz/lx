package aode.lx.weChat.operate;

import aode.lx.weChat.entity.WeChatAccessToken;
import aode.lx.weChat.entity.WeChatContext;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 黄柏樟 on 2015/11/27.
 * @Explain: 刷新微信Token
 */
@Component
public class RefreshToken extends BaseOperate{
    private static Logger logger = Logger.getLogger(RefreshToken.class);

    /**
     * 刷新Token
     */
    public static void refresh(){
        System.out.println("进入了sendGet");
        try {
            String url = ACCESS_TOKEN_URL;
            System.out.println("APPID: " + WeChatContext.getAppId());
            url = url.replaceAll("APPID", WeChatContext.getAppId());
            url = url.replaceAll("APPSECRET", WeChatContext.getAppSecret());
            CloseableHttpResponse resp = HTTP_CLIENT.refreshToken(url);    //发送get请求之后返回结果
            HttpEntity entity = resp.getEntity();
            String content = EntityUtils.toString(entity);
            WeChatAccessToken at = JSON_MAPPER.fromJson(content, WeChatAccessToken.class);
            WeChatContext.setAccessToken(at.getAccess_token());
            System.out.println("access_token: " + WeChatContext.getAccessToken());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 加载微信配置文件WeChatConfig.properties
     * @param realPath
     * @param configPath
     */
    public static void load(String realPath , String configPath) {
        String propertiesPath = realPath + configPath;
        Properties properties = new Properties();
        InputStream is = null;
        try {
            is = new FileInputStream(propertiesPath);
            properties.load(is);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (properties.isEmpty()) {
            logger.error("配置文件异常");
            return;
        }
        WeChatContext.setAppId(properties.getProperty("APPID")) ;
        WeChatContext.setAppSecret(properties.getProperty("APPSECRET"));
        try {
            if (is != null) {
                is.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
