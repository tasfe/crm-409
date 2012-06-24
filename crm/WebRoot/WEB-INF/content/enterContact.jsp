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
			min-width:200px;
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
		element.style {
	  	  width: 100%;
		}
		table {
		    background-color: transparent;
		    border-collapse: collapse;
		    border-spacing: 0;
		    max-width: 100%;
		}
		.right-top .right-links {
		    color: #666666;
		    float: right;
		    font-size: 12px;
		    font-weight: normal;
		}
		.right-top span {
		    color: #888888;
		    display: block;
		    font-size: 12px;
		}
		textarea {
		    height: 100px;
		    margin: 0;
		    width: 97%;
		}
		div.options {
		    border-bottom: 1px dashed #CCCCCC;
		    margin-bottom: 10px;
		    padding-bottom: 5px;
		}
		 .actions .label {
		    font-size: 14px;
		    font-weight: normal;
		    padding: 2px 10px 3px;
		}
		#service td{
			border:none;
			border-bottom: 1px solid #DDDDDD;
		}
		#date td{
			border:none;
			border-bottom: 1px solid #DDDDDD;
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
					<h2>${contact.name }</h2>
				</div>
				<ul class="nav nav-tabs nav-stacked">
					<li ><a href="addTask.action">添加任务</a></li>
					<li ><a href="addChance.action">添加机会</a></li>
					<li><a href="addEvent.action" data-toggle="modal">添加事件</a></li>
					<li><a href="addImporyDate.action" data-toggle="modal">添加重要日期</a></li>
					<li ><a href="addContact.action">添加联系人</a></li>
					
				</ul>
			</div>
			<h3>联系我们把。。。</h3>
			<span style="width:30px;height:30px">
				<img alt="" src="zxing.action?code=${contact.code }"/>
			</span>
		</div>
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:103px;">
			<table style="width:100%;">
				<tbody>
					<tr>
						<td width="68" style="vertical-align:top;">
							<div data-id="481213" data="" class="contact-avatar-container">
								<span style="display: inline-block;border:1px solid #CCCCCC;background: url('/assets/workxp_sprites.png') no-repeat 0px 0px transparent; width: 55px; padding-top: 55px;font-size:1px"></span>
							</div>
						</td>
						<td>
							<div class="right-links">
										由 <strong>${contact.user.username }</strong> 添加 |
									<a data-original-title="修改联系人" rel="tooltip" href="#">
										<i class="icon icon-edit"></i>
									</a>
							</div>
							
							<h3>${contact.name }</h3>
							<span>
								<div class="tags">
									<div class="list" id="show_tags">
										<i class="icon-tags"></i>
										<a id="show_tag_1699" class="label" href="">hehehe </a>
									</div>
								</div>
							</span>
						</td>
					</tr>
				</tbody>
				</table>	
				<ul class="nav nav-tabs details-tab" style="margin-top:6px">
				      <li class="active">
				        <a data-toggle="tab" href="#home">事件 &amp; 邮件</a>
				      </li>
				     <!--  <li class="">
				        <a data-toggle="tab" href="#contact">
				         	 联系人 (2)
				        </a>
				      </li> -->
				      <li class="">
					      <a data-toggle="tab" href="#service">
					     	   业务机会 
					      </a>
				      </li>
				      <li class="">
				        <a data-toggle="tab" href="#date">重要日期</a>
				      </li>
		    	</ul>
			</div>
			<div id="main" class="main">
				<div class="tab-content" id="myTabContent">
				 <div id="home" class="tab-pane fade active in">
		            <form action="addEvent.action" method="post">
		            	<input type="hidden" name="cid" value="${contact.id }">
			          		<div class="controls">
				          		<textarea rows="20" name="event.content" id="" cols="40" class="text required content">
				          		</textarea>
			          		</div>
			          		<div class="options" style="display:none">
			          			<div class="control-group optional">
			          			<label for="note_occurred_at_1i" class="optional control-label"> 什么时候发生的？</label>
			          				<div class="controls">
				          				<select name="year" id="" class="optional" style="width:15%">
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012" selected="selected">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										</select>
									<select name="month" id="" class="optional" style="width:15%">
										<option value="1">一月</option>
										<option value="2">二月</option>
										<option value="3">三月</option>
										<option value="4">四月</option>
										<option value="5">五月</option>
										<option value="6" selected="selected">六月</option>
										<option value="7">七月</option>
										<option value="8">八月</option>
										<option value="9">九月</option>
										<option value="10">十月</option>
										<option value="11">十一月</option>
										<option value="12">十二月</option>
									</select>
									<select name="day" id="" class="optional" style="width:15%">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18" selected="selected">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
									</div>
								</div>
							
			          		</div>
							<div class="new_note_form_basics" style="margin-top:8px;">
								<div class="addevent" style="float: right;">
									<input type="submit"  value="添加事件" id="" class="btn btn-primary">
								</div>
								<div class="action">
									<a id="show_options_link" href="javascript:;">显示选项</a>
								</div>
							</div>
		          		</form>
	          		<table style="margin-bottom: 60px; margin-top: 10px;" class="table top no-hover" id="activities">
							<tbody>
							<!-- 事件列表 -->
							<c:forEach items="${events }" var="event">
							<tr class="note" data-from="Person" data="781881" id="note-781881">
									<td style="width:30px;height:50px;">
									<span ><img src="img/event.jpg"/></span>
									</td>
									<td>
										<div class="note-header">
											<div style="float:right">
												 <ul class="nav nav-pills">
												 	<li><a href="eventNote.action?eid=${event.id }">评论</a></li>
													<li><a title="编辑" href="#">编辑</a></li>
										 			<li>
													<a title="删除" href="eventDel.action?eid=${event.id}&cid=${contact.id}">删除</a>
													</li>
												 </ul>
											</div>
											<div class="subject">
											<!-- 时间 -->
											${event.createtime }
											</div>
											<div class="meta">
													${event.user.username } 添加
											</div>
											<div class="meta">
											</div>
										</div>
										<div class="content">
											<p>${event.content }</p>
										</div>
									</td>
								</tr>
								</c:forEach>
								<!-- 事件结束 -->
							</tbody>
						</table>
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
							
							$("#show_options_link").click(function(){
								$(".options").show(500);
								$("#show_options_link").hide();
								$(".addevent").css("float","");
							});
						});
					</script>
		    <!--        <div id="contact" class="tab-pane fade">
		              联系人
		            </div> -->
		            <div id="service" class="tab-pane fade">
						<div id="chances" class="tab-pane active">
						    <table id="chances" class="table table-striped crm-table">
								<tbody>
								<c:forEach items="${contact.chances}" var="chance">
								<tr class="">
									<td>
										<h4>
											<a href="enterChance.action?id=${chance.id }">${chance.name }</a>
										</h4>
									
										<div class="description">${chance.content }</div>
										<div class="price">
												<span class="label" style="background:#000000">${chance.chancesorts.name }</span>
												￥${chance.money }
										</div>
										<div class="owner">由 ${chance.user.username } 创建</div>
									</td>
								<td class="actions date">
									<c:if test="${chance.state == 'a'}">
									<span class="label label-pending">跟踪</span>
									</c:if>
									<c:if test="${chance.state == 'b'}">
									<span class="label label-pending">成功</span>
									</c:if>
									<c:if test="${chance.state == 'c'}">
									<span class="label label-pending">失败</span>
									</c:if>
									
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						
						<a class="btn btn-primary" href="addchance.action">添加机会</a>
						</div>
		            </div>
		            <!-- 重要日期 -->
		            <div id="date" class="tab-pane fade">
						<table id="contact_dates" class="table table-striped crm-table">
							<tbody>
							<c:forEach items="${contact.imporyDates }" var="imporyDate">
								<tr id="contact_date_626">
									<td>
										${imporyDate.name }
									</td>
									<td>
										${imporyDate.time }
									</td>
									<td>
									</td>
									<td class="actions">
										<a  class="icon icon-trash" href="imporyDateDel.action?id=${imporyDate.id }&cid=${contact.id}"></a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<a class="btn btn-primary" href="#dateModal" data-toggle="modal">
							<li class="icon-calendar icon-white"></li>
							添加一个日期
						</a>
						<div class="modal hide fade in" id="dateModal" style="display: none;">
					         <form  method="post" id="date_form" data-remote="true" class="simple_form new_contact_date" action="addImporyDate.action" accept-charset="UTF-8">
								<input type="hidden" value="${contact.id }" name="contactid">
								<div class="modal-header">
									<a data-dismiss="modal" class="close">×</a>
									<h3>添加一个重要日期</h3>
								</div>
								<div class="modal-body">
								<div class="control-group string optional">
									<div class="controls">
										<input type="text" style="" size="30" name="imporyDate.name" id="">
									</div>
								</div>			
								<div class="control-group integer optional">
									<div class="controls">
										<select name="month" id="contact_date_month" style="width:15%">
											<option value="1">一月</option>
											<option value="2">二月</option>
											<option value="3">三月</option>
											<option value="4">四月</option>
											<option value="5">五月</option>
											<option value="6">六月</option>
											<option value="7">七月</option>
											<option value="8">八月</option>
											<option value="9">九月</option>
											<option value="10">十月</option>
											<option value="11">十一月</option>
											<option value="12">十二月</option>
										</select>
										<select name="day" id="contact_date_day" style="width:15%">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select>
										<select name="year" id="contact_date_year" style="width:15%">
											<option value="1950">1950</option>
											<option value="1951">1951</option>
											<option value="1952">1952</option>
											<option value="1953">1953</option>
											<option value="1954">1954</option>
											<option value="1955">1955</option>
											<option value="1956">1956</option>
											<option value="1957">1957</option>
											<option value="1958">1958</option>
											<option value="1959">1959</option>
											<option value="1960">1960</option>
											<option value="1961">1961</option>
											<option value="1962">1962</option>
											<option value="1963">1963</option>
											<option value="1964">1964</option>
											<option value="1965">1965</option>
											<option value="1966">1966</option>
											<option value="1967">1967</option>
											<option value="1968">1968</option>
											<option value="1969">1969</option>
											<option value="1970">1970</option>
											<option value="1971">1971</option>
											<option value="1972">1972</option>
											<option value="1973">1973</option>
											<option value="1974">1974</option>
											<option value="1975">1975</option>
											<option value="1976">1976</option>
											<option value="1977">1977</option>
											<option value="1978">1978</option>
											<option value="1979">1979</option>
											<option value="1980">1980</option>
											<option value="1981">1981</option>
											<option value="1982">1982</option>
											<option value="1983">1983</option>
											<option value="1984">1984</option>
											<option value="1985">1985</option>
											<option value="1986">1986</option>
											<option value="1987">1987</option>
											<option value="1988">1988</option>
											<option value="1989">1989</option>
											<option value="1990">1990</option>
											<option value="1991">1991</option>
											<option value="1992">1992</option>
											<option value="1993">1993</option>
											<option value="1994">1994</option>
											<option value="1995">1995</option>
											<option value="1996">1996</option>
											<option value="1997">1997</option>
											<option value="1998">1998</option>
											<option value="1999">1999</option>
											<option value="2000">2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option selected="selected" value="">( 每年 )</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
										</select>
									</div>
								</div>			
							</div>
							<div class="modal-footer">
								<a data-dismiss="modal" class="btn" href="#">取消</a>
								<input type="submit" value="添加日期"  class="btn btn-primary">
							</div>
						</form>
					     </div>
					     <!-- 结束 -->
		            </div>
		         </div>	
			</div>
		</div>
		</div>
		<div class="right2 sidebar" style="margin-top:0px;width:25%">
			<!-- 代办任务 -->
			<div class="well" id="tasks_div">
				<div class="title">
					<span><a data-backdrop="static" href="#taskModal" data-toggle="modal">添加任务</a></span>
					待办任务
				</div>
				<div id="upcoming_tasks">
					<div id="screen_body"></div>
				</div>
			</div>
			<!-- 结束 -->
			<!-- 联系信息 -->
			<div class="well" id="tasks_div" style="background-color: #F5F5F5;">
				<div class="title" >
					<span><a href="contactEdit.action?cid="${contact.id }">编辑</a></span>
					联系信息 
				</div>
				<ul class="nav nav-list contacts">
					<li class="nav-header">电话</li>
					<c:forEach items="${contact.tels }" var="tel">
					<li>
							${tel.tel }
						<span>${tel.type }</span>
					</li>
					</c:forEach>
				
					<li class="nav-header">邮箱</li>
					<c:forEach items="${contact.contactEmails }" var="email">
					<li>
							<a href="http://${email.email }">${email.email }</a>
						<span>${email.type }</span>
					</li>
					</c:forEach>
					<li class="nav-header">IM</li>
					<c:forEach items="${contact.ims }" var="im">
						<li>
								${im.im }
							<span>${im.type }</span>
						</li>
					</c:forEach>
					<li class="nav-header">网站</li>
					<c:forEach items="${contact.sites }" var="site">
						<li>
								${site.site }
							<span>${site.type }</span>
						</li>
					</c:forEach>
					<c:forEach items="${contact.addresses }" var="address">
					<li class="nav-header">地址</li>
					<li>
							${address.address }
						<span>${address.type }</span>
					</li>
					</c:forEach>
				</ul>
			</div>	
			<!-- 结束 -->
				<!-- 背景信息 -->
			<div class="well" id="tasks_div" style="background-color: #F5F5F5;">
				<div class="title" >
					<span style="display:none"><a data-backdrop="static" href="#taskModal" data-toggle="modal">编辑</a></span>
					背景信息 
				</div>
				<div id="background_info">
					<p>${contact.content }</p>
				</div>
			</div>	
			<!-- 结束 -->				
		</div>
	</div>
	
</body>
</html>