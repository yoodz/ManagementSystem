<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/personnel/comm/js/comm/jquery.js"></script>
<script type="text/javascript"
	src="/personnel/comm/js/comm/chili-1.7.pack.js"></script>
<script type="text/javascript"
	src="/personnel/comm/js/comm/jquery.easing.js"></script>
<script type="text/javascript"
	src="/personnel/comm/js/comm/jquery.dimensions.js"></script>
<script type="text/javascript"
	src="/personnel/comm/js/comm/jquery.accordion.js"></script>
<script language="javascript">
	jQuery().ready(function() {
		
		$("#youk").css("height",$(document).height());
	
		jQuery('#navigation').accordion({
			header : '.head',
			navigation1 : true,
			event : 'click',
			fillSpace : true,
			animated : 'bounceslide'
		});
	});
	function PostOrder(_a,xmldoc) {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();

		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET", xmldoc, false);
		xmlhttp.send();
		if (xmlhttp.status == 404) {
			_a.href ="menu.sys?method=menuUrl404";
			return true;
		}
	}
</script>
<style type="text/css">
<!--
body {
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}

#navigation {
	margin: 0px;
	padding: 0px;
	width: 147px;
}

#navigation a.head {
	cursor: pointer;
	background: url(/personnel/comm/images/comm/main_34.gif) no-repeat
		scroll;
	display: block;
	font-weight: bold;
	margin: 0px;
	padding: 3px 0px;
	text-align: center;
	font-size: 12px;
	text-decoration: none;
}

#navigation ul {
	border-width: 0px;
	margin: 0px;
	padding: 0px;
	text-indent: 0px;
}

#navigation li {
	list-style: none;
	display: inline;
}

#navigation li li a {
	display: block;
	font-size: 12px;
	text-decoration: none;
	text-align: center;
	padding: 0px;
}

#navigation li li a:hover {
	background: url(/personnel/comm/images/comm/tab_bg.gif) repeat-x;
	border: solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
	<div id="youk">
		<ul id="navigation">

			<c:forEach var="menuall" items="${menus }">
				<li><a class="head">${menuall.menuName }</a>
					<ul>
						<c:forEach var="menuson" items="${menusons }">
							<c:if test="${menuson.menu==menuall }">
								<li><a href="${menuson.menuUrl}" target="rightFrame"
									onclick="return PostOrder(this,'${menuson.menuUrl}');">${menuson.menuName}</a></li>
							</c:if>
						</c:forEach>
					</ul></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>