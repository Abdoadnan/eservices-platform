<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="document" type="se.inherit.portal.beans.NewsDocument"--%>

<c:choose>
  <c:when test="${empty document}">
    <tag:pagenotfound/>
  </c:when>
  <c:otherwise>
    <c:if test="${not empty document.title}">
      <hst:element var="headTitle" name="title">
        <c:out value="${document.title}"/>
      </hst:element>
      <hst:headContribution keyHint="headTitle" element="${headTitle}"/>
    </c:if>
    
    <hst:cmseditlink hippobean="${document}"/>
    <h2>${document.title}</h2>
    <p>${document.summary}</p>
    <hst:html hippohtml="${document.html}"/>

	<c:if test="${not empty bonitaFormUrl}">
		<h1>User: <c:out value="${testUser}"/></h1>
		<iframe id="bonita_form" width="100%" height="400" frameborder="0" scrolling="auto" src="${bonitaFormUrl}"> </iframe>
	</c:if>
    
    
  </c:otherwise>  
</c:choose>