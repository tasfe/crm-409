package com.kaishengit.core;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.google.gson.Gson;
import com.kaishengit.service.ChanceService;
import com.kaishengit.service.ChanceSortService;
import com.kaishengit.service.CompanyService;
import com.kaishengit.service.ContactService;
import com.kaishengit.service.EmailService;
import com.kaishengit.service.EventNoteService;
import com.kaishengit.service.EventService;
import com.kaishengit.service.GroupService;
import com.kaishengit.service.ImporyDateService;
import com.kaishengit.service.MessageService;
import com.kaishengit.service.ProductService;
import com.kaishengit.service.TaskService;
import com.kaishengit.service.TaskSortService;
import com.kaishengit.service.UserProductService;
import com.kaishengit.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport implements SessionAware,ServletRequestAware,ServletResponseAware,ServletContextAware{

	private static final long serialVersionUID = 1L;

	private ServletContext application;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Map<String,Object> session;
	//service
	private ChanceService chanceService;
	private ChanceSortService chanceSortService;
	private CompanyService companyService;
	private ContactService contactService;
	private EmailService emailSrvice;
	private EventNoteService eventNoteService;
	private EventService eventService;
	private GroupService groupService;
	private ImporyDateService improyImporyDateService;
	private MessageService messageService;
	private ProductService productService;
	private TaskService taskService;
	private TaskSortService taskSortService;
	private UserProductService userProductService;
	private UserService userService;
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	//向前台发送json
	public void sendJson(Object o) {
		try {
			PrintWriter writer = response.getWriter();
			response.setContentType("application/json;charset=UTF-8");
			Gson gson = new Gson();
			writer.print(gson.toJson(o));
			
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	
	//获取session中的值
	public Object getSession(String key) {
		return session.get(key);
	}
	//向session中存放值
	public void putSession(String key,Object value){
		session.put(key, value);
	}
	
	
	//获取session application servletContext httpSession
	public void setServletContext(ServletContext application) {
		this.application = application;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ServletContext getApplication() {
		return application;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	//service
	public ChanceService getChanceService() {
		return chanceService;
	}
	@Resource
	public void setChanceService(ChanceService chanceService) {
		this.chanceService = chanceService;
	}

	public ChanceSortService getChanceSortService() {
		return chanceSortService;
	}
	@Resource
	public void setChanceSortService(ChanceSortService chanceSortService) {
		this.chanceSortService = chanceSortService;
	}

	public CompanyService getCompanyService() {
		return companyService;
	}
	@Resource
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}

	public ContactService getContactService() {
		return contactService;
	}
	@Resource
	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}

	public EmailService getEmailSrvice() {
		return emailSrvice;
	}
	@Resource
	public void setEmailSrvice(EmailService emailSrvice) {
		this.emailSrvice = emailSrvice;
	}

	public EventNoteService getEventNoteService() {
		return eventNoteService;
	}
	@Resource
	public void setEventNoteService(EventNoteService eventNoteService) {
		this.eventNoteService = eventNoteService;
	}

	public EventService getEventService() {
		return eventService;
	}
	@Resource
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	public GroupService getGroupService() {
		return groupService;
	}
	@Resource
	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public ImporyDateService getImproyImporyDateService() {
		return improyImporyDateService;
	}
	@Resource
	public void setImproyImporyDateService(ImporyDateService improyImporyDateService) {
		this.improyImporyDateService = improyImporyDateService;
	}

	public MessageService getMessageService() {
		return messageService;
	}
	@Resource
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public ProductService getProductService() {
		return productService;
	}
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public TaskService getTaskService() {
		return taskService;
	}
	@Resource
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}

	public TaskSortService getTaskSortService() {
		return taskSortService;
	}
	@Resource
	public void setTaskSortService(TaskSortService taskSortService) {
		this.taskSortService = taskSortService;
	}

	public UserProductService getUserProductService() {
		return userProductService;
	}
	@Resource
	public void setUserProductService(UserProductService userProductService) {
		this.userProductService = userProductService;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	
}
