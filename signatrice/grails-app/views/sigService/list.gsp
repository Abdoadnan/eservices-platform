
<%@ page import="org.motrice.signatrice.SigService" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sigService.label', default: 'SigService')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sigService" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sigService" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="wsdlLocation" title="${message(code: 'sigService.wsdlLocation.label', default: 'Service Name')}" />
					
						<g:sortableColumn property="qNameUri" title="${message(code: 'sigService.qNameUri.label', default: 'QN ame Uri')}" />
					
						<g:sortableColumn property="qNameLocalPart" title="${message(code: 'sigService.qNameLocalPart.label', default: 'QN ame Local Part')}" />
					
						<th><g:message code="sigService.defaultDisplayName.label" default="Default Display Name" /></th>
					
						<th><g:message code="sigService.defaultPolicy.label" default="Default Policy" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sigServiceInstList}" status="i" var="sigServiceInst">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sigServiceInst.id}">${fieldValue(bean: sigServiceInst, field: "wsdlLocation")}</g:link></td>
					
						<td>${fieldValue(bean: sigServiceInst, field: "qNameUri")}</td>
					
						<td>${fieldValue(bean: sigServiceInst, field: "qNameLocalPart")}</td>
					
						<td>${fieldValue(bean: sigServiceInst, field: "defaultDisplayName")}</td>
					
						<td>${fieldValue(bean: sigServiceInst, field: "defaultPolicy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sigServiceInstTotal}" />
			</div>
		</div>
	</body>
</html>
