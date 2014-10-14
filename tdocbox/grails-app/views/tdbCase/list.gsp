
<%@ page import="org.motrice.tdocbox.TdbCase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tdbCase.label', default: 'TdbCase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tdbCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tdbCase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="timeStamp" title="${message(code: 'tdbCase.timeStamp.label', default: 'Time Stamp')}" />
					
						<g:sortableColumn property="exception" title="${message(code: 'tdbCase.exception.label', default: 'Exception')}" />
					
						<th><g:message code="tdbCase.drill.label" default="Drill" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tdbCaseObjList}" status="i" var="tdbCaseObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tdbCaseObj.id}">${fieldValue(bean: tdbCaseObj, field: "timeStamp")}</g:link></td>
					
						<td>${fieldValue(bean: tdbCaseObj, field: "exception")}</td>
					
						<td>${fieldValue(bean: tdbCaseObj, field: "drill")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tdbCaseObjTotal}" />
			</div>
		</div>
	</body>
</html>
