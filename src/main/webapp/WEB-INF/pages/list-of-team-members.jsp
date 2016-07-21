<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/css/bootstrap.min.css'>
<title>List of team members</title>
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
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<h1>List of team members</h1>
	<p>Here you can see the list of the team members, edit them, remove or update.</p>
	<table border="1px" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th width="10%">id</th>
				<th width="15%">first name</th>
				<th width="15%">last name</th>
				<th width="10%">position</th>
				<th width="10%">team</th>
				<th width="10%">actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="teamMember" items="${teamMembers}">
				<tr>
					<td>${teamMember.id}</td>
					<td>${teamMember.firstName}</td>
					<td>${teamMember.lastName}</td>
					<td>${teamMember.position}</td>
					<td><c:forEach items="${teamMember.teams}" var="team">
					${team.name}<br />
						</c:forEach></td>
					<td></td>
					<td><a
						href="${pageContext.request.contextPath}/team_member/edit/${teamMember.id}.html">Edit</a><br />
						<a
						href="${pageContext.request.contextPath}/team_member/delete/${teamMember.id}.html">Delete</a><br />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>
		<a href="${pageContext.request.contextPath}/index.html">Home page</a>
	</p>

</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>