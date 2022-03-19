<%@ page language="java" import="com.bean.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增词汇</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="jquery/jquery-3.2.1.js"></script>
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/checkLoginStatus.js"></script>
</head>
<body style="background: linear-gradient(to bottom,#e7d2fb,#f8f1fe)">
	<nav class="navbar-inverse visible-lg visible-md" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">计算机专业词典系统</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                   <li><a href="index2.jsp">首页</a></li>
				<li class="active" id="userAdd"><a href="#">新增词汇</a></li>
				<li id="userFeedback"><a href="#">查无反馈</a></li>
				<c:if test="${empty sessionScope.currentUser }">
					<li id="login"><a href="login.jsp">登陆</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.currentUser }">
					<li id="user" data-toggle="modal" data-target="#changePassword"><a>欢迎您，${currentUser.username}</a></li>
					<li id="exit"><a href="#">退出</a></li>
				</c:if>
                </ul>
            </div>
        </div>
    </nav>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h3 class="pull-left">新增词汇</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="form-group">
				<label for="abbreviation">缩略词：</label>
				<input type="text" class="form-control" id="abbreviation" placeholder="" style="width: 50%;">
			</div>
			<div class="form-group">
				<label for="fullWords">完整英文词汇：</label>
				<input type="text" class="form-control" id="fullWords" placeholder="必填"  style="width: 50%;">
			</div>	
			
			<div class="form-group">
				<label for="specificMeanning">中文解释：</label>
				<input type="text" class="form-control" id="specificMeanning" placeholder="必填" style="width: 50%;">
			</div>
			
			<div class="form-group">
				<label for="specificMeanning">专业名词含义：</label>
				<textarea class="form-control" rows="5" id="lemmaSummary" placeholder="" style="width: 80%;"></textarea> 
				
			</div>
			
			<button class="btn btn-primary pull-right" id="addBtn" style="margin-right: 20%;">提交</button>
			<button type="button" class="btn btn-default pull-right" id="reset" style="margin-right:10px;">重置</button>
		</div>
	</div>
	<%@ include file="modal.jsp" %>

</body>
<script type="text/javascript">
$(function(){
	$("#addBtn").click(function(){
		var abbreviation=$("#abbreviation").val();
		var fullWords=$("#fullWords").val();
		var specificMeanning=$("#specificMeanning").val();
		var lemmaSummary=$("#lemmaSummary").val();
		if(fullWords==""||fullWords==null){
			if(specificMeanning==""||specificMeanning==null){
				$("#fullWords").css('border-color','red');
				$("#specificMeanning").css('border-color','red');
			}else{
				$("#fullWords").css('border-color','red');
			}
			return;
		}
		if(specificMeanning==""||specificMeanning==null){
			$("#specificMeanning").css('border-color','red');
			return;
		}
		$.ajax({url:"feedback",async:true,data:{"action":"userAdd","abbreviation":abbreviation,"fullWords":fullWords,"specificMeanning":specificMeanning,"lemmaSummary":lemmaSummary},success:function(result,status){
			//alert(result);
			if(result=="1"){
				alert("提交成功!");
				//window.location.href = "index2.jsp";
				window.location.reload();
				}
			else{
				alert("提交失败!");
				//window.location.href = "index2.jsp";
				
				window.location.reload();
			}
		}})
		
		
		
	})
	
	
	
	
})



</script>
</html>