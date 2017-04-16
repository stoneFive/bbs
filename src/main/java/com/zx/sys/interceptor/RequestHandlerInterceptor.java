package com.zx.sys.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zx.util.Constant;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class RequestHandlerInterceptor implements HandlerInterceptor {
	private static final  Logger log = LoggerFactory.getLogger(RequestHandlerInterceptor.class);
	private List<String> excludedUrls;

    public void setExcludedUrls(List<String> excludedUrls) {
        this.excludedUrls = excludedUrls;
    }


	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getContextPath();
		String basePath = "http://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		String uname = (String)request.getSession().getAttribute(Constant.SESSION_USER_NAME);
		String requestUri = request.getRequestURI();
		System.out.println("requestUri -> " + requestUri );

		if(StringUtils.isEmpty(uname)||StringUtils.isBlank(uname)){
			for (String url : excludedUrls) {
				if (requestUri.endsWith(url)|| requestUri.indexOf("front")!=-1) {
					return true;
				}
			}
			response.sendRedirect(basePath+"login.html");
			return false;
		}
		return true;


	}


		}
