package aode.lx.utils.weChat;

import aode.lx.weChat.entity.WeChatMessageType;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.*;

/**
 * Created by 黄柏樟 on 2015/12/1.
 * @Explain: 处理微信信息
 */
public class MessageUtil {
    private static Map<String , String> replyMsgs = new HashMap<String , String>();   //回复的信息
    static {
        replyMsgs.put("123" , "你输入了123");
        replyMsgs.put("hello" , "world");
        replyMsgs.put("run" , "走好");
    }

    /**
     * 接收信息
     * @param request
     * @return
     * @throws IOException
     */
    private static String getInfo(HttpServletRequest request) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream() , "UTF-8"));
        String str = null;
        StringBuffer sb = new StringBuffer();
        while ((str=br.readLine())!=null){
            sb.append(str);
        }
        return sb.toString() ;
    }

    /**
     * 接收信息
     * xml转化成map
     * @param request
     * @return
     * @throws IOException
     * @throws DocumentException
     */
    public static Map<String , String> xmlMsgToMsg(HttpServletRequest request) throws IOException, DocumentException {
        String xml = getInfo(request);
        Map<String , String> maps = new HashMap<String , String>();
        Document document = DocumentHelper.parseText(xml);
        Element root = document.getRootElement();  //获取文档的根节点
        List<Element> eles = root.elements(); //取得根节点下的所有字节点
        for (Element e : eles){
            maps.put(e.getName() , e.getTextTrim());  //把节点标签作为key并把节点内容存进map
        }
        return maps ;
    }


    /**
     * 判断信息类型并作不同的处理
     * @param msgMap
     * @return
     * @throws IOException
     */
    public static String handleMsg(Map<String, String> msgMap) throws IOException {
        String msgType = msgMap.get("MsgType");
        if(msgType.equals(WeChatMessageType.MSG_EVENT_TYPE)){

        }else if (msgType.equals(WeChatMessageType.MSG_TEXT_TYPE)) {
            return textTypeHandler(msgMap);
        }
        return null;
    }

    /**
     * 回复的信息内容
     * @param msgMap
     * @return
     * @throws IOException
     */
    private static String textTypeHandler(Map<String, String> msgMap) throws IOException {
        Map<String , String> map = new HashMap<String , String>();
        map.put("ToUserName" , msgMap.get("FromUserName"));
        map.put("FromUserName" , msgMap.get("ToUserName"));
        map.put("CreateTime" , new Date().getTime()+"");
        map.put("MsgType" , "text");
        String replyContent = "你请求的消息的内容不正确";
        String con = msgMap.get("Content");
        if(replyMsgs.containsKey(con)){
            replyContent = replyMsgs.get(con);
        }
        map.put("Content" , replyContent);
        return mapToXml(map);
    }

    /**
     * 回复信息
     * map转化成xml
     * @param map
     * @return
     * @throws IOException
     */
    private static String mapToXml(Map<String, String> map) throws IOException {
        Document document = DocumentHelper.createDocument();
        Element root = document.addElement("xml");
        Set<String> keys = map.keySet();
        for (String key : keys){
            root.addElement(key).addText(map.get(key));
        }
        StringWriter sw = new StringWriter();
        document.write(sw);
        return sw.toString();
    }
}
