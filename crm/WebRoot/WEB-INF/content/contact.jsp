<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>通讯录</title>
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
		#summaries {
			color: #888888;
			font-size: 12px;
			height: 20px;
			
		}
		#main .contact-container #party_selection_controls #contact_actions .action {
			background: none repeat scroll 0 0 #DFDFDF;
			border-top-left-radius: 6px;
			border-top-right-radius: 6px;
			cursor: pointer;
		}
		#main .contact-container #party_selection_controls #contact_actions a {
			color: #444444;
			display: inline-block;
			padding: 2px 6px 0;
			text-decoration: none;
			display:none;
		}
		#contacts h3 {
			font-size: 15px;
		}
		.crm-table tr{
			border-bottom:1px solid #ccc;
		}
		#selection_top{
			height:20px;
		}
		.selected{
			background-color:#FFFFCC;
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
					<h2>通讯录</h2>
				</div>
				<ul class="nav nav-tabs nav-stacked">
					<li ><a href="toaddcontact.action">添加联系人</a></li>
					<li ><a href="toaddcompany.action">添加公司</a></li>
					<li ><a href="#">导入联系人</a></li>
					<li><a href="#">导出联系人</a></li>
				</ul>
			</div>
		</div>
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:40px;">
				<select name="type" id="type" style="width:141px;">
					<optgroup label="所有...">
						<option value="All">所有的联系人</option>
						<option value="Person">所有的个人</option>
						<option value="Company">所有的公司</option>
						<option value="Mine">我创建的联系人</option>
						<option value="NoTagged">未打标签的联系人</option>
					</optgroup>
					<optgroup label="最近...">
						<option value="RecentlyAdded">最近添加的联系人
					</option></optgroup>
				</select>
			</div>
			<div id="main" class="main" style="height:550px">
				<div class="filter-desc">
					可以通过以下条件来过滤联系人:
				</div>
				
				<div class="meta">
					<ul class="nav nav-pills contact-filter">
							<li class="dropdown ">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle ">
								姓名<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing" >
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="name" class="input-small search-query sxing-input">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								职位<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="title" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								邮箱<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="ContactEmail" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								电话<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="ContactPhone" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								地址<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="ContactAddress" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								背景信息<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="others" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								网站<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="ContactWebsite" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
							<li class="dropdown">
							<a href="#" data-toggle="dropdown" class="dropdown-toggle">
								IM<b class="caret"></b>
							</a>
							<ul class="dropdown-menu sxing">
									<div class="dropdown-box">
										<form class="form-search contacts-search">
									<input type="text" name="ContactIm" class="input-small search-query">
											<button data-loading-text="处理中.." class="btn" type="submit">搜索</button>
								  </form>
									</div>
							</ul>
						  </li>
					</ul>
				</div>
				<hr style="height:4px; background-color:#eee;"/>
				<div class="contact-container">
					<div id="selection_top">
					<div style="display:none" id="select_all_contacts_container">
						<a href="#">选择所有的联系人</a> ( 还有 -22 个联系人 )
					</div>
					<h5 style="display:none" id="selected_all_contacts">已经选择了所有联系人</h5>
					</div>
					<div class="selector pull-right">
						<span id="selection_summary" style="display: none;"><li class="icon-user"></li> 1 个 </span>
						<a id="toggle_link" href="#">全选</a>
					</div>
					<div id="party_selection_controls">
						<div id="summaries" style="display: block; top: 0px;">
							勾选联系人后可以批量添加标签、修改访问权限、删除和群发邮件
						</div>
						<div id="contact_actions" style="top: 20px; display: block;">
								<a data_action="add_tag" id="add_tag_link" class="action">添加标签</a>
								<a data_action="update_access_policy" id="update_access_policy_link" class="action">修改访问权限</a>
								<a class="destroy action" data_action="destroy" id="destroy_link">删除</a>
								<a data_action="send_email" id="send_email_link" class="action">群发邮件</a>
						</div>
					</div>
					
				</div>
				<hr />
				<table id="contacts" class="table crm-table ">
				<thead>
				<c:forEach items="${contacts }" var="contact">
					<tr >
						<td width="2%"><input type="checkbox" value="485218" name="" id="id_"></td>
							<td width="3%"><a class="quick-view" data-id="485215" href="javascript:;">
							<span style="display: inline-block;border:1px solid #CCCCCC;background: url('img/workxp_sprites.png') no-repeat -112px -148px transparent; width: 32px; padding-top: 32px;font-size:1px"></span></a>
						</td>
						<td width="50%">
							<h3>
								<a href="enterContact.action?cid=${contact.id }">${contact.name}</a>
								<span>${contact.position }</span>
							</h3>
							<div class="info">
								
							</div>
						</td>
						<td class="description">
							<h3><a href="enterCompany.action?cmid=${contact.company.id}">${contact.company.name }</a></h3>
							<div>
							</div>
						</td>
					</tr>
					</c:forEach>
					
					<c:forEach items="${companys }" var="company">
					<tr class="">
						<td width="2%"><input type="checkbox" value="480967" name="id[]" id="id_"></td>
						<td width="3%"><a class="quick-view" data-id="480967" href="javascript">
							<span style="display: inline-block;border:1px solid #CCCCCC;background: url('img/workxp_sprites.png') no-repeat 0px -148px transparent; width: 32px; padding-top: 32px;font-size:1px"></span></a>
						</td>
						<td width="50%">
							<h3>
								<a href="enterCompany.action?cmid=${company.id }">${company.name }</a>
							</h3>
							<div class="info">
								
							</div>
						</td>
					</tr>
					</c:forEach>
				</thead>
			</table>
				
				
			</div>
			
			
		</div>
		
		<div class="right2 sidebar" style="margin-top:0px;">
			<div class="well" id="tasks_div" style="background-color: #F5F5F5;">
				<div class="title" style="border:none">
					<i class="icon-tags"></i>
					按标签查询 
				</div>
				<table class="table crm-table tags">
					<tbody>
						<tr>
							<td style="width:12px;"><strong>A</strong></td>
							<td>
									<a href="#" class="label">adsfdasfdsafd</a>
									<a href="#" class="label">asdfsdafdsa</a>
									<a href="#" class="label">asdfsdafsdfsdafsdafdsfffffffffffffffffffffffffffffffffffff</a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>C</strong></td>
							<td>
									<a href="#" class="label">陈路自己</a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>D</strong></td>
							<td>
									<a href="#" class="label">dsaf</a>
									<a href="#" class="label">dsafdsaf</a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>F</strong></td>
							<td>
									<a href="#" class="label">fdsafsdafsdaf</a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>H</strong></td>
							<td>
									<a href="#" class="label">hehehe </a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>L</strong></td>
							<td>
									<a href="#" class="label">老婆</a>
							</td>
						</tr>
						<tr>
							<td style="width:12px;"><strong>W</strong></td>
							<td>
									<a href="#" class="label">我自己</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>			
		</div>
	</div>
	
</body>
</html>