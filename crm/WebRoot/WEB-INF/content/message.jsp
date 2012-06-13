<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>最新消息</title>
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
		
		#search{
			border-radius: 14px 14px 14px 14px;
			width:110px;
		}
		.dropdown a{
			margin-right:30px;
		}
	</style>
</head>
<body>
	<%@include file="head/head.jsp" %>

	<div id="mapp">
		<div class="left ">
			<div class="">
				<div class= "left-top">
					<h2>按条件筛选</h2>
				</div>
				<select name="type" id="type" style="width:200px">
					<option selected="selected" value="">所有动态</option>
					<option value="task">任务动态</option>
					<option value="chance">机会动态</option>
					<option value="note">事件动态</option>
					<option value="email">邮件动态</option>
				</select>
				
				<ul class="nav nav-tabs nav-stacked">
					<li class="active"><a href="#">所有同事</a></li>
					
					<div id="accordion2" class="accordion">
					<div class="accordion-group">
					  <div class="accordion-heading">
						<a href="#group" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle">
						 组
						</a>
					  </div>
					  <div class="accordion-body collapse" id="group" style="height: 0px;background-color:#fff">
						<div class="accordion-inner">
							<li><a href="">我的小组</a></li>
							<hr/>
							<li><a href="#">测试小组</a></li>
						</div>
					  </div>
					</div>
					<div class="accordion-group">
					  <div class="accordion-heading">
						<a href="#user" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle">
						 同事
						</a>
					  </div>
					  <div class="accordion-body collapse" id="user" style="height: 0px;background-color:#fff">
						<div class="accordion-inner">
							<li><a href="">张三</a></li>
							<hr/>
							<li><a href="#">李四</a></li>
						</div>
					  </div>
					</div>
				  </div>
				</ul>
			</div>
		</div>
		<div class="right" style="width:65%">
			<div class="right-top " style="margin-bottom:0px"><span style="float:left;font-size:24px;">最新消息</div>
			<div id="main" class="main"  style="padding-top: 0px">
						
					<table class="table crm-table dashboard">
						<tbody>
							<tr id="activity_783582">
								<td class="icon"  style="width: 30px">
									<span><img src="img/duigou.png" alt="" /></span>
								</td>
								<td>
									<del>陈路的新任务</del><span class="author"> 由 陈路 完成</span><a title="删除这条动态" style="margin-left:5px" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这条动态吗？" class="icon icon-trash" href="/tasks/23097/delete_activity"></a>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_783578">
								<td class="icon"  style="width: 30px">
									<span><img src="img/duigou.png" alt="" /></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><div class="content"><a href="/notes/765301">打三分</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781786">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><br>陈路 将机会状态改为 失败
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							
							<tr id="activity_781781">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763553">你好啊 呵呵呵呵。 </a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781780">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4142">大飒飒地方</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781779">
								<td class="icon">
									<span class="sprite task"></span>
								</td>
								<td>
									<del>dasf</del><span class="author"> 由 陈路 完成</span><a title="删除这条动态" style="margin-left:5px" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这条动态吗？" class="icon icon-trash" href="/tasks/23095/delete_activity"></a>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781726">
								<td class="icon">
									<span class="sprite comment"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763533">fhfhg</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-08</span>
								</td>
							</tr>
							<tr id="activity_781724">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763531">hihihu</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781725">
								<td class="icon">
									<span class="sprite note"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><div class="content"><a href="/notes/763532">guygu</a></div><span class="author">由 陈路 添加</span>
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781723">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4131">dfsdfsg</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
							<tr id="activity_781697">
								<td class="icon">
									<span class="sprite chance"></span>
								</td>
								<td>
									<strong><a href="/chances/4127">有可能买车</a></strong><br>陈路创建了这个机会
								</td>
								<td class="actions date">
									<span class="">06-07</span>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
		
		<div class="right2 sidebar" style="margin-top:0px;">
			<div class="well" id="tasks_div">
				<div class="title">
					<span><a data-backdrop="static" href="#taskModal" data-toggle="modal">添加任务</a></span>
					您的日程安排
				</div>
				<div id="upcoming_tasks">
					<div id="screen_body">
						<div class="tasks today">
							<legend>今天</legend>
							<div class="task checkbox" id="task_23333">
							<span class="task_hover">
									<div class="task_actions" style="display: none;">
										<a title="删除这个任务" rel="nofollow" data-remote="true" data-method="delete" data-confirm="您确定要删除这个任务吗？" class="icon icon-trash" href="/tasks/23333"></a>
										<a data-remote="true" class="edit" href="/tasks/23333/edit?context=dashboard">编辑</a>
									</div>
								<input type="checkbox" value="1" onclick="done_task(23333, 5863, 5863)" name="task_done" id="task_done_23333" data-confirm="您确定要完成分配给 陈路 的任务吗？">
									<span class="label" style="background:#A5460D;">感谢</span>
									是大幅度
							</span>
							
						</div>
						</div>
					</div>

				</div>
				
				
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
				</form>
			</div>
				
				
				
			</div>			
		</div>
	</div>
	
</body>
</html>