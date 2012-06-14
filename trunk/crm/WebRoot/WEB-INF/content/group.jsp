<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			#admin{
		    background-color: transparent;
		    border-radius: 0 0 0 0;
		    cursor: pointer;
		    height: auto;
		    line-height: normal;
		    margin: 3px 0;
		    padding: 0;
		    width: auto;
		}
		table td div.name {
	    font-size: 14px;
	    font-weight: bold;
   		 margin-bottom: 5px;
		}
		h1 {
		    font-size: 30px;
		    line-height: 36px;
		}
	</style>
</head>
<body>
	<%@include file="head/head.jsp" %>

	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>${product.name }</h2>
				</div>
				
			</div>
			<div class="sidebar">
				<div class="well">
					<div class="title">什么是组？</div>
					<p>
						组可以用来对事件、联系人、公司或机会设置权限。例如，如果您想让某个事件只对管理人员可见，那么您可以建一个‘管理人员’的组，然后设置该事件的权限只对‘管理人员’组可见。
					</p>
				</div>
				
				
			</div>
		</div>
		<div class="right">
			<div class="right-top "><span style="font-size:24px;">组</span>
				<form action="addgroup.action" style="float:right">
					<input style="width:130px;margin-bottom:0px" type="text" name="groupname">
					<input type="submit" class="btn btn-primary" value="添加组">
				</form>
				</div>
		<div id="main" class="main">
			<c:if test="${empty groups }">
				<h1 style="margin-top:10px;">用组来简化权限控制。</h1>
				组可以用来对事件、联系人、公司或机会设置权限。例如，您想写一个事件只对管理人员可见。您可以建一个“管理人员”组，然后将该事件的权限设置为只对“管理人员组”可见。 
			</c:if>
			
			<table class="table crm-table">
				<tbody>
				<c:forEach items="${groups }" var="group">
				<tr>
					<td>
						<div class="name"><a href="enterGroup.action?id=${group.id }">${group.name }</a></div>
						<c:forEach items="${group.users }" var="user">
						${user.username },
						</c:forEach>
					</td>
					<td class="actions">
						<a title="删除这个组" id="del" rel="${group.id }" data-method="delete" data-confirm="您确定要删除这个组吗？" class="icon icon-trash" href="javascript:;"></a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>			
	</div>
</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#del").click(function() {
				if(confirm("确定要删除吗？")) {
					return false;
				}
			});
		});
	</script>
</body>
</html>