<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>事件评论</title>
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
		#note_content{
			height: 100px;
		    margin: 0;
		    width: 90%;
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
				
				
			</div>
			<div class="sidebar">
				<div class="well">
					<div class="title">这件事情是关于</div>
					<table>
						<thead>
							<tr>
								<td><img src="img/contact.ico" style="width:35px;height:35px;margin:5px;"/></td>
								<td>
									<a href="#">璐璐</a><br/>
									<a href="#">凯盛科技</a><br/>
									<span>软件工程师</span>
									</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="right-top ">
				<span style="float:left;font-size:24px;">露露的事件</span>
				<a href="message.action?pid=${productid }&i=2" style="float:right;" >删除</a><span style="float:right;margin:0px 5px">|</span>
				<a href="message.action?pid=${productid }&i=2" style="float:right;" >编辑</a>
				<div style="line-height:45px;margin-left:140px;">岳金鹏 添加 于 18:07</div>
				
			</div>
				<div style="padding:20px;"><p>事件的内容</p></div>
				<div style="margin:8px 20px">2个评论</div>
				<hr style="margin:0px;">
			<table class="table">
				<thead>
					<tr style="line-height:20px;">
						<td width="10%" ><img alt="" src="img/contact.ico" style="margin:10px;"></td>
						<td width="70%"><span>20:08</span><br><span>tom</span><br><sapn>评论内容</sapn></td>
						<td width="10%"  style="padding-top:33px;"><a class="icon-trash" href="#"></a></td>
					</tr>
					
				</thead>
			</table>
			<form action="#">
				<div class="well" >
					<div style="width:40px;"><img src="img/contact.ico"/></div>
					
						<div class="controls" >
							<textarea rows="20" name="note[content]" id="note_content" cols="40" class="text required content"></textarea>
							<input type="submit" value="添加评论" class="pull-right btn  btn-primary" style="margin-top:20px;height:60px;">
							</div>
					<div>
					
					</div>
				</div>
				
			</form>
			</div>
				
	</div>
		
	
</body>
</html>