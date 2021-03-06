<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
<title>Home page</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">

		<div class="navbar-header">
			<a class="navbar-brand" href="#"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Organizations <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/org/add.html">Add</a></li>
						<li><a
							href="${pageContext.request.contextPath}/org/list.html">List</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Teams <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/team/add.html">Add</a></li>
						<li><a
							href="${pageContext.request.contextPath}/team/list.html">List</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Team members <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/team_member/add.html">Add</a></li>
						<li><a
							href="${pageContext.request.contextPath}/team_member/list.html">List</a></li>
					</ul></li>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><spring:message
								code="label.language" text="Language (default)"/> <span class="caret"></span> </a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/index?locale=en">EN</a></li>
							<li><a
								href="${pageContext.request.contextPath}/index?locale=en_US">US</a></li>
						</ul></li>
				</ul>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	${message}
	<br />

</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>