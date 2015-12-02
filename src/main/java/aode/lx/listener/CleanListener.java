package aode.lx.listener;

import aode.lx.weChat.operate.RefreshToken;
import aode.lx.service.AttachmentService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 *@author: 黄柏樟
 *@date: 2015/7/9
 *@explain: 修复清理功能的监听器
 */
public class CleanListener implements ServletContextListener {
	private Timer timer;
	private WebApplicationContext wac = null;
	private String realPath=null;
    private String CONFIG_PATH = "/WEB-INF/classes/weChatConfig.properties" ;
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("--------------清理程序已经关闭-------------------");
		if(timer!=null) timer.cancel();
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//可以获取spring中BeanFactory,这个BeanFactory是在系统启动的时候就完成存储了
		wac = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		System.out.println("------------------清理的启动程序已经开启（已经获取了" + wac + "）---------------------");
		realPath = sce.getServletContext().getRealPath("");
        System.out.println("进行了微信配置的刷新" + new Date());
        RefreshToken.load(realPath , CONFIG_PATH);
		timer = new Timer();
		timer.scheduleAtFixedRate(new ClearDataTask(),5000, 6300000);//5秒后开始执行,一个小时45分钟之后重新执行
	}
    /**
     *@author: 黄柏樟
     *@date: 2015/7/9
     *@explain: 清理图片缓存
     */
	private class ClearDataTask extends TimerTask {
		@Override
		public void run() {
			System.out.println("进行了清理" + new Date());
            AttachmentService attachmentService = (AttachmentService)wac.getBean("attachmentService");
            attachmentService.clear(realPath);
            System.out.println("进行了Token的刷新" + new Date());
            RefreshToken.refresh();
        }
	}
	

}
