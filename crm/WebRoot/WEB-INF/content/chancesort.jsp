<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="task" name="tag"/>
	</jsp:include>
	<div id="mapp">
	
		<!--筛选任务-->
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:30px;">
			<span style="float:left;font-size:20px;">机会分类</span>
			
			</div>
			
			<!--任务分类显示-->
			<div id="main" class="main">	
				<p>修改分类会影响到同事们的机会。比如，如果您将“设计”改为“LOGO设计”，所有分类为“设计”的机会都将改为“LOGO设计”。 请确认您的修改会通知到所有同事。</p>
				<div class="new">
					<form method="post" id="category_form" class="well form-inline" action="addChanceSort.action">
						<input placeholder="添加一个任务分类..." id="chancesort"  name="chancesort">
						<button  class="btn" type="submit">添加</button>
					</form>
				</div>
				<table class="table" id="sorttable">
					<c:forEach items="${chanceSorts }" var="chancesort">
			          <tr>
			            <td>${chancesort.name }</td>
			            <td class="actions" style="text-align:right;display:none">
							<a rel="${chancesort.id }" id="${chancesort.id }" class="icon icon-trash del" href="javascript:;" ></a>
						</td>
			          </tr>
			          </c:forEach>
			        </tbody>
			     </table>
				
			</div>
			
			<script type="text/javascript">
				$(document).ready(function(){
					$(".del").click(function(){
						var rel = $(this).attr("rel");
						$.post("delChanceSort.action",{
							"id" : rel
						},function(data){
							if(data) {
								$("#" + rel).parent().parent().remove();
							}
						});
					});
				});
			</script>
			
			</div>
		</div>
	
</body>
</html>