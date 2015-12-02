package aode.lx.weChat.operate;

import aode.lx.utils.JsonMapper;
import aode.lx.weChat.http.HttpClient;

/**
 * Created by 黄柏樟 on 2015/12/1.
 * @Explain:
 */
public class BaseOperate {
    public static final HttpClient HTTP_CLIENT = new HttpClient();
    public static final JsonMapper JSON_MAPPER = JsonMapper.nonNullMapper();

/*    //公众号id和secret
    public static final String APPID = "wxbb311abc4b248106";
    public static final String APPSECRET = "d4624c36b6795d1d99dcf0547af5443d";*/

    //api的url
    public static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
    public static final String MENU_ADD_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
}
