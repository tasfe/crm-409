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
			width:145px;
			height:91px;
			margin:-30px;
			word-wrap: break-word;
			border-radius:105px ;
			display:block;
			background-color:#ccc;
			padding:15px;
			padding-top:70px;
			color:#fff;
			
		}
		.card div.people {
			bottom: 15px;
			left: 16px;
			position: absolute;
		}
		div.people img{
			position:relative;
			left:20px;
			border-radius:100px;
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
						<li class=""><a href="edit.action">${sessionScope.user.username }</a></li>
						<li class="divider-vertical"></li>
						<li class=""><a href="loginout.action">注销</a></li>
					</li>
			    </ul>
				</div>
		  </div>
	  </div>
  </div>
  <div class="container">
		<div class="page-header" style="border-bottom:1px #333 solid">
    		<h1>${sessionScope.user.username } -<small>修改个人信息</small></h1>
 	 	</div>
 	 	
 	 	<c:if test="${param.code == '10001' }">
			<div class="alert alert-error">
		        <button data-dismiss="alert" class="close" type="button">×</button>
		       	上传的头像类型不正确..
		     </div>
      </c:if>
      
      <c:if test="${param.code == '10002' }">
	      <div class="alert alert-error">
	        <button data-dismiss="alert" class="close" type="button">×</button>
	       	文件不能超过2M。。
	      </div>
      </c:if>
      
      <c:if test="${param.code == '10000' }">
	     <div class="alert alert-success">
	       <button data-dismiss="alert" class="close" type="button">×</button>
	      	信息修改成功，如果修改了密码请重新登录
	     </div>
	   </c:if>
	   
	<form  method="post" id="modify" enctype="multipart/form-data"  action="modify.action" accept-charset="UTF-8"><div style="margin:0;padding:0;display:inline">
		<input type="hidden" value="${sessionScope.user.id }" name="user.id"></div>
	  <div class="row">
			<div class="span4">
				<div class="control-group string optional"><label for="user_name" class="string optional control-label"> 姓名</label><div class="controls"><input type="text" value="${sessionScope.user.username }" size="50" name="user.username" id="username" class="string optional"></div></div>
				  <div class="control-group password optional"><label for="user_password" class="password optional control-label"> 密码</label><div class="controls"><input type="password" size="50" name="user.password" id="password" class="password optional"><p class="help-block">如果不想修改密码，则留空。</p></div></div>
				  <div class="control-group password optional"><label for="user_password_confirmation" class="password optional control-label"> 确认密码</label><div class="controls"><input type="password" size="50" name="confirm" id="confirm" class="password optional"><p style="color:red;display:none" id="pwdhelp" class="help-block">两次输入的密码不同</p></div></div>
				  <div class="control-group password optional"><label for="user_current_password" class="password optional control-label"> 当前密码</label><div class="controls"><input type="password" size="50" name="user[current_password]" id="currentpassword" class="password optional"><p id="current" class="help-block">输入密码以确认修改</p></div></div>
		
				  <input type="button" id="btn" value="保存修改" name="commit" class="btn btn-warning">
			</div>
			<div class="span8">
				<p>
					<span style="display: inline-block;width: 55px; padding-top: 55px;font-size:1px"><img src="head.action"/></span> <br>
					<a href="javascript:;" id="headmodify">修改头像</a>
				</p>
	
				<p style="display:none;" id="avatar_field">
					从本地电脑选择一张大头照 (不要超过2M) <br>
					
						<input type="file" name="headfile" id="head">
				</p>
			</div>
			</div>
		</form>
	</div>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#headmodify").click(function(){
  			$("#avatar_field").show(500);
  		});
  		
  		var index = 0;
  		$("#currentpassword").blur(function(){
  			$.post("passwordValidate.action",{
  				"password":$("#currentpassword").val()
  			},function(date) {
  				if(date) {
  					index = 1;
  					$("#current").css("color","#333");
  					$("#current").text("密码输入正确");
  				} else {
  					index = 2;
  					$("#current").css("color","red");
  					$("#current").text("密码输入不正确");
  				}
  			  }
  			);
  		});
  		
  		$("#pwdhelp").keydown(function(){
  			$("#pwdhelp").hide(300);
  		});
  		
  		$("#btn").click(function(){
  			if($("#password").val() != $("#confirm").val()) {
  				$("#pwdhelp").show(500);
  			} else if(index == 0){
  				$("#current").css("color","red");
  				$("#current").text("请输入你的原始密码");
  			} else if(index == 2) {
  				$("#current").css("color","red");
				$("#current").text("密码输入不正确");
  			} else {
  				$("#modify").submit();
  			}
  		});
  		
  	});
  </script>
</body>
</html>