
<%@ page import="org.motrice.signatrice.SigResult" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sigResult.label', default: 'SigResult')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sigResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sigResult" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="transactionId" title="${message(code: 'sigResult.transactionId.label', default: 'Transaction Id')}" />
					
						<g:sortableColumn property="orderRef" title="${message(code: 'sigResult.orderRef.label', default: 'Order Ref')}" />
					
						<g:sortableColumn property="autoStartToken" title="${message(code: 'sigResult.autoStartToken.label', default: 'Auto Start Token')}" />
					
						<g:sortableColumn property="personalIdNo" title="${message(code: 'sigResult.personalIdNo.label', default: 'Personal Id No')}" />
					
						<th><g:message code="sigResult.progressStatus.label" default="Progress Status" /></th>
					
						<th><g:message code="sigResult.faultStatus.label" default="Fault Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sigResultInstList}" status="i" var="sigResultInst">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sigResultInst.id}">${fieldValue(bean: sigResultInst, field: "transactionId")}</g:link></td>
					
						<td>${fieldValue(bean: sigResultInst, field: "orderRef")}</td>
					
						<td>${fieldValue(bean: sigResultInst, field: "autoStartToken")}</td>
					
						<td>${fieldValue(bean: sigResultInst, field: "personalIdNo")}</td>
					
						<td>${fieldValue(bean: sigResultInst, field: "progressStatus")}</td>
					
						<td>${fieldValue(bean: sigResultInst, field: "faultStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sigResultInstTotal}" />
			</div>
		</div>
	</body>
</html>
