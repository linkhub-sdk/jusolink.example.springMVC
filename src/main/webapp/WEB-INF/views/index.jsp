<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="/resources/main.css" media="screen" />
		
		<title>주소링크 SDK SpringMVC Example.</title>
	</head>

	<body>

		<div id="content">
			<p class="heading1">주소검색 API SDK SpringMVC Example.</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>주소검색 관련  API</legend>
					<ul>
						<li><a href="search">search</a> - 주소검색 </li>
					</ul>
			</fieldset>
			
			<br />
			<br />
			<fieldset class="fieldset1">
				<legend>과금 API</legend>
					<ul>
						<li><a href="getBalance">getBalance</a> - 잔여포인트 확인</li>
						<li><a href="getUnitCost">getUnitCost</a> - 검색 단가 확인</li>
					</ul>
				</fieldset>
			<br />
			
		 </div>
	</body>
</html>
