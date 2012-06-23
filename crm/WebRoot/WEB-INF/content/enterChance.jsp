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
				<form  method="post" id="task_form"  class="simple_form new_task" action="addChanceTask.action" >
					<div class="modal-header">
						<a data-dismiss="modal" class="close">×</a>
						<h3>添加一个任务</h3>
					</div>
				<input type="hidden" name="chanceid" value="${chance.id }">
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
							<h4><a href="enterContact.action?cid=${chance.contact.id }">${chance.contact.name }</a></h4>
							<a href="enterCompany.action?cmid=${chance.contact.company.id}">${chance.contact.company.name }</a><br>
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
							<button id="a" rel="${chance.id }" class="btn pending active">跟踪</button>
						</c:when>
						<c:otherwise>
							<button id="a" rel="${chance.id }" class="btn pending">跟踪</button>
						</c:otherwise>
					</c:choose>
					<c:choose >
						<c:when test="${chance.state == 'b' }">
							<button id="b" rel="${chance.id }" class="btn success active">成功</button>
						</c:when>
						<c:otherwise>
							<button  id="b" rel="${chance.id }" class="btn success ">成功</button>
						</c:otherwise>
					</c:choose>
					<c:choose >
						<c:when test="${chance.state == 'c' }">
							<button id="c" rel="${chance.id }" class="btn important active">失败</button>
						</c:when>
						<c:otherwise>
							<button id="c" rel="${chance.id }" class="btn important">失败</button>
						</c:otherwise>
					</c:choose>
				</div>
				
				<script type="text/javascript">
					$(document).ready(function(){
						$("#a").click(function(){
							if(confirm("确定要修改状态?")){
									var rel = $(this).attr("rel");
								$.post("modifyState.action",{
									"state" : "a",
									"chanceid" : rel
								},function(data){
									if(data) {
										$("#a").attr("class","btn important active");
										$("#b").attr("class","btn important");
										$("#c").attr("class","btn important");
									}
								});
							}
						
						});
						$("#b").click(function(){
							if(confirm("确定要修改状态?")){
								var rel = $(this).attr("rel");
							$.post("modifyState.action",{
								"state" : "b",
								"chanceid" : rel
							},function(data){
								if(data) {
									$("#b").attr("class","btn important active");
									$("#a").attr("class","btn important");
									$("#c").attr("class","btn important");
								}
							});
							} 
						});
						$("#c").click(function(){
							if(confirm("确定要修改状态?")){
							var rel = $(this).attr("rel");
							$.post("modifyState.action",{
								"state" : "c",
								"chanceid" : rel
							},function(data){
								if(data) {
									$("#c").attr("class","btn important active");
									$("#b").attr("class","btn important");
									$("#a").attr("class","btn important");
								}
							});
							}
						});
					});
				
				</script>
				<div class="pull-right">
							由 <strong>${chance.user.username }</strong> 添加 |
						<a rel="tooltip" href="editChance.action" data-original-title="修改机会"><i class="icon icon-edit"></i></a>
				</div>
			</div>
		<div class="main">
			  <form action="addChanceEvent.action" method="post">
		            	<input type="hidden" name="chanceid" value="${chance.id }">
			          		<div class="controls">
				          		<textarea rows="20" name="event.content" id="" cols="40" class="text required content">
				          		</textarea>
			          		</div>
			          		<div class="options" style="display:none">
			          			<div class="control-group optional">
			          			<label for="note_occurred_at_1i" class="optional control-label"> 什么时候发生的？</label>
			          				<div class="controls">
				          				<select name="year" id="" class="optional" style="width:15%">
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012" selected="selected">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										</select>
									<select name="month" id="" class="optional" style="width:15%">
										<option value="1">一月</option>
										<option value="2">二月</option>
										<option value="3">三月</option>
										<option value="4">四月</option>
										<option value="5">五月</option>
										<option value="6" selected="selected">六月</option>
										<option value="7">七月</option>
										<option value="8">八月</option>
										<option value="9">九月</option>
										<option value="10">十月</option>
										<option value="11">十一月</option>
										<option value="12">十二月</option>
									</select>
									<select name="day" id="" class="optional" style="width:15%">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18" selected="selected">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									</div>
								</div>
							
			          		</div>
							<div class="new_note_form_basics" style="margin-top:8px;">
								<div class="addevent" style="float: right;">
									<input type="submit"  value="添加事件" id="" class="btn btn-primary">
								</div>
								<div class="action">
									<a id="show_options_link" href="javascript:;">显示选项</a>
								</div>
							</div>
		          		</form>
	          		<table style="margin-bottom: 60px; margin-top: 10px;" class="table top no-hover" id="activities">
							<tbody>
							<!-- 事件列表 -->
							<c:forEach items="${events }" var="event">
							<tr class="note" data-from="Person" data="781881" id="note-781881">
									<td style="width:30px;height:50px;">
									<span ><img src="img/event.jpg"/></span>
									</td>
									<td>
										<div class="note-header">
											<div style="float:right">
												 <ul class="nav nav-pills">
												 	<li><a href="eventNote.action?eid=${event.id }">评论</a></li>
													<li><a title="编辑" href="eventEdit.action?eid=${event.id}">编辑</a></li>
										 			<li>
													<a title="删除" href="eventChaceDel.action?eid=${ event.id}&cid=${chance.id }">删除</a>
													</li>
												 </ul>
											</div>
											<div class="subject">
											<!-- 时间 -->
											${event.createtime }
											</div>
											<div class="meta">
													${event.user.username } 添加
											</div>
											<div class="meta">
											</div>
										</div>
										<div class="content">
											<p>${event.content }</p>
										</div>
									</td>
								</tr>
								</c:forEach>
								<!-- 事件结束 -->
							</tbody>
						</table>
					</div>
					
		            <script type="text/javascript">
		            	$(document).ready(function() {
						
							$("#groupselect").click(function() {
								$("#workername").hide();
								$("#groupname").toggle();
							});
							
							$("#workerselect").click(function() {
								$("#groupname").hide();
								$("#workername").toggle();
							});
							$("#all").click(function(){
								$("#groupname").hide();
								$("#workername").hide();
							});
							$("#me").click(function(){
								$("#groupname").hide();
								$("#workername").hide();
							});
							
							$("#show_options_link").click(function(){
								$(".options").show(500);
								$("#show_options_link").hide();
								$(".addevent").css("float","");
							});
						});
					</script>
		</div>
		</div>
	</div>
	
</body>
</html>
