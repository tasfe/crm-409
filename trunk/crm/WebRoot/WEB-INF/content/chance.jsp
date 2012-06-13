<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>机会</title>
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
			height:60px;
			line-height:30px;
			padding:8px 25px;
			background: none repeat scroll 0 0 #F0F5F8;
			border-bottom: 1px solid #DADEE5;
			border-radius: 6px 6px 0 0;
		}
		#chances .actions .label {
			font-size: 14px;
			font-weight: normal;
			padding: 2px 10px 3px;
		}
		.main {
			padding: 20px 20px 0;
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
		select{
			width:100px;
		}
	</style>
</head>
<body>

	<%@include file="head/head.jsp" %>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>公司名</h2>
				</div>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="">业务机会</a></li>
					
					<li><a href="#">创建机会</a></li>
					<li><a href="#">清除过滤显示所有机会</a></li>
					<li><a href="#">导出机会</a></li>
				</ul>
			</div>
			<div class="sidebar">
				<div class="well" style="background-color:#f5f5f5;">
					<div class="title">过滤条件↓<span class="pull-right"><a href="" style="font-size:12px;">清除过滤条件</a></span></div>
					<div class="control-group select optional " >
						<label class="select optional control-label">状态</label>
						<div class="controls" >
							<select onchange="window.location='/chances?filter=on&amp;page=1&amp;state=' + $(this).val()" name="state" id="state" ><option selected="selected" value="">所有状态</option>
								<option value="pending">跟踪</option>
								<option value="won">成功</option>
								<option value="lost">失败</option></select>
						</div>
					</div>
					
					<div class="control-group select optional">
						<label class="select optional control-label">分类</label>
						<div class="controls">
							<select onchange="window.location='/chances?filter=on&amp;page=1&amp;state=&amp;category_id=' + $(this).val()" name="category_id" id="category_id"><option value="">所有分类</option>
							<option value="25178">爱</option>
							<option value="none">--- 无 ---</option></select>
						</div>
					</div>
					
					<div class="control-group select optional">
						<label class="select optional control-label">负责人</label>
						<div class="controls">
							<select onchange="window.location='/chances?filter=on&amp;page=1&amp;state=&amp;assigned_user_id=' + $(this).val()" name="assigned_user_id" id="assigned_user_id"><option value="任何人">任何人</option>
							<option value="none">--- 无 ---</option><optgroup label="组"><option value="g-536">后台</option>
							<option value="g-537">前台</option></optgroup><optgroup label="同事"><option value="u-5861">我</option>
							<option value="u-5863">陈路</option></optgroup></select>
						</div>
					</div>
					
					<div class="control-group select optional">
						<label class="select optional control-label">时间</label>
						<div class="controls">
							<select onchange="window.location='/chances?filter=on&amp;page=1&amp;state=&amp;time=' + $(this).val()" name="time" id="time"><option value="">所有时间</option>
								<option value="7">最近一周</option>
								<option value="30">最近一个月</option>
								<option value="90">最近三个月</option>
								<option value="6m">最近六个月</option>
								<option value="year">今年</option>
								<option value="lyear">去年</option></select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="right-top "><span style="font-size:24px;">业务机会</span>
				<div>2个机会，价值￥2050.0</div>
			</div>
			
			<div id="main" class="main">
			
				<table id="chances" class="table ">
					<tbody><tr>
						<td>
							<h4>
					<a href="/chances/4129">求爱</a>
					
				</h4>
				
				
					<div>低的奋斗 </div>
				<div>
						<span class="label" style="background:#46647C;">爱</span>
					￥2000.0
				</div>
					<div>由 岳金鹏 负责</div>
			</td>
			<td style="width:60px" class="actions">
				<span class="label label-success">成功</span>
			</td>
		</tr>
		<tr>
			<td>
				<h4>
					<a href="/chances/4130">送我东西</a>
					
				</h4>
				
					来自
					<a href="https://1339057988.workxp.info/people/480962">盼盼</a> 
				
					<div>仙人球</div>
				<div>
						<span class="label" style="background:#46647C;">爱</span>
					￥50.0
				</div>
					<div>由 岳金鹏 负责</div>
			</td>
			<td style="width:60px" class="actions">
				<span class="label label-pending">跟踪</span>
			</td>
		</tr>
	</tbody></table>
	

					</div>
				
		</div>
		</div>
	</div>
	
</body>
</html>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
