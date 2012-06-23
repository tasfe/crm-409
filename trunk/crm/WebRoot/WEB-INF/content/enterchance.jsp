<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
				待办任务
			</div>

		<div id="upcoming_tasks">
			<div id="screen_body">
			
			<div class="tasks today">
			<legend>今天</legend>
			<div class="task checkbox" id="task_24561">
			<span class="task_hover">
					<div class="task_actions" style="display: none;">
						<a title="删除这个任务" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这个任务吗？" class="icon icon-trash" href="/tasks/24561"></a>
						<a data-remote="true" class="edit" href="/tasks/24561/edit?context=target&amp;target_id=4129&amp;target_type=Chance">编辑</a>
					</div>
				
				<input type="checkbox" value="1" onclick="done_task(24561, 5863, 5861)" name="task_done" id="task_done_24561" data-confirm="您确定要完成分配给 陈路 的任务吗？">
					<span class="label" style="background:#C50000;">电话</span>
							岳金鹏:
						add what
					</span>
				
				</div>
			</div>
		</div>
	</div>
			</div>
			
			<div class="sidebar" style="padding:8px;">
				
				<div id="background_container">
					<div class="title">
			  		<span><a class="pull-right" href="#">编辑</a></span>
			  		背景信息
				  	</div>
				  	<div id="background_info"><p>低的奋斗 </p></div>
				</div>
				
			</div>
			
			<div class="well" id="show_contacts_in_collection">
				<div class="title">
					<span><a class="pull-right" href="#">添加/删除</a></span>
					相关联系人
				</div>
			
				<table class="table crm-table involvements">
					<tbody><tr id="involvement-480968">
				<td class="avatar">
					<a class="quick-view" data-id="480968" href="#"><span style="display: inline-block;border:1px solid #CCCCCC;background: url('img/contact.ico') no-repeat -112px -148px transparent; width: 32px; padding-top: 32px;font-size:1px"></span></a>
				</td>
				<td>
					<h4><a href="https://1339057988.workxp.info/people/480968">璐璐</a></h4>
					<a href="/companies/480967">凯盛科技</a><br>
					软件工程师
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
						求爱
				</div>
				<div class="clear"></div>
				<div style="font-size:14px;margin-top:40px;margin-left:68px;width:300px;float:left;" class="details">
							<span class="label">亲亲</span> -
						￥2000.0
				</div>
				<div data-toggle="buttons-radio" class="btn-group state-switcher" style="width:300px;float:left; margin-top:40px;">
						<button data-loading-text="处理中.." state="pending" class="btn pending">跟踪</button>
						<button data-loading-text="处理中.." state="won" class="btn success active">成功</button>
						<button data-loading-text="处理中.." state="lost" class="btn important">失败</button>
				</div>
				<div class="pull-right">
							由 <strong>我</strong> 添加 |
						<a rel="tooltip" href="/chances/4129/edit" data-original-title="修改机会"><i class="icon icon-edit"></i></a>
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
