<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-fixed-top">
  	<div class="navbar-inner">
	  	<div class="container-fluid">
				<c:if test="${sessionScope.welcomeindex == 1 }">
					<a href="welcome.action?id=${sessionScope.product.id }" class="brand" style="margin-left:-10px">Work-CRM</a>
				</c:if>
				<c:if test="${sessionScope.welcomeindex == 2 }">
					<a href="message.action?id=${sessionScope.product.id }" class="brand" style="margin-left:-10px">Work-CRM</a>
				</c:if>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class="${param.tag=='message'?'active':'' }"><a href="message.action?pid=${product.id }&i=1">最新消息</a></li>
						<li class="${param.tag=='contact'?'active':'' }"><a href="contact.action">通讯录</a></li>
						<li class="${param.tag=='task'?'active':'' }"><a href="task.action">任务</a></li>
						<li class="${param.tag=='chance'?'active':'' }"><a href="chance.action">机会</a></li>
			    </ul>
					
					<ul class="nav">
					  <li class="dropdown">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						    添加
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu new-actions">
						    <li><a href="toaddcontact.action"><i class="icon-person"><img src="img/contact.ico"/></i> 联系人</a></li>
								<li><a href="toaddcompany.action"><i class="icon-company"><img src="img/company.ico"/></i> 公司</a></li>
								<li class="divider"></li>
								<li><a href="addchance.action"><i class="icon-dollar"><img src="img/chance.ico"/></i> 机会</a></li>
						  </ul>
						</li>
					</ul>
					<form class="navbar-search">
						<input type="text" placeholder="搜索联系人或机会" class="search-query mp_input" id="search" name="search" autocomplete="off"><ul class="typeahead dropdown-menu mp_list" style="display: none;"></ul>
					</form>
					<ul class="nav pull-right" >
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user icon-white"></i>帐号 <b class="caret"></b></a>
							<ul class="dropdown-menu settings">
								<c:if test="${sessionScope.role == '1'}">
									<li><a href="worker.action"><i class="icon-user"></i> 同事</a></li>
									<li><a href="group.action"><i class="icon-group"><img src="img/user_group.ico"></i> 组</a></li>
								</c:if>
								<li><a href="useredit.action"><i class="icon-cog"></i> 帐号管理</a></li>
								<!-- <li class="divider"></li>
								<li><a href="/profiles"><i class="icon-info-sign"></i> 个人信息</a></li> -->
								<li class="divider"></li>
								<li><a href="loginout.action"><i class="icon-off"></i> 注销</a></li>
							</ul>
						</li>
			    </ul>
				</div>
		  </div>
	  </div>
  </div>
  
  <script type="text/javascript">
	$(document).ready(function(){
		
		$( "#search" ).focus(
			function() {
				$( "#search" ).animate({
					width: 180
				}, 1000 );
			}
		);
		$( "#search" ).blur(
			function() {
				$( "#search" ).animate({
					width: 110
				}, 1000 );
			}
		);
		
	});
  </script>