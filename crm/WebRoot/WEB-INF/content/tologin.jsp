<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>CRM-登录</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<style type="text/css">
		body{
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-size: 13px;
			line-height: 18px;
			background-color:#F3F1Ec;
		}
		.content{
			width: 448px;
			margin: 0 auto 0 auto;
			padding: 15px 0 0px 40px;
			border-left: 1px solid #CCCCCC;
			border-right: 1px solid #CCCCCC;
			border-bottom: 1px solid #CCCCCC;
		}
		.block_head{
			width: 470px;
			margin: 0 auto 0 auto;
			padding: 10px;
			border-radius:5px;
		}
		.header{
			width: 470px;
			margin: 50px auto 35px auto;
		}
		a{
			color:#333;
			font-size:50px;
		}
		a:hover{
			text-decoration: none;
		}
		input{
			padding: 7px;
		}
		.action{
			width: 410px;
			margin: 30px auto 0 -25px;
		}
		.form1{
			width:290px;
		}
		
		.formhint {
		    background-color: #F8FCFE;
		    border-bottom: 2px solid #84B3CA;
		    color:red;
		    font-size: 14px;
		    height: 60px;
		    left: 0;
		    line-height: 60px;
		    position: fixed;
		    text-align: center;
		    top: 0;
		    width: 100%;
		    z-index: 1000;
		    display: none;
		}
		.reg {
		    position: absolute;
		    right: 35%;
		    top: 12%;
		}
		.reg a{
			font-size:14px;
		}
		.reg a:hover{
			color:#333;
		}
		.register {
		    background: none repeat scroll 0 0 rgba(0, 0, 0, 0.1);
		    border-radius: 50px 50px 50px 50px;
		    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
		    color: #333;
		    display: block;
		    font-size: 14px;
		    padding: 3px 15px;
		    position:relative;
		}
		.login{
			position:relative;
		}
	</style>
