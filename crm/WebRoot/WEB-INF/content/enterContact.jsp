<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			min-width:200px;
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
		element.style {
	  	  width: 100%;
		}
		table {
		    background-color: transparent;
		    border-collapse: collapse;
		    border-spacing: 0;
		    max-width: 100%;
		}
		.right-top .right-links {
		    color: #666666;
		    float: right;
		    font-size: 12px;
		    font-weight: normal;
		}
		.right-top span {
		    color: #888888;
		    display: block;
		    font-size: 12px;
		}
		textarea {
		    height: 100px;
		    margin: 0;
		    width: 97%;
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
					<h2>联系人姓名</h2>
				</div>
				<ul class="nav nav-tabs nav-stacked">
					<li ><a href="addTask.action">添加任务</a></li>
					<li ><a href="addChance.action">添加机会</a></li>
					<li><a href="addEvent.action" data-toggle="modal">添加事件</a></li>
					<li><a href="addImporyDate.action" data-toggle="modal">添加重要日期</a></li>
					<li ><a href="addContact.action">添加联系人</a></li>
					
				</ul>
			</div>
		</div>
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:103px;">
			<table style="width:100%;">
				<tbody>
					<tr>
						<td width="68" style="vertical-align:top;">
							<div data-id="481213" data="" class="contact-avatar-container">
								<span style="display: inline-block;border:1px solid #CCCCCC;background: url('/assets/workxp_sprites.png') no-repeat 0px 0px transparent; width: 55px; padding-top: 55px;font-size:1px"></span>
							</div>
						</td>
						<td>
							<div class="right-links">
										由 <strong>我</strong> 添加 |
									<a data-original-title="修改联系人" rel="tooltip" href="https://1339070059.workxp.info/companies/481213/edit"><i class="icon icon-edit"></i></a>
							</div>
							<h3>2人小组</h3>
							<span>
								<div class="tags">
									<div class="list" id="show_tags">
										<i class="icon-tags"></i>
										<a id="show_tag_1699" class="label" href="">hehehe </a>
										<a href="">编辑标签</a>
									</div>
									<div style="display:none" class="well" id="edit_tags">
										<a onclick="$('#show_tags').toggle(); $('#edit_tags').toggle();return false;" href="https://1339070059.workxp.info/companies/481213#" class="close">×</a>
										<div id="deletable_tags">
											<span class="label" style="display:inline;margin-right:4px;" id="tag_1699">
												<a title="删除这个标签" style="float:none;font-size:14px;color:#FFF;opacity:1" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这个标签吗?" class="close" href="https://1339070059.workxp.info/tags/1699?tag_name=hehehe+&amp;target_id=481213&amp;target_type=Company">×</a>
												<a class="label" onclick="return false" href="https://1339070059.workxp.info/companies/481213#">hehehe </a>
											</span>
										</div>
										<div class="">
											一次添加一个标签:
										</div>
										<form novalidate="novalidate" method="post" id="tag_form" data-remote="true" class="simple_form form-inline" action="https://1339070059.workxp.info/tags" accept-charset="UTF-8"><div style="margin:0;padding:0;display:inline"><input type="hidden" x-webkit-speech="" value="✓" name="utf8"><input type="hidden" x-webkit-speech="" value="1gmXEf+H1dVZVOdx2t9smP4EQb1UJwS7rqIccHM40FI=" name="authenticity_token"></div>
											<input type="hidden" x-webkit-speech="" value="Company" name="target_type" id="target_type">
											<input type="hidden" x-webkit-speech="" value="481213" name="target_id" id="target_id">
											<input type="text" x-webkit-speech="" size="30" name="tag[name]" id="tag_name" class="input-medium required" autocomplete="off">
											<button data-loading-text="处理中.." class="btn" type="submit"><li class="icon-tag"></li> 添加</button>
										</form>
									</div>
								</div>
							</span>
						</td>
					</tr>
				</tbody>
				</table>	
				<ul class="nav nav-tabs details-tab" style="margin-top:6px">
				      <li class="">
				        <a data-toggle="tab" href="#home">事件 &amp; 邮件</a>
				      </li>
				      <li class="">
				        <a data-toggle="tab" href="#contact">
				         	 联系人 (2)
				        </a>
				      </li>
				      <li class="">
					      <a data-toggle="tab" href="#service">
					     	   业务机会 
					      </a>
				      </li>
				      <li class="active">
				        <a data-toggle="tab" href="#date">重要日期</a>
				      </li>
		    	</ul>
			</div>
			<div id="main" class="main">
				<div class="tab-content" id="myTabContent">
		            <div id="home" class="tab-pane fade active in">
		            	<form action="" method="post">
			          		<div class="controls">
				          		<textarea rows="20" name="" id="" cols="40" class="text required content">
				          		</textarea>
			          		</div>
			          		
			          		
			          		
			          		<div class="new_note_form_basics" style="margin-top:8px;">
								<div class="" style="float: right;">
									<input type="submit"  value="添加事件" class="btn btn-primary">
								</div>
								<div class="action">
									<a id="show_options_link" href="javascript:;">显示选项</a>
								</div>
							</div>
		          		</form>
		          		
		          		
		          		
		            </div>
		            <div id="contact" class="tab-pane fade">
		              联系人
		            </div>
		            <div id="service" class="tab-pane fade">
		              业务机会
		            </div>
		            <div id="date" class="tab-pane fade">
		              重要日期
		            </div>
		         </div>	
			</div>
			
			
			
		</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".show_options_link")
			});
		</script>
		<div class="right2 sidebar" style="margin-top:0px;width:25%">
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