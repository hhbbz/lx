package aode.lx.weChat.entity;

import java.util.List;

/**
 * Created by 黄柏樟 on 2015/11/30.
 * @Explain: 自定义菜单类
 */
public class WeChatMenu {
    private int id ;
    private String name ;
    private String type ;
    private String url ;
    /*关键字*/
    private String key ;
    /*父类菜单*/
    private int pid ;
    /*菜单栏*/
    private List<WeChatMenu> sub_button;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public List<WeChatMenu> getSub_button() {
        return sub_button;
    }

    public void setSub_button(List<WeChatMenu> sub_button) {
        this.sub_button = sub_button;
    }
}
