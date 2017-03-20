<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/personnel/comm/js/comm/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人工资表明细</title>
<style type="text/css">
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

a {
	text-decoration: none;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}

-->
.normal {
	text-decoration: none;
}

.white {
	text-decoration: none;
	color: white;
}

.checkItem {
	text-decoration: none;
	color: white;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {

				//全选的控制 全选被选中 其余也被选中
				$("input.checkbox11").click(function() {
					if ($(this).attr("checked")) {
						$("input[name=checkbox]").each(function() {
							$(this).attr("checked", "checked");
						});
					} else {
						$("input[name=checkbox]").each(function() {
							$(this).attr("checked", "");
						});
					}

				});
				//标题栏上的删除控制  其在checkbox中如果有不是自己备份的文件是不可以删除的
				$("a.checkItem").click(
						function() {
							var flag = true;
							var re = true;
							if ($("input[name=checkbox]:checked").length == 0) {
								alert("对不起 请选中需要删除的项)");
								flag = false;
							}
							$("input[name=checkbox]:checked").each(
									function() {
										if ($("input[name=username]").attr(
												"value") != $(this).attr(
												"opName")) {
											flag = false;
											re = false;
										}
									});
							if (!re) {
								alert("对不起  你的权限不足");
							}
							if (flag) {
								//form表单提交
								$("form").attr("action",
										"bak.sys?method=delSome");
								$("form").submit();
							}
							return false;
						});
				//基本操作上的 删除控制  不是自己备份的文件不让删
				$("a.normaldel").click(
						function() {
							var flag = true;
							if ($("input[name=username]").attr("value") != $(
									this).attr("opName")) {
								flag = false;
								alert("对不起 你的权限不足");
							}
							return flag;
						});
				//对顶端的编辑选项进行控制  查过一个checkbox 不让
				$("a#Topedit").click(
						function() {
							var flag = true;
							if ($("input[name=checkbox]:checked").length > 1) {
								alert("对不起 你选中的项多余一个)");
								flag = false;
							}
							if ($("input[name=checkbox]:checked").length == 0) {
								alert("对不起 请选中需要编辑的项");
								flag = false;
							}
							$("input[name=checkbox]:checked").each(
									function() {
										if ($("input[name=username]").attr(
												"value") != $(this).attr(
												"opName")) {
											flag = false;
											alert("对不起 你的权限不足");
										}
									});
							if (flag) {
								$("form").attr("action",
										"bak.sys?method=jumpEdit");
								$("form").submit();
							}
							return false;
						});

				//对基本中编辑的进行控制
				$("a.normaledit").click(
						function() {
							var flag = true;
							if ($("input[name=username]").attr("value") != $(
									this).attr("opName")) {
								flag = false;
								alert("对不起 你的权限不足");
							}
							return flag;
						});
				//对顶端的查看选项进行控制  查过一个checkbox 不让
				$("a#TopSee").click(
						function() {
							var flag = true;
							if ($("input[name=checkbox]:checked").length > 1) {
								alert("对不起 你选中的项多余一个)");
								flag = false;
							}
							if ($("input[name=checkbox]:checked").length == 0) {
								alert("对不起 请选中需要编辑的项");
								flag = false;
							}
							if (flag) {
								$("form").attr("action",
										"bak.sys?method=jumpBakDetail");
								$("form").submit();
							}
							return false;
						});
				//对基本中查看的进行控制
				$("a.normalsee").click(function() {
					var flag = true;

					return flag;
				});
				//对备份文件的描述的控制
				$("span.remark").each(function() {
					if ($(this).text().length > 12) {
						var a = $(this).text().substring(0, 12);
						$(this).text(a + "••• •••");
					}
				});
				//控制跳转到多少页
				$("a#tiao").click(
						function() {
							var flag = true;
							//alert($("input[name=allpage]").val());
							//alert($("input#textfield").val());
							if ($("input#textfield").val() < 1
									|| $("input#textfield").val() > $(
											"input[name=allpage]").val()) {
								flag = false;
							} else {
								$("a#tiao").attr(
										"href",
										"bak.sys?method=query&&page="
												+ $("input#textfield").val());

							}
							return flag;
						});
			});
</script>
</head>
<body>

<center>		
	<c:if test="${person!=null}">
		<hr color="blue" size="1px"><br>
		<table cellpadding="10px">
			<tr>
				<td>员工号:</td>
				<td align="left"><input type="text" id="workid" name="workid" readonly="readonly" value="${person.getWorkId() }" /></td>
				<td>员工名称:</td>
				<td align="left"><input type="text" id="name" name="name" readonly="readonly" value="${person.getPersonnelName() }" /><br /></td>
			</tr>
		</table>
	</c:if>
</center>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="topUp">
		<tr>
			<td height="30">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="24" bgcolor="#353c44">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom">
													<div align="center">
														<img src="/personnel/comm/images/comm/tb.gif" width="14" height="14" />
													</div>
												</td>
												<td width="94%" valign="bottom">
													<span class="STYLE1">个人工资表查询</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
    		<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
     				<tr>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年份</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">月份</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖金</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">午餐补助</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">交通补助</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">资本工资</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">应付工资</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚次数</span></div></td>
        				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">实际工资</span></div></td>
      				</tr>
    			</table>
    		</td>
    	</tr>
    	<tr>
		  	<td>
		  		<c:if test="${payrollone!=null}">
	  			<tr>
	   				<td>
	  			  		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
	     					<tr>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${payrollone.getYear()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${payrollone.getMonth()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${payrollone.getSalary().getBonus()==null? 0:payrollone.getSalary().getBonus()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${payrollone.getSalary().getLunchSalary()==null?0:payrollone.getSalary().getLunchSalary()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${payrollone.getSalary().getTrafficSalary()==null?0:payrollone.getSalary().getTrafficSalary()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${payrollone.getSalary().getBasicSalary()==null?0:payrollone.getSalary().getBasicSalary()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${payrollone.getSalary().getTrafficSalary()==null?0:payrollone.getSalary().getAllSalary()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${payrollone.getPbtimes()}</span></span></div></td>
	       						<td width="10%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${payrollone.getTotal()}</span></span></div></td>
	     					 </tr>
	   					</table>
	   				</td>
	 			</tr>
		  		</c:if>
			</td>
		</tr>


		<tr>
    		<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
     				<tr>
        				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚日期</span></div></td>
        				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚积分</span></div></td>
        				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚金钱</span></div></td>
        				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚等级</span></div></td>
        				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">奖罚原因</span></div></td>
      				</tr>
    			</table>
    		</td>
    	</tr>
    	<tr>
		  	<td>
		  		<c:forEach var="encorchast" items="${payrollone.getPeoc()}" varStatus="status">
	  			<tr>
	   				<td>
	  			  		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
	     					<tr>
	       						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${encorchast.getPeocDate()}</span></span></div></td>
	       						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${encorchast.getEncorchast().getPersonnelEncOrChastPoint()}</span></span></div></td>
	       						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${encorchast.getEncorchast().getMoney()}</span></span></div></td>
	       						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       						<span class="STYLE10"><span>${encorchast.getEncorchast().getPersonnelEncOrChastSort()}</span></span></div></td>
	       						<td width="20%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
	       					 	<span class="STYLE10"><span>${encorchast.getPeocReason()}</span></span></div></td>
	     					 </tr>
	   					</table>
	   				</td>
	 			</tr>
		  		</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>