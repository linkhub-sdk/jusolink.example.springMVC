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

			<p class="heading1">Result</p>
			
			<br/>
			
			<fieldset class="fieldset1">
				<legend>${requestScope['javax.servlet.forward.request_uri']}</legend>

				<ul>
					<li>Result : ${Result}</li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
