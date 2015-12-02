package aode.lx.weChat.http;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

/**
 * Created by 黄柏樟 on 2015/12/1.
 * @Explain: HttpClients工具类
 */
public class HttpClient {
    public static  CloseableHttpClient client = null;
    public static  CloseableHttpResponse resp = null;

    /**
     * 发送get请求刷新token
     * @param url
     * @return
     * @throws Exception
     */
    public CloseableHttpResponse refreshToken(String url) throws Exception{
        client = HttpClients.createDefault();
        HttpGet get = new HttpGet(url);
        resp = client.execute(get);
        int statusCode = resp.getStatusLine().getStatusCode();
        if (statusCode >= 200 && statusCode < 300){
            return resp;
        }
        return null;
    }

    /**
     * 发送post请求自定义菜单
     * @param url
     * @param json
     * @return
     * @throws Exception
     */
    public CloseableHttpResponse createMenu(String url , String json) throws Exception{
        client = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        post.addHeader("Content_Type", "application/json");
        StringEntity entity = new StringEntity(json ,
                ContentType.create("application/json", "utf-8"));
        post.setEntity(entity);
        resp = client.execute(post);
        int statusCode = resp.getStatusLine().getStatusCode();
        if (statusCode >= 200 && statusCode < 300){
            return resp;
        }
        return null;
    }

}
