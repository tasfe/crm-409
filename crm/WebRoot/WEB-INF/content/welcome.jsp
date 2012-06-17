<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>欢迎界面</title>
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
	<%@include file="head/head.jsp"%>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h3>${sessionScope.product.name} </h3>
				</div>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="">欢迎页面</a></li>
					
					<li><a href="worker.action">邀请同事</a></li>
					<li><a href="useredit.action">上传头像</a></li>
				</ul>
			</div>
			<div class="sidebar">
				<div class="well">
					<div class="title">什么是联系人？</div>
					<p>
						联系人是一个通用的概念，可以是客户，顾客，合作伙伴，供应商，学生，患者，同学，朋友等。
					</p>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="right-top "><span style="float:left;font-size:24px;">从这里开始</span>
			<a href="message.action?pid=${productid }&i=2" style="float:right;" >不要显示此向导页面</a></div>
			<div class="right-center "><h3><a href="toaddcontact.action">添加联系人 »</a></h3><p>我们的工作是以人为本</p></div>
			<div class="right-center2"><h3>维系客户关系，提升客户关怀</h3><p>把事情变得简单</p>
				<table width="100%">
					<tbody><tr>
						<td><img src="img/sliver-people.png"></td>
						<td><img src="img/sliver-history.png"></td>
						<td><img src="img/sliver-tasks.png"></td>
					</tr>
					<tr>
						<td>
							<h4>共享的通讯录</h4>
							<p>积累客户信息<br>并且在团队内部分享</p>
						</td>
						<td>
							<h4>联系记录</h4>
							<p>记录所有的联系过程<br>（会议，电话，邮件，面谈...）</p>
						</td>
						<td>
							<h4>任务和提醒</h4>
							<p>不用再担心忘记任何重要事情</p>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
				
		</div>
		</div>
	</div>
	
</body>
</html>