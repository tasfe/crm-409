package com.kaishengit.intercept;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.util.TextParseUtil;


@SuppressWarnings("static-access")
public class CheckLoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;
	private String loginUser;
	private String exclude;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Set<String> set = TextParseUtil.commaDelimitedStringToSet(exclude);
		System.out.println(invocation.getProxy().getActionName());
		if (set.contains(invocation.getProxy().getActionName())) {
			return invocation.invoke();
		} else {
			Map<String, Object> session = invocation.getInvocationContext()
					.getContext().getSession();
			if (session.get(loginUser) != null) {
				return invocation.invoke();
			}
		}
		return "loginfail";
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}

}
