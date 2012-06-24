<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>添加公司</title>
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
			padding: 20px 20px 0;
		}
		select{
			width:90px;
		}
	</style>
</head>
<body>
	<jsp:include page="head/head.jsp">
			<jsp:param value="contact" name="tag"/>
	</jsp:include>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h3>${sessionScope.product.name	 }</h3>
				</div>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class=""><a href="toaddcontact.action">添加联系人</a></li>
					
					<li class="active"><a href="#">添加公司</a></li>
					<li><a href="#">导入联系人</a></li>
				</ul>
			</div>
			
		</div>
		<div class="right">
			<div class="right-top "><span style="font-size:24px;">添加公司</span></div>
			
			<div class="main">
				<form  method="post" id="contact_form" class="simple_form form-horizontal" action="addCompany.action" >
					
					<div class="control-group string optional marco_polo_container">
						<label for="person_company" class="string optional control-label"> 名称</label>
						<div class="controls">
							<input type="text" name="company.name" id="company_name"  class="input-xlarge mp_input" ><ul class="typeahead dropdown-menu mp_list" style="display: none;"></ul>
							<input type="hidden" name="person[company_id]" id="person_company_id">
						</div>
					</div>
					<div class="control-group string optional marco_polo_container">
						<label for="person_phone" class="string optional control-label"> 电话</label>
						<div class="controls">
							<div id="contact_phone_list_company" class="contact_forms contact_phones">
									
									<div style="" class="contact_methods">
										<input type="text" size="30" name="tel" id="tel" class="autofocus">
											<select name="teltype" id="telsort" class="sssss">
												<option value="company">公司</option>
												<option value="work">工作</option>
												<option value="mobile">手机</option>
												<option value="fax">传真</option>
												<option value="home">住宅</option>
												<option value="other">其它</option>
											</select>
									</div>
									<div class="addtel" style="display:none"><a href="javascript:;">添加..</a></div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var temp = 0;
						$(document).ready(function(){
							$("#tel").focus(function(){
								if(temp == 0) {
									$(".addtel").show(500);
									temp = 1;
								}
							});
							$("#tel").blur(function(){
								temp = 0;
							});
							$(".addtel").click(function(){
								var div = $("<div class='contact_methods'></div>");
								$("#contact_phone_list_company").append(div);
								$("<input type='text' size='30' name='tel' id='tel' >").appendTo(div);
								var select = $("<select  id='telsort' name='teltype' style='width:90px'>");
								select.append("<option value='company'>公司</option>");
								select.append("<option value='work'>工作</option>");
								select.append("<option value='mobile'>手机</option>");
								select.append("<option value='fax'>传真</option>");
								select.append("<option value='home'>住宅</option>");
								select.append("<option value='other'>其它</option>");
								div.append(select);
								$("<span class='addremove'><a class='remove' href='javascript:;' onclick='deltel(this)'><img style='width:25px' src='img/cha.jpg'/></a></span>").appendTo(div);
								
							});
						});
						
						function deltel(obj) {
							var div =  obj.parentNode.parentNode;
							document.getElementById("contact_phone_list_company").removeChild(div);
						}
					</script>
					
					
					<div class="control-group email optional">
						<label for="person_contact_email" class="email optional control-label"> 邮箱</label>
							<div class="controls">
								<div id="contact_email_list_company" class="contact_forms contact_emails">
					
									<div style="" class="contact_methods">
											
											<div class="contact_method new_contact_method edit_phone" id="contact_email_3e6b5cd0-95a1-012f-f0bf-000c29568e7b">
									
												<input type="text" size="30" name="email" id="mail" >
												<select name="emailtype" id="mailsort">
													<option value="work">工作</option>
													<option value="personal">个人</option>
													<option value="other">其它</option>
												</select>
													
											</div>
										<div class="addmail" style="display:none"><a href="javascript:;">添加..</a></div>
									</div>
								</div>

							</div>
					</div>
					<script type="text/javascript">
						var temp = 0;
						$(document).ready(function(){
							$("#mail").focus(function(){
								if(temp == 0) {
									$(".addmail").show(500);
									temp = 1;
								}
							});
							$("#mail").blur(function(){
								temp = 0;
							});
							$(".addmail").click(function(){
								var div = $("<div class='contact_methods'></div>");
								$("#contact_email_list_company").append(div);
								$("<input type='text' size='30' name='email' id='mail' >").appendTo(div);
								var select = $("<select  id='mailsort' name='emailtype' style='width:90px'>");
								select.append("<option value='work'>工作</option>");
								select.append("<option value='person'>个人</option>");
								select.append("<option value='other'>其它</option>");
								div.append(select);
								$("<span class='addremove'><a class='remove' href='javascript:;' onclick='delmail(this)'><img style='width:25px' src='img/cha.jpg'/></a></span>").appendTo(div);
								
							});
						});
						
						function delmail(obj) {
							var div =  obj.parentNode.parentNode;
							document.getElementById("contact_email_list_company").removeChild(div);
						}
					</script>
					
					<div class="control-group string optional"><label for="person_contact_im" class="string optional control-label"> IM</label>
						<div class="controls">
							<div id="contact_im_list_company" class="contact_forms contact_ims">
							
								<div style="" class="contact_methods">
									<input type="text" size="30" name="im" id="im" class="im">
									<select name="imtype" id="im" style="width:90px">
										<option value="qq">QQ</option>
										<option value="gtalk">GTalk</option>
										<option value="msn">MSN</option>
										<option value="other">其它</option>
									</select>
									
								</div>
									<div class="addim" style="display:none"><a href="javascript:;">添加..</a></div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var temp = 0;
						$(document).ready(function(){
							$("#im").focus(function(){
								if(temp == 0) {
									$(".addim").show(500);
									temp = 1;
								}
							});
							$("#im").blur(function(){
								temp = 0;
							});
							$(".addim").click(function(){
								var div = $("<div class='contact_methods'></div>");
								$("#contact_im_list_company").append(div);
								$("<input type='text' size='30' name='im' id='im' >").appendTo(div);
								var select = $("<select  id='mailsort'name='imtype' style='width:90px'>");
								select.append("<option value='QQ'>QQ</option>");
								select.append("<option value='gtalk'>GTALK</option>");
								select.append("<option value='msn'>MSN</option>");
								select.append("<option value='other'>其它</option>");
								div.append(select);
								$("<span class='addremove'><a class='remove' href='javascript:;' onclick='delim(this)'><img style='width:25px' src='img/cha.jpg'/></a></span>").appendTo(div);
								
							});
						});
						
						function delim(obj) {
							var div =  obj.parentNode.parentNode;
							document.getElementById("contact_im_list_company").removeChild(div);
						}
					</script>
					<div class="control-group string optional">
						<label for="person_contact_website" class="string optional control-label"> 网站</label>
						<div class="controls">
							<div style="" id="contact_site_list_company" class="contact_methods">
								<div class="contact_method new_contact_method edit_phone" id="">
									<input type="text" size="30" name="site" id="site" class="site">
									<select name="sitetype" id="site" style="width:90px">
										<option value="company">公司</option>
										<option value="personal">个人</option>
										<option value="other">其它</option>
									</select>
										
								</div>
									<div class="addsite" style="display:none"><a href="javascript:;">添加..</a></div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var temp = 0;
						$(document).ready(function(){
							$("#site").focus(function(){
								if(temp == 0) {
									$(".addsite").show(500);
									temp = 1;
								}
							});
							$("#site").blur(function(){
								temp = 0;
							});
							$(".addsite").click(function(){
								var div = $("<div class='contact_methods'></div>");
								$("#contact_site_list_company").append(div);
								$("<input type='text' size='30' name='site' id='site' >").appendTo(div);
								var select = $("<select  id='sitesort' name='sitetype' style='width:90px'>");
								select.append("<option value='company'>公司</option>");
								select.append("<option value='personal'>个人</option>");
								select.append("<option value='other'>其它</option>");
								div.append(select);
								$("<span class='addremove'><a class='remove' href='javascript:;' onclick='delsite(this)'><img style='width:25px' src='img/cha.jpg'/></a></span>").appendTo(div);
								
							});
						});
						
						function delsite(obj) {
							var div =  obj.parentNode.parentNode;
							document.getElementById("contact_site_list_company").removeChild(div);
						}
					</script>
					<div class="control-group string optional">
						<label for="person_contact_address" class="string optional control-label"> 地址</label>
						<div class="controls">
							<div style="" id="contact_add_list_company" class="contact_methods">
								<div class="contact_method new_contact_method edit_phone" id="contact_address_3e6f8b70-95a1-012f-f0c2-000c29568e7b">
								<input type="text" size="30" name="address" id="add" class="add">
									<select name="addresstype" id="add" style="width:90px">
										<option value="company">公司</option>
										<option value="home">住宅</option>
										<option value="other">其它</option>
									</select>
								
								</div>
								<div class="addadd" style="display:none"><a href="javascript:;">添加..</a></div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var temp = 0;
						$(document).ready(function(){
							$("#add").focus(function(){
								if(temp == 0) {
									$(".addadd").show(500);
									temp = 1;
								}
							});
							$("#add").blur(function(){
								temp = 0;
							});
							$(".addadd").click(function(){
								var div = $("<div class='contact_methods'></div>");
								$("#contact_add_list_company").append(div);
								$("<input type='text' size='30' name='address' id='add' >").appendTo(div);
								var select = $("<select  id='addsort' name='addresstype' style='width:90px'>");
								select.append("<option value='company'>公司</option>");
								select.append("<option value='home'>住宅</option>");
								select.append("<option value='other'>其它</option>");
								div.append(select);
								$("<span class='addremove'><a class='remove' href='javascript:;' onclick='deladd(this)'><img style='width:25px' src='img/cha.jpg'/></a></span>").appendTo(div);
								
							});
						});
						
						function deladd(obj) {
							var div =  obj.parentNode.parentNode;
							document.getElementById("contact_add_list_company").removeChild(div);
						}
					</script>
					
					
					
					<div class="control-group string optional">
						<label for="person_contact_sns_attributes_0_value" class="string optional control-label"> 新浪微博</label>
						<div class="controls help-block">
						<input type="text" size="50" name="company.weibo" id="person_contact_sns_attributes_0_value" class="string optional">
						输入微博昵称或ID
						</div>
					</div>
					<div class="control-group text optional">
						<label for="person_others" class="text optional control-label"> 背景信息</label>
						<div class="controls">
							<textarea rows="20" name="company.content" id="person_others" cols="40" class="text optional content">
							</textarea><p class="help-block">简介，如何认识的等</p>
						</div>
					</div>
					
					<div class="control-group string optional">
						<label for="person_access_policy" class="string optional control-label"> 谁可以看见？</label>
						<div class="controls">
							<div class="radio scope activated">
								<input type="radio" value="all" name="role" id="all" checked="checked"> 所有同事
							</div>
							<div class="radio scope ">
								<input type="radio" value="me" id="me" name="role" > 只有我能看见
								
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
							$("input:radio:eq(2)").click(function() {
								$("#workername").hide();
								$("#groupname").toggle();
							});
							
							$("input:radio:eq(3)").click(function() {
								$("#groupname").hide();
								$("#workername").toggle();
							});
							$("input:radio:eq(1)").click(function(){
								$("#groupname").hide();
								$("#workername").hide();
							});
							$("input:radio:eq(0)").click(function(){
								$("#groupname").hide();
								$("#workername").hide();
							});
						});
					</script>
					<div class="form-actions">
						<input type="submit" value="保存公司" name="commit" data-loading-text="处理中.." class="btn btn-primary">
							<input type="submit" value="保存并继续添加公司" name="next_action" data-loading-text="处理中.." class="btn btn-success">
							<a class="btn" href="contact.action"  >取消</a>
					</div>
				</form>
			</div>	
		</div>
				
		</div>
		</div>
	</div>
	
</body>
</html>