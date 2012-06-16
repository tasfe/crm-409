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
		legend {
		    font-size: 14px;
		    font-weight: bold;
		    margin-bottom: 10px;
		    margin-top:20px;
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
			<ul class="nav nav-tabs nav-stacked">
					<li >
					<a href="javascript:;" class="modifygroupname" style="font-size:14px;">修改组名</a></li>
					
					<select name="" id="addwo" style="width:100%;">
						<option value="1">添加一个同事</option>
						<c:forEach items="${userProducts}" var="userproduct">
						<option value="${userproduct.user.id }">${userproduct.user.username }</option>
						</c:forEach>
					</select>
				</ul>
		</div>
		<div class="right">
			<div class="right-top "><span style="font-size:24px;" id="nowname">${group.name }</span>
				<a href="javascript:;" class="modifygroupname" style="float:right;" >修改名称</a>
				<div id="modifyinput" style="margin:0;padding:0;display:none">
					<form action="modifyname.action" method="post" id="renameform" >
						<input type="hidden" name="gid" value="${group.id }">
						<input style="margin-bottom:0px" type="text" value="${group.name }" size="30" name="groupname" id="groupname">
						<input type="button" value="重命名" id="rename" class="btn btn-primary">
						<a  href="javascript:;" id="cancle" class="btn">取消</a>
					</form>
				</div>
			</div>
		<div id="main" class="main">
			<legend>本组的同事</legend>
			<table class="table crm-table">
				<tbody>
				<input type="hidden"  id = "groupid" value="${group.id }"/>
				<c:forEach items="${group.users }" var="user">
				<tr>
					<td width="10%">
						<span style="display: inline-block; width: 50px; font-size:1px">
							<img src="head.action?id=${user.id } " style="margin:0px;"/>
						</span>
					</td >
					<td width="80%">
						<div class="name">${user.username }</div>
						
					</td>
					
					<td class="actions">
						<a title="删除此用户" class="icon icon-trash" href="delWorker.action?uid=${user.id }&gid=${group.id}"></a>
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
			$("#addwo").change(function(){
				
				$.post("addWorker.action",
					{
					  "uid":$("#addwo").val(),
					  "gid":$("#groupid").val()  
					},function(data){
						var tr = $("<tr>");
						$(".table").append(tr);
						var td1 = $("<td width='10%'></td>");
						tr.append(td1);
						var span1 = $("<span style='display: inline-block; width: 50px; font-size:1px'></span>");
						td1.append(span1);
						var img = $("<img style='margin:0px;'/>");
						img.attr("src",'head.action?id=' + data.id);
						span1.append(img);
						var td2 = $("<td width='10%'></td>");
						tr.append(td2);
						var div = $("<div class='name'></div>");
						div.text(data.username);
						td2.append(div);
						var td3 = $("<td class='actions'></td>");
						td3.append($("<a title='删除此用户' id='del' class='icon icon-trash' href='javascript:;'></a>").attr("rel",data.id));
						tr.append(td3);
					});
			});
			
			$(".modifygroupname").click(function(){
				$("#modifyinput").css("display","inline");
			});
			
			$("#cancle").click(function(){
				$("#modifyinput").hide(800);
			});
			
			$("#rename").click(function(){
				if($("#nowname").text() != $("#groupname").val()) {
					$("#renameform").submit();
				}
			});
		});
	</script>
</body>
</html>