<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>任务</title>
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
			height:550px;
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
		table.tags td {
			line-height: 24px;
		}
		div.filter-desc {
			color: #888888;
			padding: 2px 0;
		}
		.task_actions {
			display: none;
			font-size: 12px;
			height: 22px;
			left: -55px;
			padding: 5px 0 0 7px;
			position: absolute;
			top: -5px;
			vertical-align: middle;
			width: 48px;
		}
		
		#search{
			border-radius: 14px 14px 14px 14px;
			width:110px;
		}
		.dropdown a{
			margin-right:30px;
		}
		.sxing{
			width:200px;
			height:34px;
			padding-left:10px;
			line-height:30px;
		}
		input, textarea, select, .uneditable-input {
			background-color: #FFFFFF;
			border: 1px solid #CCCCCC;
			border-radius: 3px 3px 3px 3px;
			color: #555555;
			
		}
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="task" name="tag"/>
	</jsp:include>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>通讯录</h2>
				</div>
				<ul class="nav nav-tabs nav-stacked">
					<li ><a id="dtask" href="javascript:;">待办任务</a></li>
					<li ><a id="ctask" href="javascript:;">已完成任务</a></li>
					<li ><a id="mytask" href="javascript:;">我分配的任务</a></li>
					<li><a href="#taskModal" data-toggle="modal">添加任务</a></li>
				</ul>
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
			</div>
		</div>
		<!--筛选任务-->
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:30px;">
			<span style="float:left;font-size:20px;">待办任务</span>
			<div style="float:right;">
				分类为
				<select  name="task" id="taskid" style="width:141px;">
					<option value="">所有</option>
					<option value="25149">感谢</option>
					<option value="25150">试用</option>
				</select>
			</div>
			</div>
			
			<!--任务分类显示-->
			<div id="main" class="main">	
			<div id="upcoming_tasks">
				<div id="screen_body">
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
					<div class="tasks today" id="taskcontent">
					<c:forEach items="${tasks }" var="task">
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
					</c:forEach>
					</div>	
					
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
					
					
					<div class="tasks today" id="mytaskcontent" style="display:none">
					<c:forEach items="${myTasks }" var="task">
					<legend>${task.createtime }</legend>
					<div class="task checkbox" id="task_23333">
						<span class="task_hover">
								<div class="task_actions" style="display: none;">
									<a title="删除这个任务" class="icon icon-trash" href=""></a>
									<a class="edit" href="">编辑</a>
								</div>
							
							<input type="checkbox" value="1"  name="task_done" id="task_done_23333" data-confirm="您确定要完成分配给 陈路 的任务吗？">
								<span class="label" style="background:#A5460D;">${task.tasksort.name }</span>
							${task.name }
						</span>
					</div>
					</c:forEach>
					</div>	
				</div>
				<div class="tasks today" id="completeTask" style="display:none" style="display:none">
					<c:forEach items="${completeTasks }" var="task">
					<legend>${task.createtime }</legend>
					<div class="task checkbox" id="${task.id }">
						<span class="task_hover">
								<div class="task_actions" style="display: none;">
									<a title="删除这个任务" class="icon icon-trash" href=""></a>
									<a class="edit" href="">编辑</a>
								</div>
							
							<input type="checkbox" value="${task.id }"  name="task_done" id="task_done_23333" class="passtask">
								<span class="label" style="background:#A5460D;">${task.tasksort.name }</span>
							${task.name }
						</span>
					</div>
					</c:forEach>
					</div>	
				</div>
				
				<script charset="utf-8" type="text/javascript">
					$(document).ready(function() {
						$("#mytask").click(function(){
							$("#taskcontent").hide();
							$("#completeTask").hide();
							$("#mytaskcontent").show();
						});
						
						$("#dtask").click(function(){
							$("#mytaskcontent").hide();
							$("#completeTask").hide();
							$("#taskcontent").show();
						});
						$("#ctask").click(function(){
							$("#mytaskcontent").hide();
							$("#taskcontent").hide();
							$("#completeTask").show();
						});
						
					});
				</script>
			</div>
		</div>
			
			
		</div>
		
		<div class="right2 sidebar" style="margin-top:0px;">
			<div class="well" id="tasks_div" style="background-color: #F5F5F5;">
				<div class="title" >
					订阅您的日程安排
				</div>
				<p>
					您可以使用 Google Calendar, Apple iCal, Mozzila Calendar 等支持 iCalendar 格式的工具来 
					<a href="/tasks/subscription">订阅您的日程安排</a>。
				</p>
			</div>			
		</div>
	</div>
	
</body>
</html>