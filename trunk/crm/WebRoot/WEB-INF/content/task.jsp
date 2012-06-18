<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>通讯录</h2>
				</div>
				<ul class="nav nav-tabs nav-stacked">
					<li ><a href="#">待办任务</a></li>
					<li ><a href="#">已完成任务</a></li>
					<li ><a href="#">我分配的任务</a></li>
					<li><a href="#taskModal" data-toggle="modal">添加任务</a></li>
				</ul>
				<div id="taskModal" class="modal hide in" style="display: none;">
				<form novalidate="novalidate" method="post" id="task_form" data-remote="true" class="simple_form new_task" action="/tasks" accept-charset="UTF-8"><div style="margin:0;padding:0;display:inline"><input type="hidden" value="✓" name="utf8"><input type="hidden" value="vALodvomp1yFybx1rnhbwmENisSzuU28A3oVITrtnNQ=" name="authenticity_token"></div>
					<input type="hidden" value="tasks" name="context" id="context">
					
					
					<input type="hidden" name="user_id" id="form_user_id">
					<input type="hidden" name="filter_task_category_id" id="filter_task_category_id">
					
					<div class="modal-header">
						<a data-dismiss="modal" class="close">×</a>
						<h3>添加一个任务</h3>
					</div>
					
				<div class="modal-body">
				<div class="control-group string required"><div class="controls"><input type="text" size="50" name="task[name]" id="task_name" class="string required span5"></div></div>
		
				<div class="control-group string optional"><label for="task_frame" class="string optional control-label"> 到期时间？</label><div class="controls">
					<select onchange="change_task_frame($(this).val(), '#calendar_date_select')" name="task[frame]" id="task_frame"><option value="today">今天</option>
						<option value="tomorrow">明天</option>
						<option value="this_week">本周</option>
						<option value="next_week">下周</option>
						<option value="later">以后</option>
						<option value="calendar">设置具体时间 ...</option></select>
					<span class="hide" id="calendar_date_link">
					</span>
			</div></div>			
				<span style="display:none;" id="calendar_date_select">
					<div class="control-group datetime optional"><div class="controls"><select name="task[due_at(1i)]" id="task_due_at_1i" class="datetime optional">
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
					<select name="task[due_at(2i)]" id="task_due_at_2i" class="datetime optional">
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
					<select name="task[due_at(3i)]" id="task_due_at_3i" class="datetime optional">
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
					<option value="11" selected="selected">11</option>
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
					 &mdash; <select name="task[due_at(4i)]" id="task_due_at_4i" class="datetime optional">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09" selected="selected">09</option>
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
					</select>
					 : <select name="task[due_at(5i)]" id="task_due_at_5i" class="datetime optional">
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
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
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
					<option value="37">37</option>
					<option value="38">38</option>
					<option value="39">39</option>
					<option value="40">40</option>
					<option value="41">41</option>
					<option value="42">42</option>
					<option value="43">43</option>
					<option value="44">44</option>
					<option value="45">45</option>
					<option value="46">46</option>
					<option value="47">47</option>
					<option value="48">48</option>
					<option value="49">49</option>
					<option value="50">50</option>
					<option value="51">51</option>
					<option value="52" selected="selected">52</option>
					<option value="53">53</option>
					<option value="54">54</option>
					<option value="55">55</option>
					<option value="56">56</option>
					<option value="57">57</option>
					<option value="58">58</option>
					<option value="59">59</option>
				</select>
				</div></div>
			</span>
		
			<div class="control-group integer optional"><label for="task_category_id" class="integer optional control-label"> 选择一个分类</label><div class="controls">
				<select onchange="changeCategory(this)" name="task[category_id]" id="task_category_id" data="TaskCategory"><option value="">无</option>
					<option value="25132">电话</option>
					<option value="25133">邮件</option>
					<option value="25134">传真</option>
					<option value="25135">面谈</option>
					<option value="25136">感谢</option>
					<option value="25137">试用</option>
					<option value="25157">放松</option>
					<option value="new">添加分类 ...</option></select>
				<a href="/crm_categories?type=task">编辑分类</a>
</div></div>								
				<div class="control-group select optional"><label for="task_assigned_to_id" class="select optional control-label"> 谁负责？</label><div class="controls"><select name="task[assigned_to_id]" id="task_assigned_to_id" class="select optional"><option selected="selected" value="5861">我</option>
<option value="5863">陈路</option></select></div></div>
				
				<div class="control-group string optional checkbox"><div class="controls">
					<input type="hidden" value="private" name="task[privacy]"><input type="checkbox" value="public" name="task[privacy]" id="task_privacy"> 同事可以看见这个任务
</div></div>		</div>
		
		<div style="text-align:left;" class="modal-footer">
			<input type="submit" value="添加这个任务" name="commit" class="btn btn-primary">
			<a data-dismiss="modal" class="btn" href="#">取消</a>
		</div>
</form></div>
			</div>
		</div>
		<!--筛选任务-->
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px;height:30px;">
			<span style="float:left;font-size:20px;">待办任务</span>
			<div style="float:right;">
				分类为
				<select  name="task" id="taskid" style="width:141px;">
					<option value="">所有</option>
					<option value="25149">感谢</option>
					<option value="25150">试用</option>
				</select>
			</div>
			</div>
			
			<!--任务分类显示-->
			<div id="main" class="main">	
			<div id="upcoming_tasks">
				<div id="screen_body">
					<div class="tasks overdue">
						<legend>已过期</legend>
						<div class="task checkbox" id="task_23393">
							<span class="task_hover">
									<div class="task_actions" style="display: none;">
										<a data-remote="true" class="edit" href="">编辑</a>
									</div>
								
								<input type="checkbox" value="1" onclick="done_task(23393, 5863, 5863)" name="task_done" id="task_done_23393" data-confirm="您确定要完成分配给 陈路 的任务吗？">
								<span class="label" style="background:#666666;">试用</span>
								<strong>6月10日 10:06</strong> -
								测试任务
							</span>
						</div>
					</div>

					<div class="tasks today">
					<legend>今天</legend>
					<div class="task checkbox" id="task_23333">
						<span class="task_hover">
								<div class="task_actions" style="display: none;">
									<a title="删除这个任务" class="icon icon-trash" href=""></a>
									<a class="edit" href="">编辑</a>
								</div>
							
							<input type="checkbox" value="1"  name="task_done" id="task_done_23333" data-confirm="您确定要完成分配给 陈路 的任务吗？">
								<span class="label" style="background:#A5460D;">感谢</span>
							是大幅度
						</span>
					</div>
					</div>	
				</div>

				<script charset="utf-8" type="text/javascript">
					$(document).ready(function() {
						$('span.task_hover').hover(function() {
							$(this).children().first().show();
						}, function() {
							$(this).children().first().hide();
						});
					});
				</script>
			</div>
		</div>
			
			
		</div>
		
		<div class="right2 sidebar" style="margin-top:0px;">
			<div class="well" id="tasks_div" style="background-color: #F5F5F5;">
				<div class="title" >
					订阅您的日程安排
				</div>
				<p>
					您可以使用 Google Calendar, Apple iCal, Mozzila Calendar 等支持 iCalendar 格式的工具来 
					<a href="/tasks/subscription">订阅您的日程安排</a>。
				</p>
			</div>			
		</div>
	</div>
	
</body>
</html>