<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="style/alogin.css" rel="stylesheet" type="text/css" />
<title>用户登录</title>
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="images/image.jsp?"+Math.random();
	}
	
</script>
</head>
<body >
<form id="form1" name="form1" action="login.htm" method="post">
	<div class="MAIN">
		<ul>
			<li class="top"></li>
			<li class="top2"></li>
			<li class="topA"></li>
			<li class="topB" style="line-height:140px;font-size:25px">
				<span> 
					&nbsp;&nbsp;&nbsp;酒店管理系统
				</span>
			</li>
			<li class="topC"></li>
			<li class="topD">
			<ul class="login">
				<li><span class="left">用户名：</span> <span style=""> <input id="name" name="name" type="text" class="txt" value="" /> </span></li>
				<li><span class="left">密&nbsp;&nbsp;&nbsp;码：</span> <span style=""> <input id="password" name="password" type="password" class="txt" value="" onkeydown= "if(event.keyCode==13)form1.submit()"/> </span></li>
				<li><span class="">
				</span></li>
			</ul>
			</li>
			<li class="topE"></li>
			<li class="middle_A"></li>
			<li class="middle_B"></li>
			<li class="middle_C"><span class="btn"> <img alt="" src="images/login/dl.png" onclick="javascript:document.getElementById('form1').submit()"/> &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<span ></span></li>
			<li class="middle_D"></li>
			<li class="bottom_A"></li>
			<li class="bottom_B"></li>
		</ul>
	</div>
</form>
</body>
</html>