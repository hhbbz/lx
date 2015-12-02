package aode.lx.weChat.entity;

/**
 * Created by 黄柏樟 on 2015/11/26.
 * @Explain: 微信AccessToken类
 */
public class WeChatAccessToken {
    private String access_token ;
    /*有效时间*/
    private String expires_in ;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(String expires_in) {
        this.expires_in = expires_in;
    }

    @Override
    public String toString() {
        return "AccessToken{" +
                "access_token='" + access_token + '\'' +
                ", expires_in='" + expires_in + '\'' +
                '}';
    }
}
