package com.kaishengit.core;

import javax.annotation.Resource;

import com.kaishengit.dao.AddressDao;
import com.kaishengit.dao.ChanceDao;
import com.kaishengit.dao.ChanceSortDao;
import com.kaishengit.dao.CompanyDao;
import com.kaishengit.dao.ContactDao;
import com.kaishengit.dao.ContactEmailDao;
import com.kaishengit.dao.EmailDao;
import com.kaishengit.dao.EventDao;
import com.kaishengit.dao.EventNoteDao;
import com.kaishengit.dao.GroupDao;
import com.kaishengit.dao.ImDao;
import com.kaishengit.dao.ImporyDateDao;
import com.kaishengit.dao.MessageDao;
import com.kaishengit.dao.ProductDao;
import com.kaishengit.dao.SiteDao;
import com.kaishengit.dao.TaskDao;
import com.kaishengit.dao.TaskSortDao;
import com.kaishengit.dao.TelDao;
import com.kaishengit.dao.UserDao;
import com.kaishengit.dao.UserProductDao;
import com.kaishengit.service.MessageService;

public class BaseService {

	private ChanceDao chancedao;
	private ChanceSortDao chanceSortDao;
	private CompanyDao companyDao;
	private ContactDao contactDao;
	private EmailDao emailDao;
	private EventNoteDao eventNoteDao;
	private EventDao eventDao;
	private GroupDao groupDao;
	private ImporyDateDao imporyDateDao;
	private MessageDao messageDao;
	private ProductDao productDao;
	private TaskDao taskDao;
	private TaskSortDao taskSortDao;
	private UserProductDao userProductDao;
	private UserDao userDao;
	private ImDao imDao;
	private SiteDao siteDao;
	private TelDao telDao;
	private AddressDao addressDao;
	private ContactEmailDao contactEmailDao;
	private MessageService messageService;
	
	@Resource
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public MessageService getMessageService() {
		return messageService;
	}

	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Resource
	public void setUserProductDao(UserProductDao userProductDao) {
		this.userProductDao = userProductDao;
	}
	

	@Resource
	public void setTaskSortDao(TaskSortDao taskSortDao) {
		this.taskSortDao = taskSortDao;
	}
	@Resource
	public void setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
	}
	@Resource
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	@Resource
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	@Resource
	public void setImporyDateDao(ImporyDateDao imporyDateDao) {
		this.imporyDateDao = imporyDateDao;
	}
	@Resource
	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}
	@Resource
	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	@Resource
	public void setEventNoteDao(EventNoteDao eventNoteDao) {
		this.eventNoteDao = eventNoteDao;
	}
	@Resource
	public void setEmailDao(EmailDao emailDao) {
		this.emailDao = emailDao;
	}
	@Resource
	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}
	@Resource
	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}
	@Resource
	public void setChancedao(ChanceDao chancedao) {
		this.chancedao = chancedao;
	}
	@Resource
	public void setChanceSortDao(ChanceSortDao chanceSortDao) {
		this.chanceSortDao = chanceSortDao;
	}
	public ChanceDao getChancedao() {
		return chancedao;
	}
	public ChanceSortDao getChanceSortDao() {
		return chanceSortDao;
	}
	public CompanyDao getCompanyDao() {
		return companyDao;
	}
	public ContactDao getContactDao() {
		return contactDao;
	}
	public EmailDao getEmailDao() {
		return emailDao;
	}
	public EventNoteDao getEventNoteDao() {
		return eventNoteDao;
	}
	public EventDao getEventDao() {
		return eventDao;
	}
	public GroupDao getGroupDao() {
		return groupDao;
	}
	public ImporyDateDao getImporyDateDao() {
		return imporyDateDao;
	}
	public MessageDao getMessageDao() {
		return messageDao;
	}
	public ProductDao getProductDao() {
		return productDao;
	}
	public TaskDao getTaskDao() {
		return taskDao;
	}
	public TaskSortDao getTaskSortDao() {
		return taskSortDao;
	}
	
	public UserProductDao getUserProductDao() {
		return userProductDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public ImDao getImDao() {
		return imDao;
	}
	@Resource
	public void setImDao(ImDao imDao) {
		this.imDao = imDao;
	}
	public SiteDao getSiteDao() {
		return siteDao;
	}
	@Resource
	public void setSiteDao(SiteDao siteDao) {
		this.siteDao = siteDao;
	}
	public TelDao getTelDao() {
		return telDao;
	}
	@Resource
	public void setTelDao(TelDao telDao) {
		this.telDao = telDao;
	}
	public AddressDao getAddressDao() {
		return addressDao;
	}
	@Resource
	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	public ContactEmailDao getContactEmailDao() {
		return contactEmailDao;
	}
	@Resource
	public void setContactEmailDao(ContactEmailDao contactEmailDao) {
		this.contactEmailDao = contactEmailDao;
	}
	
	
}
