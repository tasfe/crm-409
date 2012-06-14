<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>添加联系人</title>
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
			padding: 20px 20px 0;
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
					<h2>公司名</h2>
				</div>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="">添加联系人</a></li>
					
					<li><a href="#">添加公司</a></li>
					<li><a href="#">导入联系人</a></li>
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
			<div class="right-top "><span style="font-size:24px;">添加联系人</span></div>
			
			<div class="main">
				<form  method="post" id="contact_form" class="simple_form form-horizontal" action="/people" >
					<div class="control-group string required">
						<label for="person_name" class="string required control-label">
							<abbr title="required">*</abbr> 姓名</label>
						<div class="controls">
							<input type="text" size="50" name="person[name]" id="person_name" class="string required">
						</div>
					</div>
					<div class="control-group string optional">
						<label for="person_title" class="string optional control-label"> 职位</label>
						<div class="controls">
							<input type="text" size="50" name="person[title]" id="person_title" class="string optional">
						</div>
					</div>
					<div class="control-group string optional marco_polo_container">
						<label for="person_company" class="string optional control-label"> 公司</label>
						<div class="controls">
							<input type="text" name="company_name" id="company_name" data-selected="{&quot;name&quot;:null,&quot;id&quot;:null}" class="input-xlarge mp_input" autocomplete="off"><ul class="typeahead dropdown-menu mp_list" style="display: none;"></ul>
							<input type="hidden" name="person[company_id]" id="person_company_id">
						</div>
					</div>
					<div class="control-group string optional marco_polo_container">
						<label for="person_phone" class="string optional control-label"> 电话</label>
						<div class="controls">
							<div id="contact_phone_list_company" class="contact_forms contact_phones">
									
									<div style="" class="contact_methods">
										<input type="text" size="30" name="person[contact_phones][][value]" id="person_contact_phones__value" class="autofocus">
											<select name="person[contact_phones][][key]" id="person_contact_phones__key">
												<option value="office">公司</option>
												<option value="work">工作</option>
												<option value="mobile">手机</option>
												<option value="fax">传真</option>
												<option value="home">住宅</option>
												<option value="other">其它</option>
											</select>
									</div>
							</div>
						</div>
					</div>
					<div class="control-group email optional">
						<label for="person_contact_email" class="email optional control-label"> 邮箱</label>
							<div class="controls">
								<div id="contact_email_list_company" class="contact_forms contact_emails">
					
									<div style="" class="contact_methods">
											
											<div class="contact_method new_contact_method edit_phone" id="contact_email_3e6b5cd0-95a1-012f-f0bf-000c29568e7b">
									
												<input type="text" size="30" name="person[contact_emails][][value]" id="person_contact_emails__value" class="autofocus">
												<select name="person[contact_emails][][key]" id="person_contact_emails__key">
													<option value="work">工作</option>
													<option value="personal">个人</option>
													<option value="other">其它</option>
												</select>
													
											</div>
										
									</div>
								</div>

							</div>
					</div>
					
					<div class="control-group string optional"><label for="person_contact_im" class="string optional control-label"> IM</label>
						<div class="controls">
							<div id="contact_im_list_company" class="contact_forms contact_ims">
							
								<div style="" class="contact_methods">
									<input type="text" size="30" name="person[contact_ims][][value]" id="person_contact_ims__value" class="autofocus">
									<select name="person[contact_ims][][key]" id="person_contact_ims__key">
										<option value="qq">QQ</option>
										<option value="gtalk">GTalk</option>
										<option value="msn">MSN</option>
										<option value="other">其它</option>
									</select>
									
								</div>
									
							</div>
						</div>
					</div>
					
					<div class="control-group string optional">
						<label for="person_contact_website" class="string optional control-label"> 网站</label>
						<div class="controls">
							<div style="" class="contact_methods">
								<div class="contact_method new_contact_method edit_phone" id="contact_website_3e6e4580-95a1-012f-f0c1-000c29568e7b">
									<input type="text" size="30" name="person[contact_websites][][value]" id="person_contact_websites__value" class="autofocus">
									<select name="person[contact_websites][][key]" id="person_contact_websites__key">
										<option value="office">公司</option>
										<option value="personal">个人</option>
										<option value="other">其它</option>
									</select>
										
								</div>
									
							</div>
						</div>
					</div>
					
					<div class="control-group string optional">
						<label for="person_contact_address" class="string optional control-label"> 地址</label>
						<div class="controls">
							<div style="" class="contact_methods">
								<div class="contact_method new_contact_method edit_phone" id="contact_address_3e6f8b70-95a1-012f-f0c2-000c29568e7b">
								<input type="text" size="30" name="person[contact_addresses][][value]" id="person_contact_addresses__value" class="autofocus">
									<select name="person[contact_addresses][][key]" id="person_contact_addresses__key">
										<option value="office">公司</option>
										<option value="home">住宅</option>
										<option value="other">其它</option>
									</select>
								
								</div>
							</div>
						</div>

					</div>
					
					<div class="control-group string optional">
						<label for="person_contact_sns_attributes_0_value" class="string optional control-label"> 新浪微博</label>
						<div class="controls help-block">
						<input type="text" size="50" name="person[contact_sns_attributes][0][value]" id="person_contact_sns_attributes_0_value" class="string optional">
						输入微博昵称或ID
						</div>
					</div>
					<div class="control-group text optional">
						<label for="person_others" class="text optional control-label"> 背景信息</label>
						<div class="controls">
							<textarea rows="20" name="person[others]" id="person_others" cols="40" class="text optional content">
							</textarea><p class="help-block">简介，如何认识的等</p>
						</div>
					</div>
					
					<div class="control-group string optional">
						<label for="person_access_policy" class="string optional control-label"> 谁可以看见？</label>
						<div class="controls">
							<div class="radio scope activated">
								<input type="radio" value="Everyone" name="person[access_policy_attributes][scope]" id="person_access_policy_attributes_scope_everyone" checked="checked"> 所有同事
							</div>
							<div class="radio scope ">
								<input type="radio" value="Owner" name="person[access_policy_attributes][scope]" id="person_access_policy_attributes_scope_owner"> 只有我能看见
								<input type="hidden" value="5861" name="person[access_policy_attributes][owner_id]" id="person_access_policy_attributes_owner_id">
							</div>
							<div class="radio scope ">
								<input type="radio" value="NamedGroup" name="person[access_policy_attributes][scope]" id="person_access_policy_attributes_scope_namedgroup"> 选择一个组...
								<div class="editor">
								<select name="person[access_policy_attributes][group_id]" id="person_access_policy_attributes_group_id" class="named_group">
									<option value="">选择一个组</option>
									<option value="536">后台</option>
									<option value="537">前台</option>
								</select> 
								</div>
								<div data="{&quot;536&quot;:[&quot;5863&quot;],&quot;537&quot;:[]}" class="named_groups_data"></div>
							</div>
							<div class="radio scope  ">
								<input type="hidden" name="person[access_policy_attributes][user_ids]" id="person_access_policy_attributes_user_ids" class="adhoc_group_ids">
								<input type="radio" value="AdhocGroup" name="person[access_policy_attributes][scope]" id="person_access_policy_attributes_scope_adhocgroup"> 选择同事...
								<div class="editor">
									<div style="display: none;" class="adhoc_group_member template">
										<select name="user_ids[]" id="user_ids_" disabled="disabled"><option value="5863">陈路</option></select> 
										<span id="" title="" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -181px transparent; width: 14px; padding-top: 14px;" class="sprite remove"></span>
										<span id="" title="" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -197px transparent; width: 14px; padding-top: 14px;" class="sprite add"></span>
									</div>
									<div class="adhoc_group_members"></div>
									<select name="" id="" class="new_adhoc_group_member">
										<option selected="selected" value="">选择一个同事...</option>
										<option value="5863">陈路</option>
									</select> 
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="form-actions">
						<input type="submit" value="保存联系人" name="commit" data-loading-text="处理中.." class="btn btn-primary">
							<input type="submit" value="保存并继续添加联系人" name="next_action" data-loading-text="处理中.." class="btn btn-success">
							<a class="btn" href="/contacts">取消</a>
					</div>
				</form>
			</div>	
		</div>
				
		</div>
		</div>
	</div>
	
</body>
</html>