</head>
<body >
	
	<div></div>
	<div class="container">
		<div class="header">
			<h1 ><a href="index.jsp">CRM</a></h1>
		</div>
	  <div class="reg">
		<a class="register" href="javascript:;">申请注册帐号</a>
		</div>
		
	<!-- 登录 -->
	<div class="login">
	  <div class="well block_head" style="border:1px solid #ccc;border-bottom:none;margin-bottom:-5px;padding:9px;">
		<h3>系统登录</h3>
	  </div>
	  <div class="content">
	  		<div class="formhint move" id="${param.code}">用户名或者密码错误</div>
	  		<div class="formhint move" id="${param.state}">该用户已存在，请重新注册</div>
		<form class="form1" id="myform" action="login.action" method="post">
			<div id="user" class="control-group">
				<label>用户名</label>
				<input type="text" class="span4" name="user.username" id="username">
				<span id="name_msg" style="color:red;display:none">用户名不能为空</span>
				<br/>
			</div>
			<div id="pwd" class="control-group">
				<label>用户密码</label>
				<input type="password" class="span4" id="password" name="user.password"><br/>
				<span id="pwd_msg" style="color:red;display:none">密码不能为空</span>
			</div>	
			<div class="action well">
				<input type="button" id="btn" value="登录" class="btn btn-primary btn-large"/>
				<input type="checkbox" name="rember" value="yes" style="margin-left: 30px"/>记住密码
			</div>
		</form>
	  </div>
	  </div>
	  
	  <!-- 注册 -->
	  <div class="regist" style="display:none; ">
	  <div class="well block_head" style="border:1px solid #ccc;border-bottom:none;margin-bottom:-5px;padding:9px;">
		<h3>申请注册</h3>
	  </div>
	  <div class="content" >
		<form class="form2" id="myform1" action="regist.action" method="post">
			<div id="company" class="control-group">
				<label>公司名称</label>
				<input type="text" class="span4" name="product.name" id="product">
				<span style="color:#888">或者团队，机构，学校等</span>
				<br/>
			</div>
			<div id="user1" class="control-group">
				<label>*用户名</label>
				<input type="text" class="span4" id="username1" name="user.username">
				<span id="name_msg1" style="color:red;display:none">用户名不能为空</span>
			</div>
			<div id="pwd1" class="control-group">
				<label>*密码</label>
				<input type="password" class="span4" id="password1" name="user.password">
				<span id="pwd_msg1" style="color:red;display:none">密码不能为空</span>
			</div>
			<div id="pwd2" class="control-group">
				<label>*密码确认</label>
				<input type="password" class="span4" id="password2" name="confirmpwd">
				<span id="pwd_msg2" style="color:red;display:none">请确认密码</span>
				<span id="pwd_msg3" style="color:red;display:none">两次密码输入不同</span>
			</div>		
			<div class="action well">
				<input type="button" id="btn1" value="注册" class="btn btn-primary btn-large"/>
			</div>
		</form>
	  </div>   
	  </div>
    </div>
	
	<script type="text/javascript" src="js/jQuery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function login(){
				if($.trim($("#username").val()) == "" ){
					$("#user").attr("class","control-group error");
					$("#username")[0].focus();
					$("#name_msg").show(2000);
				} else if($("#password").val() == ""){
					$("#pwd").attr("class","control-group error");
					$("#password")[0].focus();
					$("#pwd_msg").show(2000);
				} else {
					$("#myform").submit();
					
					
				}
				
			}
		function reg(){
				if($.trim($("#username1").val()) == "" ){
					$("#user1").attr("class","control-group error");
					$("#username1")[0].focus();
					$("#name_msg1").show(2000);
				} else if($("#password1").val() == ""){
					$("#pwd1").attr("class","control-group error");
					$("#password1")[0].focus();
					$("#pwd_msg1").show(2000);
				} else if($("#password2").val() == ""){
					$("#pwd2").attr("class","control-group error");
					$("#password2")[0].focus();
					$("#pwd_msg2").show(2000);
				}  else if($("#password2").val() != $("#password1").val()){
					$("#pwd2").attr("class","control-group error");
					$("#password2")[0].focus();
					$("#pwd_msg3").show(2000);
				}  else {
						$("#myform1").submit();
					
				}
			}
		$(document).ready(function(){
			//登陆
			
			$("#username").blur(function(){
				if($.trim($("#username").val()) == "") {
					$("#user").attr("class","control-group error");
					$("#name_msg").show(2000);
				} else{
					$("#password")[0].focus();
				}
			});
			
			$("#username").keydown(function(){
				$("#user").attr("class","control-group");
				$("#name_msg").hide();
			});
			
			$("#password").blur(function(){
				if($("#password").val() == "") {
					$("#pwd").attr("class","control-group error");
					$("#pwd_msg").show(2000);
				}
			});
			
			$("#password").keydown(function(){
				$("#pwd").attr("class","control-group");
				$("#pwd_msg").hide();
			});
			$("#btn").click(function(){
				login();
			});
			$(window).keydown(function(event){
						if(event.keyCode == 13){
							login();
							
						}
					});
			
			
			//注册
			
			
			$("#username1").blur(function(){
				if($.trim($("#username1").val()) == "") {
					$("#user1").attr("class","control-group error");
					$("#name_msg1").show(2000);
				} else{
					$("#password1")[0].focus();
				}
			});
			
			$("#username1").keydown(function(){
				$("#user1").attr("class","control-group");
				$("#name_msg1").hide();
			});
			
			$("#password1").blur(function(){
				if($("#password1").val() == "") {
					$("#pwd1").attr("class","control-group error");
					$("#pwd_msg1").show(2000);
				}
			});
			
			$("#password1").keydown(function(){
				$("#pwd1").attr("class","control-group");
				$("#pwd_msg1").hide();
			});
			$("#password2").blur(function(){
				if($("#password2").val() == "") {
					$("#pwd2").attr("class","control-group error");
					$("#pwd_msg2").show(2000);
				}
			});
			
			$("#password2").keydown(function(){
				$("#pwd2").attr("class","control-group");
				$("#pwd_msg2").hide();
				$("#pwd_msg3").hide();
			});
			$("#btn1").click(function(){
				reg();
			});
			$(window).keydown(function(event){
				if(event.keyCode == 13){
					reg();
				}
			});
			
			
			
			
			var st;
			$("#10000").slideDown(500,function(){
				st = setTimeout(function(){
					$("#10000").slideUp(3000,function(){
						clearTimeout(st);
					});
				},2000);
			});
			$("#10001").slideDown(500,function(){
				st = setTimeout(function(){
					$("#10001").slideUp(3000,function(){
						clearTimeout(st);
					});
				},2000);
			});
			var count = 0;
			//跳转到注册页面
			$(".register").click(function(){
				if(count == 0) {
					$(".register").text("已有账号登录");
					$(".login").hide(500,function(){
						$(".regist").fadeIn(500);
					});
					count =1;
				} else if(count == 1){
					$(".register").text("申请注册账号");
					$(".regist").hide(500,function(){
						$(".login").fadeIn(500);
					});
					count = 0;
				}
				
			});
			
			
		});
	</script>
</body>
</html>