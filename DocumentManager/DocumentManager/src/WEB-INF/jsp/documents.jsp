<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Document Manager - viralpatel.net</title>
</head>
<body>

	<h2>Document Manager</h2>
	
	<h3>Add new document</h3>
	
	<form:form method="post" action="save.html" commandName="document" enctype="multipart/form-data">
		<form: errors path="*" cssClass="error"	/>
		<table>
			<tr>
				<td><form:label path="name">Nome</form:label></td>
				<td><form:input path="name"></form:input></td>
			</tr>
			<tr>
				<td><form:label path="description">Description</form:label></td>
				<td><form:textarea path="description"></form:textarea></td>
			</tr>
			<tr>
				<td><form:label path="content">Document</form:label></td>
				<td><form:input path="file" name="file" id="file"></form:input></td>
		</table>	
	</form:form>
	
	<br />
	
	<h3>Document List</h3>
	<c:if test="${!empty documentLis}">
	<table class="data">
		<tr>
			<th>Name</th>
			<th>description</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${documentList}" var="document">
			<tr>
				<td width="100px">${document.name}</td>
				<td width="250px">${document.description}</td>
				<td width="20px">
					<a href="${pageContext.request.contextPath}/download/${document.id}.html">
						<img src="${pageContext.request.contextPath}/img/save_icon.gif" border="0" 
							title="Download this document" alt=""/></a> 
				
					<a href="${pageContext.request.contextPath}/remove/${document.id}.html"
						onclick="return confirm('Are you sure you want to delete this document?')"><img 
						src="${pageContext.request.contextPath}/img/delete_icon.gif" border="0" 
						title="Delete this document"/></a> 
				</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>