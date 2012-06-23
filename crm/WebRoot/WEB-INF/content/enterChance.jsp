<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>进入机会</title>
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
			height:80px;
			line-height:30px;
			padding:8px 25px;
			background: none repeat scroll 0 0 #F0F5F8;
			border-bottom: 1px solid #DADEE5;
			border-radius: 6px 6px 0 0;
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
		#search{
			border-radius: 14px 14px 14px 14px;
			width:110px;
		}
		.dropdown a{
			margin-right:30px;
		}
		.change-img{
			background: url("img/workxp_sprites.png") no-repeat scroll -224px -56px transparent;
			display: inline-block;
			padding-top: 55px;
			width: 55px;
		}
		.main{
			padding: 20px 20px 0;
		}
		textarea.content {
			height: 100px;
			margin: 0;
			width: 100%;
		}
		input, textarea, select, .uneditable-input {
			background-color: #FFFFFF;
			border: 1px solid #CCCCCC;
			border-radius: 3px 3px 3px 3px;
			color: #555555;
			
		}
		legend {
		    font-size: 14px;
		    font-weight: bold;
		    margin-bottom: 10px;
		}
		.clear{
			clear:both;
		}
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="chance" name="tag"/>
	</jsp:include>
	<div id="mapp">
		<div class="left ">
			<div class="well sidebar" style="margin-top:0px;">
			<div class="title">
				<span><a class="pull-right" href="#taskModal" data-toggle="modal">添加任务</a></span>
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
				待办任务
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
			
			<div class="sidebar" style="padding:8px;">
				
				<div id="background_container">
					<div class="title">
			  		背景信息
				  	</div>
				  	<div id="background_info"><p>${chance.content } </p></div>
				</div>
				
			</div>
			
			<div class="well" id="show_contacts_in_collection">
				<div class="title">
					相关联系人
				</div>
			
				<table class="table crm-table involvements">
					<tbody>
					<tr id="involvement-480968">
						<td class="avatar">
							<a class="quick-view" data-id="480968" href="#">
								<span style="display: inline-block;border:1px solid #CCCCCC;background: url('img/workxp_sprites.png') no-repeat -112px -148px transparent; width: 32px; padding-top: 32px;font-size:1px"></span>
							</a>
						</td>
						<td>
							<h4><a href="">${chance.contact.name }</a></h4>
							<a href="">${chance.contact.company.name }</a><br>
							${chance.contact.position }
						</td>
						<td class="actions">
							
						</td>
					</tr>
				</tbody></table>
			</div>
		</div>
		<!--网页右边-->
		<div class="right">
			<div class="right-top ">
				<span class="change-img"></span>
				<div style="font-size:24px;margin:-60px 70px;">
						${chance.name }
				</div>
				<div class="clear"></div>
				<div style="font-size:14px;margin-top:40px;margin-left:68px;width:300px;float:left;" class="details">
							<span class="label">${chance.chancesorts.name }</span> -
						￥${chance.money }
				</div>
				<div data-toggle="buttons-radio" class="btn-group state-switcher" style="width:300px;float:left; margin-top:40px;">
					<c:choose >
						<c:when test="${chance.state == 'a' }">
							<button class="btn pending active">跟踪</button>
						</c:when>
						<c:otherwise>
							<button class="btn pending">跟踪</button>
						</c:otherwise>
					</c:choose>
					<c:choose >
						<c:when test="${chance.state == 'b' }">
							<button state="won" class="btn success active">成功</button>
						</c:when>
						<c:otherwise>
							<button state="won" class="btn success ">成功</button>
						</c:otherwise>
					</c:choose>
					<c:choose >
						<c:when test="${chance.state == 'c' }">
							<button state="lost" class="btn important active">失败</button>
						</c:when>
						<c:otherwise>
							<button state="lost" class="btn important">失败</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="pull-right">
							由 <strong>${chance.user.username }</strong> 添加 |
						<a rel="tooltip" href="editChance.action" data-original-title="修改机会"><i class="icon icon-edit"></i></a>
				</div>
			</div>
			<div class="main">
				<div class="controls">
				<textarea rows="20" name="note[content]" id="note_content" cols="40" class="text required content"></textarea>
				</div>
				<div class="submit pull-right" style="margin-top:10px;">
					<input type="submit" value="添加事件" name="commit" data-loading-text="处理中.." class="btn btn-primary">
			</div>
		<hr style="margin:50px 0px 10px 0px;">
			
			<table style="margin-bottom: 60px" class="table top no-hover" id="activities">
				<tbody>
					<tr>
						<td class="icon"><span class="sprite chance"></span></td>
						<td>
								机会 求爱 的状态改为 '成功'
								<span>岳金鹏 更新<span>
							<span>于 06-07 星期四</span>
						</span></span></td>
					</tr>
				</tbody>
				</table>
			
		</div>
		</div>
	</div>
	
</body>
</html>
