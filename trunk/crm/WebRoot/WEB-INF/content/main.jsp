<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>产品选择</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script type="text/javascript" src="js/jQuery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
	
		body{
			margin-top:76px;
			background-color:#F3F1Ec;
		}
	
		#search{
			border-radius: 14px 14px 14px 14px;
			width:110px;
		}
		.dropdown a{
			margin-right:30px;
		}
		
		.card {
			background: none repeat scroll 0 0 #FFFFFF;
			border-radius: 105px;
			box-shadow: 0 0 6px rgba(0, 0, 0, 0.3);
			float: left;
			height: 185px;
			margin: 0 20px 20px 0;
			padding: 15px;
			position: relative;
			text-align: left;
			text-rendering: optimizelegibility;
			width: 185px;
		}
		a{
			color: inherit;
			padding: 2px 0;
			text-decoration: none;
		}
		a:hover{
			text-decoration: none;
			color: inherit;
		}
		.card p {
			color: #AA9C84;
			font-size: 16px;
			line-height: 1.2em;
			word-wrap: break-word;
		}
		element.style {
			margin-bottom: 5px;
		}
		.card a h5 {
			font-size: 19px;
			line-height: 1.1em;
			width:120px;
			height:90px;
			margin:-7px;
			word-wrap: break-word;
			border-radius:105px ;
			display:block;
			background-color:#ccc;
			padding:15px;
			padding-top:40px;
			color:#fff;
			
		}
		.card div.people {
			bottom: 15px;
			left: 16px;
			position: absolute;
		}
		div.people img{
			position:relative;
			left:18px;
			border-radius:100px;
		}
		div.prodnamelabel{
			line-height:40px;
			font-size:20px;
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		}
	</style>
</head>
<body>
	<div class="navbar navbar-fixed-top">
  	<div class="navbar-inner">
	  	<div class="container-fluid">
				
				<a href="main.action" class="brand" style="margin-left:-10px">Work-CRM</a>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class=""><a href="main.action">首页</a></li>
			    </ul>
				<ul class="nav pull-right" style="margin-right:50px;">
					<li class="dropdown">
						<li class=""><a href="useredit.action">${sessionScope.user.username }</a></li>
						<li class="divider-vertical"></li>
						<li class=""><a href="loginout.action">注销</a></li>
					</li>
			    </ul>
				</div>
		  </div>
	  </div>
  </div>
  
	<div class="container">
		<h3 style="color:#333;">请选择产品</h3>
		<hr/>
		
	    <div class="tabbable"> 
		    <ul class="nav nav-tabs">
		    <li class="active"><a href="#tab1" data-toggle="tab"> 视  图 </a></li>
		    <li><a href="#tab2" data-toggle="tab"> 列  表 </a></li>
		    </ul>
		    <!-- 视图 -->
		    <div class="tab-content">
		    <div class="tab-pane active" id="tab1">
		    	<c:forEach items="${requestScope.userProducts}" var="userProduct">
					<div class="card">
						<a title="${userProduct.product.name }" class="project_card" href="welcome.action?id=${userProduct.product.id }">
			              <h5 >${userProduct.product.name }</h5>
			              <div class="people">
			                    <img width="50" height="50" title="${sessionScope.user.username }" src="head.action?id=${user.id }" class="avatar" >
			              </div>
						</a>
					</div>
				</c:forEach>
		    </div>
		     <!-- 列表哦 -->
		    <div class="tab-pane" id="tab2">
	    	    <table class="table">
				    
				    <tbody>
				    <c:forEach items="${requestScope.userProducts}" var="userProduct">
					 	 
							<tr>
							    <td width="10%">
							    	<a href="welcome.action?id=${userProduct.product.id }"> 
							   			 <img width="40" height="40" title="${sessionScope.user.username }" src="head.action?id=${user.id }" style="border-radius:5px;">
							   		</a>	 
							    </td>
							    <td width="90%">
							    	<a href="welcome.action?id=${userProduct.product.id }" > 
							    		<div class="prodnamelabel" title="${userProduct.product.name }">${userProduct.product.name }</div>
							    	</a>
							    </td>
						    </tr>
					    
				    </c:forEach>
				    </tbody>
			    </table>

		    	
		    </div>
		    </div>
	    </div>
		
		
		
		
		
	</div>
</body>
</html>