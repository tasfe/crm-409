<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>同事</title>
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
		input, textarea, select, .uneditable-input {
			background-color: #FFFFFF;
			border: 1px solid #CCCCCC;
			border-radius: 3px 3px 3px 3px;
			color: #555555;
			
		}
		textarea.content {
			height: 100px;
			margin: 0;
			width: 70%;
		}
		.main {
			padding: 0 20px 0;
			height:470px;
		}
		element.style {
		    display: inline-block;
		    font-size: 1px;
		    width: 55px;
		    padding-top:0px;
		    
		  }
		  .table th, .table td {
		  	border:none;
		    border-bottom: 1px solid #DDDDDD;
		    line-height: 18px;
		    padding-top: 8px;
		    text-align: left;
		    vertical-align: top;
			}
	</style>
</head>
<body>
	<%@include file="head/head.jsp" %>

	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>项目名称</h2>
				</div>
				
			</div>
			<div class="sidebar">
				<div class="well">
					<div class="title">用Email邀请同事</div>
					<p>
						被邀请同事会收到一封邀请邮件。访问邮件中的链接，默认用户名 邮件地址,默认密码000000，就可以开始使用了。
					</p>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="right-top "><span style="font-size:24px;">同事</span><a href="invite.action" style="float:right;">再邀请一个</a></div>
			
			<div id="main" style="padding: 20px 20px 0;" class="main">
				<form  method="post" id="user_form" action="sendMail.action" accept-charset="UTF-8">
					<input type="hidden" value="${product.id }" name="pid">
					<div class="control-groupoptional">
						<div class="controls">
							<input type="email" size="50" placeholder="请输入同事的Email" name="email" id="" >
						</div>
					</div>
					<div class="form-actions">
						<input type="submit" value="发送邀请" name="commit" class="btn btn-primary">
					</div>
				</form>
			</div>
	</div>
</div>
	
</body>
</html>