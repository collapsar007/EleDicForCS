<%@ page language="java" import="com.bean.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>计算机专业英语词汇速查</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="jquery/jquery-3.2.1.js"></script>
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script src="jquery/jquerysession.js"></script>
<script src="js/index.js"></script>
<script src="js/checkLoginStatus.js"></script>
</head>
<style>
#result,#lemma-Summary{
	overflow:auto;
	padding:10px;
}
#error{
	position:absolute;right:0;bottom:0
}
#remark{
	position:absolute;
	left:0;
	bottom:0;
	color:#A9A9A9;
	font-size:13px;
}
</style>
<body style="background: linear-gradient(to bottom,#e7d2fb,#f8f1fe)">
<%
User currentUserr=(User)request.getSession().getAttribute("currentUser");
%>
<nav class="navbar-inverse visible-lg visible-md" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">计算机专业词典系统</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index2.jsp">首页</a></li>
				<li id="userAdd"><a href="#">新增词汇</a></li>
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
    
    <div class="container">
	<div class="row">
	<span style="float:left;margin-top:10px;">
		<!--<div class="col-md-4"></div>-->
		<div class="col-md-12">
			<!--  <form role="form">-->
				<div class="form-group form-inline">
					<label for="searchInput">关键字：</label>
					<input type="text" class="form-control" id="searchInput" placeholder="请输入查询的信息">
					<button type="submit" class="btn btn-primary" id="searchBtn">搜索</button>
					<!--  <button type="submit" class="btn btn-default" id="Btn">test</button>-->
				</div>	
			<!--  </form>-->
		</div>    
	</span>
	</div>
	<div class="row">
		<div class="col-md-5">
			<div style="border:1px solid #ccc;height:500px;" id="result">搜索结果区</div>
		</div>
		<div class="col-md-7">
			<div style="border:1px solid #ccc;height:500px;position:relative">
			<div id="lemma-Summary">详细信息区</div>
			<span id="remark" class="muted"></span>
            <a href="#" class="navbar-link pull-right" data-toggle="modal" data-target="#myModal" id="error">报错</a>
            </div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">报错</h4>
	            </div>
	            <div class="modal-body" id="errorModal">
					<div class="form-group form-inline">
						<label for="abbreviation">缩略词：</label>
						<input type="text" class="form-control" id="abbreviation" style="width: 52%;">
					</div>
					<div class="form-group form-inline">
						<label for="fullWords">完整英文词汇：</label>
						<input type="text" class="form-control" id="fullWords" style="width: 45%;">
					</div>	
					
					<div class="form-group form-inline">
						<label for="specificMeanning" >中文解释：</label>
						<input type="text" class="form-control" id="specificMeanning" style="width: 50%;">
					</div>
					
					<div class="form-group">
						<label for="specificMeanning">专业名词含义：</label>
						<textarea class="form-control" rows="5" id="lemmaSummary" placeholder="" style="width: 90%;"></textarea> 
					</div>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" id="postError">提交</button>
	                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	            </div>
	        </div>
	    </div>
	</div>
	</div>
<%@ include file="modal.jsp" %>
</body>
</html>