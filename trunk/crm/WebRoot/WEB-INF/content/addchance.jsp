<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>新建机会</title>
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
	<%@include file="head/head.jsp" %>
	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>公司名</h2>
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
			<form novalidate="novalidate" method="post" id="chance_form" class="simple_form form-vertical" action="/chances" accept-charset="UTF-8"><div style="margin:0;padding:0;display:inline"><input type="hidden" value="✓" name="utf8"><input type="hidden" value="vALodvomp1yFybx1rnhbwmENisSzuU28A3oVITrtnNQ=" name="authenticity_token"></div>
				
				<div class="control-group string optional  marco_polo_container"><label for="chance_contact" class="string optional control-label"> 联系人</label><div class="controls">
					<input type="text" name="contact_name" id="contact_name" data-selected="{&quot;name&quot;:null,&quot;company&quot;:null,&quot;id&quot;:null}" class="input-xlarge mp_input" autocomplete="off"><ul class="typeahead dropdown-menu mp_list" style="display: none;"></ul>
					<input type="hidden" name="chance[contact_id]" id="chance_contact_id" value="">
		<p class="help-block">输入联系人姓名或公司名称（并从下拉提示列表中选取一个）</p></div></div>
				<div class="control-group string required"><label for="chance_name" class="string required control-label"><abbr title="required">*</abbr> 机会名称</label><div class="controls"><input type="text" size="50" name="chance[name]" id="chance_name" class="string required input-xlarge"></div></div>

				<div class="control-group text optional"><label for="chance_description" class="text optional control-label"> 机会描述或背景信息</label>
					<div class="controls">
						<textarea rows="20" name="chance[description]" id="chance_description" cols="40" class="text optional content"></textarea>
					</div>
				</div>
				
				<div class="control-group float optional"><label for="chance_price" class="float optional control-label"> 金额</label><div class="controls"><div class="input-prepend">
					<input type="text" name="chance[price]" id="chance_price" class="numeric float optional price">
					<span class="add-on">元</span>
					<input type="hidden" value="fixed" name="chance[price_type]" id="chance_price_type">
					<select onchange="Deals.selectBidType(this)" name="type_pulldown" id="price_type_pulldown"><option selected="selected" value="fixed">固定价</option>
						<option value="hour">每小时</option>
						<option value="month">每月</option>
						<option value="year">每年</option></select>
					<span style="display:none;" id="special_bid">
						共
						<input type="text" style="width:50px;" size="30" name="chance[duration]" id="chance_duration">
						<span id="time_unit"></span>
					</span>
		</div></div></div>		
				<div class="control-group integer optional"><label for="chance_category_id" class="integer optional control-label"> 分类</label><div class="controls">
					<select onchange="changeCategory(this)" name="chance[category_id]" id="chance_category_id" data="ChanceCategory"><option value="">无</option>
						<option value="25178">爱</option>
						<option value="new">新建分类 ...</option></select>
					<a href="/crm_categories?type=chance">编辑分类</a>
		</div></div>		
						<div class="control-group select optional"><label for="chance_assigned_user_id" class="select optional control-label"> 谁负责？</label><div class="controls"><select name="chance[assigned_user_id]" id="chance_assigned_user_id" class="select optional"><option value="">无</option>
							<option value="5861">我</option>
							<option value="5863">陈路</option></select></div></div>
						
						<div class="control-group string optional"><label for="chance_access_policy" class="string optional control-label"> 谁可以看见这个机会？</label><div class="controls">
							
							 <div class="select_access_policy" id="select_access_policy_for_Chance_">
			<div class="radio scope activated">
				<input type="radio" value="Everyone" name="chance[access_policy_attributes][scope]" id="chance_access_policy_attributes_scope_everyone" checked="checked"> 所有同事
			</div>
			<div class="radio scope ">
				<input type="radio" value="Owner" name="chance[access_policy_attributes][scope]" id="chance_access_policy_attributes_scope_owner"> 只有我能看见
				<input type="hidden" value="5861" name="chance[access_policy_attributes][owner_id]" id="chance_access_policy_attributes_owner_id">
			</div>
				<div class="radio scope ">
					<input type="radio" value="NamedGroup" name="chance[access_policy_attributes][scope]" id="chance_access_policy_attributes_scope_namedgroup"> 选择一个组...
					<div class="editor">
					<select name="chance[access_policy_attributes][group_id]" id="chance_access_policy_attributes_group_id" class="named_group"><option value="">选择一个组</option>
						<option value="536">后台</option>
						<option value="537">前台</option></select> 
					</div>
					<div data="{&quot;536&quot;:[&quot;5863&quot;],&quot;537&quot;:[]}" class="named_groups_data"></div>
				</div>
			<div class="radio scope  ">
				<input type="hidden" name="chance[access_policy_attributes][user_ids]" id="chance_access_policy_attributes_user_ids" class="adhoc_group_ids">
				<input type="radio" value="AdhocGroup" name="chance[access_policy_attributes][scope]" id="chance_access_policy_attributes_scope_adhocgroup"> 选择同事...
				<div class="editor">
					<div style="display: none;" class="adhoc_group_member template">
						<select name="user_ids[]" id="user_ids_" disabled="disabled"><option value="5863">陈路</option></select> 
						<span id="" title="" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -181px transparent; width: 14px; padding-top: 14px;" class="sprite remove"></span>
						<span id="" title="" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -197px transparent; width: 14px; padding-top: 14px;" class="sprite add"></span>
					</div>
					<div class="adhoc_group_members"></div>
				<select name="" id="" class="new_adhoc_group_member"><option selected="selected" value="">选择一个同事...</option>
		<option value="5863">陈路</option></select> 
				</div>
	</div>
	
</div>




</div></div>		
		<div class="form-actions">
			<input type="submit" value="添加这个机会" onclick="$('chance_form').addClassName('progress')" name="commit" class="btn btn-primary">
			<a class="btn" href="chance.action">取消</a>
		</div>
</form></div>
			</div>
			
			
				
		</div>
		</div>
	</div>
	
</body>
</html>
