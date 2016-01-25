package aode.lx.interceptor;

import aode.lx.entity.AjaxResult;
import aode.lx.model.Member;
import aode.lx.utils.JsonMapper;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;


public class SessionInterceptor implements HandlerInterceptor {


	private List<String> excludeUrls;
    private String limitUrl ;

    public String getLimitUrl() {
        return limitUrl;
    }

    public void setLimitUrl(String limitUrl) {
        this.limitUrl = limitUrl;
    }
	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 完成页面的render后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {

	}

	/**
	 * 在调用controller具体方法后拦截
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在调用controller具体方法前拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		if (excludeUrls.contains(url)) {
			return true;
		} else if(url.contains(limitUrl)){
            Long id = Long.valueOf(url.substring(limitUrl.length()));
            Member loginMember = (Member) request.getSession().getAttribute("loginMember");
            if (loginMember != null && loginMember.getId()!= null && !loginMember.getId().equals("")
                    && loginMember.getId() == id) {
                return true;
            }
            else{
                request.setAttribute("result", new AjaxResult(false, "你不能进行此操作"));
                request.getRequestDispatcher("/loginUI.jsp").forward(request, response);
                return false;
            }
        }else {
			Member loginMember = (Member) request.getSession().getAttribute("loginMember");
			if (loginMember != null && loginMember.getId()!= null && !loginMember.getId().equals("")) {
				return true;
			} else {
                PrintWriter out = response.getWriter();
                out.print(JsonMapper.nonNullMapper().toJson(new AjaxResult(false, "请您先登录")));
				return false;
			}
		}
	}

}
