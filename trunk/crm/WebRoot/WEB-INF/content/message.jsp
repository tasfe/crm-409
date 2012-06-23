<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>最新消息</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script type="text/javascript" src ="js/jQuery.js"></script>
	<script type="text/javascript" src ="js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
			margin-top:68px;
			background-color:#F3F1Ec;
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-size: 13px;
			line-height: 18px;
		}
		#mapp{
			max-width:1200px;
			min-width:700px;
			margin:0px;
			padding-left:200px;
			
		}
		.left{
			margin-left:-200px;
			width:200px;
			float:left;
			background-image:url("bootstrap/img/wash.png");
		}
		.right{
			width:95%;
			float:left;
			margin-left:10px;
			border: 1px solid #D7D7D7;
			background-color:#FFF;
		}
		.left-top{
			border:1px solid #DADEE5;
			margin-top:0px;
		}
		.right-top {
			height:30px;
			line-height:30px;
			padding:8px 25px;
			background: none repeat scroll 0 0 #F0F5F8;
			border-bottom: 1px solid #DADEE5;
			border-radius: 6px 6px 0 0;
		}
		.right-center{
			margin:10px 20px;
			text-align:center;
			background-color: #FFFAE7;
			border: 1px solid #CCCCCC;
			border-radius: 3px 3px 3px 3px;
			box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
			padding:15px;
		}
		.right-center2{
			text-align:center;
			margin:25px;
		}
		tr td img{
			margin:25px;
			
		}
		.sidebar{
			margin-top:35px;
		}
		.sidebar .title {
			border-bottom: 1px solid #CCCCCC;
			color: #000000;
			font-size: 14px;
			font-weight: bold;
			margin-bottom: 5px;
			padding-bottom: 3px;
		}
		.right2{
			width:31%;
			float:left;
			background-color:#FFF;
			margin-left:10px;
			border-radius:3px 3px;
		}
		div#tasks_div {
			background: none repeat scroll 0 0 #FFFFFF;
			margin-bottom:0px;
		}
		.sidebar .title {
			border-bottom: 1px solid #CCCCCC;
			color: #000000;
			font-size: 14px;
			font-weight: bold;
			margin-bottom: 5px;
			padding-bottom: 3px;
		}		
		.sidebar .title span {
			float: right;
			font-size: 12px;
			font-weight: normal;
		}
		legend {
			font-size: 14px;
			font-weight: bold;
			margin-bottom: 10px;
		}
		hr{
			margin:5px;
		}
		.main {
			padding: 20px 20px 0;
		}
		.accordion-inner li a{
			color:#000;
		}
		.dashboard .content a {
			color: #333
		}
		.dashboard a:hover {
			color: #0084B4;
		}
		td.date span {
			color: #999;
		}
		td.date span.label {
			color: #fff;
		}
		.dashboard span.author {
			color: #999;
		}
		tr td img{
			margin:5px;
		}
		.date{
			width: 32px;
		}
		
		#search{
			border-radius: 14px 14px 14px 14px;
			width:110px;
		}
		.dropdown a{
			margin-right:30px;
		}
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="message" name="tag"/>
	</jsp:include>

	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>按条件筛选</h2>
				</div>
				<select name="type" id="type" style="width:200px">
					<option selected="selected" value="">所有动态</option>
					<option value="task">任务动态</option>
					<option value="chance">机会动态</option>
					<option value="note">事件动态</option>
					<option value="email">邮件动态</option>
				</select>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="message.action">所有同事</a></li>
					
					<div id="accordion2" class="accordion">
					<div class="accordion-group">
					  <div class="accordion-heading">
						<a href="#group" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle">
						 组
						</a>
					  </div>
					  <div class="accordion-body collapse" id="group" style="height: 0px;background-color:#fff">
						<div class="accordion-inner">
							<c:forEach items="${groups }" var="group">
							<li><a href="gmessage.action?gid=${group.id }">${group.name }</a></li>
							<hr/>
							</c:forEach>
						</div>
					  </div>
					</div>
					<div class="accordion-group">
					  <div class="accordion-heading">
						<a href="#user" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle">
						 同事
						</a>
					  </div>
					  <div class="accordion-body collapse" id="user" style="height: 0px;background-color:#fff">
						<div class="accordion-inner">
							<c:forEach items="${userProducts }" var="userProduct">
							<li><a href="umessage.action?uid=${userProduct.user.id }">${userProduct.user.username }</a></li>
							<hr/>
							</c:forEach>
						</div>
					  </div>
					</div>
				  </div>
				</ul>
			</div>
		</div>
		
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px"><span style="float:left;font-size:24px;">最新消息</div>
			<div id="main" class="main"  style="padding-top: 0px">
						
					<table class="table crm-table dashboard">
						<tbody>
							<tr id="activity_783582">
								<td class="icon"  style="width: 30px">
									<span><img src="img/duigou.png" alt="" /></span>
								</td>
								<td>
									<del>陈路的新任务</del><span class="author"> 由 陈路 完成</span><a title="删除这条动态" style="margin-left:5px" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这条动态吗？" class="icon icon-trash" href="/tasks/23097/delete_activity"></a>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_783578">
								<td class="icon"  style="width: 30px">
									<span><img src="img/duigou.png" alt="" /></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><div class="content"><a href="/notes/765301">打三分</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781786">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><br>陈路 将机会状态改为 失败
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							
							<tr id="activity_781781">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763553">你好啊 呵呵呵呵。 </a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781780">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781779">
								<td class="icon">
									<span class="sprite task"></span>
								</td>
								<td>
									<del>dasf</del><span class="author"> 由 陈路 完成</span><a title="删除这条动态" style="margin-left:5px" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这条动态吗？" class="icon icon-trash" href="/tasks/23095/delete_activity"></a>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781726">
								<td class="icon">
									<span class="sprite comment"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763533">fhfhg</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781724">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763531">hihihu</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781725">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763532">guygu</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781723">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781697">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4127">有可能买车</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
		
		<div class="right2 sidebar" style="margin-top:0px;">
			<div class="well" id="tasks_div">
				<div class="title">
					<span><a href="#taskModal" data-toggle="modal">添加任务</a></span>
						<div id="taskModal" class="modal hide in" style="display: none;">
				<form  method="post" id="task_form"  class="simple_form new_task" action="addTask.action" >
					<div class="modal-header">
						<a data-dismiss="modal" class="close">×</a>
						<h3>添加一个任务</h3>
					</div>
					
				<div class="modal-body">
				<div class="control-group string required"><div class="controls">
					<input type="text" size="50" name="task.name" id="task_name" class="string required span5"></div>
				</div>
		
				<div class="control-group string optional">
					<label for="task_frame" class="string optional control-label"> 到期时间？</label>
					<div class="controls">
					<input type="text" name="task.endtime">
					</div>
				</div>			
			<div class="control-group integer optional"><label for="task_category_id" class="integer optional control-label"> 选择一个分类</label>
				<div class="controls">
					<input type="text" name="tasksort.name">				
				</div>
			</div>								
				<div class="control-group select optional">
					<label for="task_assigned_to_id" class="select optional control-label"> 谁负责？</label>
					<div class="controls">
					<select name="managerid" id="task_assigned_to_id" class="select optional">
					<option selected="selected" value="${user.id }">我</option>
					<c:forEach items="${userProducts }" var="userProduct">
						<c:if test="${userProduct.user.id != user.id }">
							<option value="${userProduct.user.id }">${userProduct.user.username }</option>
						</c:if>
					</c:forEach>						
					</select>
					</div>
				</div>
				
					<div class="control-group string optional checkbox">
						<div class="controls">
							<input type="checkbox" value="public" name="show" id="task_privacy"> 同事可以看见这个任务
						</div>
					</div>		
				</div>
		
			<div style="text-align:left;" class="modal-footer">
				<input type="submit" value="添加这个任务" name="commit" class="btn btn-primary">
				<a data-dismiss="modal" class="btn" href="#">取消</a>
			</div>
		</form>
		</div>
					您的日程安排
				</div>
				<div id="upcoming_tasks">
				<div id="screen_body">
				<c:forEach items="${tasks }" var="task">
					<div class="tasks today" id="taskcontent">
						<legend>${task.createtime }</legend>
						<div class="task checkbox" id="${task.id }">
							<span class="task_hover">
									<div class="task_actions" style="display: none;">
										<a title="删除这个任务" class="icon icon-trash" href=""></a>
										<a class="edit" href="">编辑</a>
									</div>
								<input type="checkbox" value="${task.id }"  name="task_done" id="task_done_23393" class="mtask">
								<span class="label" style="background:#A5460D;">${task.tasksort.name }</span>
								${task.name }
							</span>
						</div>
					</div>	
					</c:forEach>
					<div class="tasks overdue">
						<legend>已过期</legend>
						<c:forEach items="${passTasks }" var="task">
						<div class="task checkbox" id="${task.id }" style="margin-bottom:10px">
							<span class="task_hover">
									<div class="task_actions" style="display: none;">
										<a data-remote="true" class="edit" href="">编辑</a>
									</div>
								
								<input type="checkbox" value="${task.id }"  name="task_done" id="task_done_23393" class="passtask">
								<span class="label" style="background:#666666;">${task.tasksort.name}</span>
								<strong>${task.endtime }</strong> -
								${task.name }
							</span>
						</div>
						</c:forEach>
					</div>
					<script type="text/javascript">
						$(document).ready(function(){
							$(".passtask").click(function(){
								var tid = $(this).val();
								$.post("delTask.action",{
									"tid":tid
								},function(data){
									if(data) {
										$("#" + tid).hide(500);
									}
								});
							});
						});
					</script>
					<script type="text/javascript">
						$(document).ready(function(){
							$(".mtask").click(function(){
								var tid = $(this).val();
								$.post("editTask.action",{
									"tid":tid
								},function(data){
									if(data) {
										$("#" + tid).parent().hide(500);
									}
								});
							});
						});
					</script>
			</div>			
		</div>
	</div>
	</div>
	</div>
</body>
</html>