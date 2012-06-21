package com.kaishengit.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.ImporyDate;
@Controller
public class ImporyDateAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private ImporyDate imporyDate;
	private int contactid;
	private String day;
	private String month;
	private String year;
	
	@Override
	@Action(value="addImporyDate",results={
			@Result(name="success",type="redirectAction",location="enterContact.action?cid=${contactid}")
	})
	public String execute() throws Exception {
		Contact c = getContactService().findByCid(contactid);
		String time = year + "年" + month + "月" + day + "日";
		imporyDate.setTime(time);
		imporyDate.setContact(c);
		getImproyImporyDateService().save(imporyDate);
		return super.execute();
	}
	public ImporyDate getImporyDate() {
		return imporyDate;
	}
	public void setImporyDate(ImporyDate imporyDate) {
		this.imporyDate = imporyDate;
	}
	public int getContactid() {
		return contactid;
	}
	public void setContactid(int contactid) {
		this.contactid = contactid;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	
}
