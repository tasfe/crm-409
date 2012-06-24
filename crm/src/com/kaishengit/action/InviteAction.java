package com.kaishengit.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Email;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
import com.kaishengit.util.MD5Util;
import com.kaishengit.util.MailUtil;
import com.kaishengit.util.UUIDUTil;

@Controller
public class InviteAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private JavaMailSender mailsender;
	private int pid;
	private String email;
	private String code;
	
	MailUtil mail = new MailUtil();
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	@Action(value="sendMail",results={
			@Result(name="success",type="redirectAction",location="worker.action")
	})
	public String sendMail() {
		String c = UUIDUTil.getUUID();
		String site = "http://127.0.0.1:8080/crm/inviteback.action?code=" + c + "&pid="+((Product)getSession("product")).getId();
		Email e = new Email();
		e.setCode(c);
		e.setEmail(email);
		e.setEnable(false);
		e.setProduct(((Product)getSession("product")));
		
		getEmailSrvice().saveOrUpdate(e);
		
		mail.sendMail(mailsender,email, site);
		return SUCCESS;
	}
	/**
	 * 邀请注册
	 * @return
	 */
	@Action(value="inviteback",results={
			@Result(name="success",type="redirectAction",location="welcome.action?id=${pid}")
	})
	public String mailBack() {
		System.out.println("...............");
		Email e = getEmailSrvice().findByCode(code);
		User user = getUserService().findByUsername(e.getEmail());
		Product p = getProductService().findBypid(pid);
		if(user != null) {
			//用户存在,加入该项目
			UserProduct up = new UserProduct();
			up.setProduct(p);
			up.setUser(user);
			up.setRole(3);
			
			getUserProductService().saveOrUpdate(up);
			putSession("user", user);
			putSession("welcomeindex",1);
			
		} else {
			//用户不存在，添加用户，添加关系
			User u = new User();
			u.setUsername(e.getEmail());
			u.setPassword(MD5Util.getMD5("000000"));
			u.setHead("1.jpg");
			
			int id = getUserService().saveUser(u,p);
			u.setId(id);
			putSession("user", u);
			putSession("welcomeindex",1);
		}
		//删除email表中数据
		getEmailSrvice().delByCode(code);
		return SUCCESS;
	}
	//get set
	@Resource
	public void setMailsender(JavaMailSender mailsender) {
		this.mailsender = mailsender;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
