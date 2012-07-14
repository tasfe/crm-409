<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>新建机会</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script type="text/javascript" src ="js/jQuery.js"></script>
	<script type="text/javascript" src ="js/bootstrap.min.js"></script>
	<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript" src="js/textarea.js"></script> 
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
			margin-top:-12px;
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
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="chance" name="tag"/>
	</jsp:include>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>${product.name }</h2>
				</div>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="">创建机会</a></li>
					
				</ul>
			</div>
			<div class="sidebar">
				<div class="well">
					<div class="title">什么是机会？</div>
					<p>
						机会即业务机会或商业机会，比如一笔可能成交的业务或项目。

						机会通常跟一个联系人相关，您需要先将这个联系人添加到系统。

						在输入联系人时，系统会根据已输入的内容自动查找联系人，并以下拉列表的形式显示出来，您可以从中选取一个。

						您可以根据自己的业务情况给机会添加分类。比如按产品分类、按重要程度或行业分类。
					</p>
				</div>
			</div>
		</div>
		<!--网页右边-->
		<div class="right">
			<div class="right-top "><span class="change-img"></span><div style="font-size:24px;margin:-40px 70px;">机会创建</div></div>
			<div class="main">
		<div style="padding:0 68px;">
			<form method="post" id="chance_form" class="simple_form form-vertical" action="addc.action" >
				
				<div class="control-group string optional  marco_polo_container">
					<label for="chance_contact" class="string optional control-label"> 联系人</label>
					<div class="controls">
						<input type="text" name="contact_name" id="contact_name" >
						<p class="help-block">输入联系人姓名或公司名称</p>
					</div>
				</div>
				<div class="control-group string required">
					<label for="chance_name" class="string required control-label">
						<abbr title="required">*</abbr> 机会名称</label>
						<div class="controls">
							<input type="text" size="50" name="chance.name" id="chance_name" class="string required input-xlarge">
						</div>
				</div>

				<div class="control-group text optional">
					<label for="chance_description" class="text optional control-label"> 机会描述或背景信息</label>
					<div class="controls">
						<textarea rows="20" name="chance.content" id="textarea" cols="40" class="text optional content"></textarea>
					</div>
				</div>
				
				<div class="control-group float optional"><label for="chance_price" class="float optional control-label"> 金额</label>
					<div class="controls">
						<div class="input-prepend">
							<input type="text" name="chance.money" id="chance_price" class="numeric float optional price" style="width:200px">
							<span class="add-on">元</span>
						</div>
					</div>
				</div>		
				<!-- 分类 -->
				<div class="control-group integer optional">
					<label for="chance_category_id" class="integer optional control-label"> 分类</label>
					<div class="controls">
					<select name="chancesortid" id="chance_category_id">
						<option value="">无</option>
						<c:forEach items="${chanceSorts }" var="chanceSort">					
							<option value="${chanceSort.id }">${chanceSort.name }</option>
						</c:forEach>	
					</select>
					<a href="chancesort.action">编辑分类</a>
					</div>
				</div>		
				<!-- 负责人 -->
				<div class="control-group select optional">
				<label for="chance_assigned_user_id" class="select optional control-label"> 谁负责？</label>
				<div class="controls">
					<select name="managerid" id="chance_assigned_user_id" class="select optional">
						<option value="">无</option>
						<c:forEach items="${userProducts }" var="userProduct">
								<option value="${userProduct.user.id }">${userProduct.user.username }</option>
						</c:forEach>
					</select>
				</div>
				</div>
						
					<div class="control-group string optional">
						<label for="person_access_policy" class="string optional control-label"> 谁可以看见？</label>
						<div class="controls">
							<div class="radio scope activated">
								<input type="radio" value="all" name="role" id="all" checked=""> 所有同事
							</div>
							<div class="radio scope ">
								<input type="radio" value="me" id="me" name="role"> 只有我能看见
							</div>
							<div class="radio scope ">
								<input type="radio" value="group"name="role" id="groupselect"> 选择一个组...
								<div class="editor">
								<select name="groupid" id="groupname" class="named_group" style="width:100px;display:none">
									<option value="">选择一个组</option>
									<c:forEach items="${groups }" var="group">
										<option value="${group.id }">${group.name }</option>
									</c:forEach>
								</select> 
								</div>
							</div>
							<div class="radio scope  ">
								<input type="radio" value="user" name="role" id="workerselect"> 选择同事...
								<div class="editor">
									<select name="userid" id="workername" class="new_adhoc_group_member" style="width:100px;display:none">
										<option selected="selected" value="">选择一个同事...</option>
										<c:forEach items="${userProducts }" var="userProduct">
											<c:if test="${userProduct.user.id != user.id}">
												<option value="${userProduct.user.id }">${userProduct.user.username }</option>
											</c:if>
										</c:forEach>
									</select> 
								</div>
							</div>
							
						</div>
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
						});
					</script>
		<div class="form-actions">
			<input type="submit" value="添加这个机会" class="btn btn-primary">
			<a class="btn" href="chance.action">取消</a>
		</div>
		</form>
		</div>
		</div>
			
		</div>
		</div>
	</div>
	
</body>
</html>
