<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="jquery/jquery-3.2.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="js/login.js"></script>
<script src="js/checkLoginStatus.js"></script>
</head>
<body>

	<nav class="navbar-inverse visible-lg visible-md" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">计算机专业词典系统</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li ><a href="index2.jsp">首页</a></li>
					<li id="userAdd"><a href="#">新增词汇</a></li>
					<li><a href="userFeedback.jsp">查无反馈</a></li>
					<li class="active"><a href="login.jsp">登陆</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
	    <div class="row">
	        <div class="col-md-6 col-md-offset-3 form">
	            
	                <span class="heading">用户登录</span>
	                <div class="form-group">
	                    <input type="text" class="form-control" id="inputUsername" placeholder="用户名">
	                    <span class="text-muted usern">*用户名不能为空</span>
	                </div>
	                <div class="form-group help">
	                    <input type="password" class="form-control" id="inputPassword" placeholder="密码">  
	                    <span class="text-muted pwd">*密码不能为空</span>
	                </div>
	                <div class="form-group form-login">
	                    <div class="main-checkbox">
	                        <input type="checkbox" value="None" id="admin" name="check"/>
	                        <label for="admin"></label>
	                    </div>
	                    <span class="text">管&nbsp;理&nbsp;员</span> 
	                    <div class="main-checkbox">
	                        <input type="checkbox" value="None" id="user" name="check" checked/>
	                        <label for="user"></label>
	                    </div>
	                    <span class="text">用&nbsp;&nbsp;户</span>
	                    <button type="submit" class="btn btn-large btn-primary btn-block" id="login">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	                </div>
	                
	                <a href="register.jsp" class="pull-right" ><font color=grey>注册账号</font></a>
	            
	        </div>
	    </div>
	  </div>
</body>

</html>