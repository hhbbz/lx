package aode.lx.weChat.entity;

/**
 * Created by 黄柏樟 on 2015/12/1.
 * @Explain: 微信信息类
 */
public class WeChatMessage {
    private int id ;
    /*开发者微信号*/
    private String toUserName ;
    /*发送方帐号（一个OpenID）*/
    private String fromUserName ;
    /*消息创建时间（整型）*/
    private int createTime ;
    /*消息类型*/
    private String type ;
    /*消息内容*/
    private String content;
    /*消息id,64位整型*/
    private int msgId ;
    /*图片链接*/
    private String picUrl ;
    /*图片消息媒体id*/
    private String mediaId ;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public int getCreateTime() {
        return createTime;
    }

    public void setCreateTime(int createTime) {
        this.createTime = createTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getMsgId() {
        return msgId;
    }

    public void setMsgId(int msgId) {
        this.msgId = msgId;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }
}
