package aode.lx.weChat.entity;

/**
 * Created by 黄柏樟 on 2015/11/27.
 * @Explain: 微信属性类
 */
public class WeChatContext {

    private static String appId ;

    private static String appSecret ;

    private static String accessToken;

    private static WeChatContext wc ;

    private WeChatContext(){}

    public static WeChatContext getInstance(){   //单例模式
        if(wc!=null)
            wc = new WeChatContext();
        return wc ;
    }

    public static String getAppId() {
        return appId;
    }

    public static void setAppId(String appId) {
        WeChatContext.appId = appId;
    }

    public static String getAppSecret() {
        return appSecret;
    }

    public static void setAppSecret(String appSecret) {
        WeChatContext.appSecret = appSecret;
    }

    public static String getAccessToken() {
        return accessToken;
    }

    public static void setAccessToken(String accessToken) {
        WeChatContext.accessToken = accessToken;
    }


}
