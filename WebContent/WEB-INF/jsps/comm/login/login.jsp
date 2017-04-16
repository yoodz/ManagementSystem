<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/personnel/comm/css/information/printInfo.css">
<title>Insert title here</title>
</head>
<body>

   <%--  <jsp:include page="/comm/resource/comm/login.html"></jsp:include> --%>

  <div class="main_content">
  <div class="name-style">
    <span>员工管理系统</span>
  </div>
    <div class="input-content">
      <span id="result_a" class="error-message">${result}</span>
      <form action="log.do" method="post">
          <input type="hidden" name="method" value="login">
          <div class="input-div margin-top">
            <input class="input-style input-user-pwd" placeholder="请输入用户名" type="text" name="username">
          </div>
          <div class="input-div">
            <input class="input-style input-user-pwd" placeholder="请输入密码" type="password" name="password">
          </div>
          <div class="button-content">
            <input type="reset" class="base-button" value="重置"/></td>
            <input type="submit" class="base-button" value="提交"/></td>
          </div>
      </form>
    </div>
  </div>



<script type="text/javascript">

document.getElementById("result_").innerHTML=document.getElementById("result_a").innerHTML;
alert(document.getElementById("result_a").innerHTML);
</script>
</body>
</html>