package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.TaskSort;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
import com.kaishengit.util.TimeUtil;


public class TaskAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private Task task;
	private TaskSort tasksort;
	private List<UserProduct> userProducts;
	private int managerid;
	private String show;
	private List<Task> tasks;
	private List<Task> myTasks;
	private List<Task> completeTasks;
	private List<Task> passTasks;
	private int chanceid;
	private int tid;
	@Override
	public String execute() throws Exception {
		userProducts = getUserProductService().findByProduct((Product)getSession("product"));
		tasks = getTaskService().findByManagerId(((User)getSession("user")).getId());
		completeTasks = getTaskService().findByStatAndManagerId(((User)getSession("user")).getId());
		myTasks = getTaskService().findByUser(((User)getSession("user")));
		passTasks = getTaskService().findByTime(((User)getSession("user")).getId());
		
		return super.execute();
	}
	
	
	@Action(value="addTask",results={
			@Result(name="success",type="redirectAction",location="task.action")
	})
	public String addTask() {
		TaskSort ts = getTaskSortService().findByTaskSortName(tasksort.getName());
		if(ts == null) {
			int id = getTaskSortService().saveOrUpdate(tasksort);
			tasksort.setId(id);
		} else {
			tasksort.setId(ts.getId());
		}
		task.setTasksort(tasksort);
		task.setCreatetime(TimeUtil.getNow());
		task.setManagerid(managerid);
		task.setProduct((Product)getSession("product"));
		task.setState(1);
		task.setUser((User)getSession("user"));
		if("public".equals(show)) {
			task.setEnableshow(true);
		}
		getTaskService().saveOrUpdate(task);
		return SUCCESS;
	}
	@Action(value="addMsgTask",results={
			@Result(name="success",type="redirectAction",location="message.action")
	})
	public String addMsgTask() {
		TaskSort ts = getTaskSortService().findByTaskSortName(tasksort.getName());
		if(ts == null) {
			int id = getTaskSortService().saveOrUpdate(tasksort);
			tasksort.setId(id);
		} else {
			tasksort.setId(ts.getId());
		}
		task.setTasksort(tasksort);
		task.setCreatetime(TimeUtil.getNow());
		task.setManagerid(managerid);
		task.setProduct((Product)getSession("product"));
		task.setState(1);
		task.setUser((User)getSession("user"));
		if("public".equals(show)) {
			task.setEnableshow(true);
		}
		getTaskService().saveOrUpdate(task);
		return SUCCESS;
	}
	
	@Action(value="addChanceTask",results={
			@Result(name="success",type="redirectAction",location="enterChance.action?id=${chanceid }")
	})
	public String addChanceTask() {
		TaskSort ts = getTaskSortService().findByTaskSortName(tasksort.getName());
		if(ts == null) {
			int id = getTaskSortService().saveOrUpdate(tasksort);
			tasksort.setId(id);
		} else {
			tasksort.setId(ts.getId());
		}
		task.setTasksort(tasksort);
		task.setCreatetime(TimeUtil.getNow());
		task.setManagerid(managerid);
		task.setProduct((Product)getSession("product"));
		task.setState(1);
		task.setUser((User)getSession("user"));
		if("public".equals(show)) {
			task.setEnableshow(true);
		}
		getTaskService().saveOrUpdate(task);
		return SUCCESS;
	}
	@Action("delTask")
	public String del() {
//		System.out.println("你好.......");
		boolean result = true;
		User user = (User)getSession("user");
		Product product = (Product)getSession("product");
		try {
			Task t = getTaskService().findById(tid);
			getTaskService().del(tid,user,product,t);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		
		sendJson(result);
		return null;
	}
	@Action("editTask")
	public String edit() {
		boolean result = true;
		try {
			getTaskService().findById(tid);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		
		sendJson(result);
		return null;
	}
	
	//get set
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public TaskSort getTasksort() {
		return tasksort;
	}
	public void setTasksort(TaskSort tasksort) {
		this.tasksort = tasksort;
	}
	public List<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public List<Task> getMyTasks() {
		return myTasks;
	}
	public void setMyTasks(List<Task> myTasks) {
		this.myTasks = myTasks;
	}
	public List<Task> getCompleteTasks() {
		return completeTasks;
	}
	public void setCompleteTasks(List<Task> completeTasks) {
		this.completeTasks = completeTasks;
	}
	public List<Task> getPassTasks() {
		return passTasks;
	}
	public void setPassTasks(List<Task> passTasks) {
		this.passTasks = passTasks;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getChanceid() {
		return chanceid;
	}
	public void setChanceid(int chanceid) {
		this.chanceid = chanceid;
	}
	
	
}
