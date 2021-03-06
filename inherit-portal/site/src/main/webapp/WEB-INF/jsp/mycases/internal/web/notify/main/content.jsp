<%-- == Motrice Copyright Notice == 
 
  Motrice Service Platform 
 
  Copyright (C) 2011-2014 Motrice AB 
 
  This program is free software: you can redistribute it and/or modify 
  it under the terms of the GNU Affero General Public License as published by 
  the Free Software Foundation, either version 3 of the License, or 
  (at your option) any later version. 
 
  This program is distributed in the hope that it will be useful, 
  but WITHOUT ANY WARRANTY; without even the implied warranty of 
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
  GNU Affero General Public License for more details. 
 
  You should have received a copy of the GNU Affero General Public License 
  along with this program. If not, see <http://www.gnu.org/licenses/>. 
 
  e-mail: info _at_ motrice.se 
  mail: Motrice AB, Långsjövägen 8, SE-131 33 NACKA, SWEDEN 
  phone: +46 8 641 64 14 
 
--%> 
 
 
<%@ include file="/WEB-INF/jspf/htmlTags.jspf" %>
<%--@elvariable id="document" type="org.inheritsource.portal.beans.NewsDocument"--%>


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
    
    <c:if test="${not empty guide}">
		<h1>${guide.title}</h1>
		<p>${guide.summary}</p>
		<hst:html hippohtml="${guide.html}"/>
	</c:if>
				    
  </c:otherwise>  
</c:choose>

		    <c:if test="${not empty activity}">
		       <c:choose>
		         <c:when test="${activity.typeId eq 5}">
		          <c:if test="${not empty notifyItem}">
		          	<p> <fmt:message key="mycases.actdoc"/>&nbsp;
						<a href="${notifyItem.actUri}"><fmt:message key="mycases.actdocLink"/></a>
					</p>
		          </c:if>
			    		<form method="post" action="notify/confirm">
								<input type="hidden" name="document" value="${activity.instanceId}" />
								<input type="submit" value="<fmt:message key="mycases.notify.okbtn.label"/>"/>
						</form>
					
				</c:when>
			  	<c:otherwise>
			  	   <fmt:message key="mycases.noform.cannothandle"/>
			  	</c:otherwise>
			  </c:choose>
			</c:if>


<p></p>
<h1><fmt:message key="mycases.processInstanceDetails.lbl"/></h1>

<h2><fmt:message key="mycases.commentFeed.lbl"/></h2>
<ul id="commentfeed">
</ul>

<c:choose>
  <c:when test="${empty processInstanceDetails}">
  	<fmt:message key="mycases.noProcessInstanceDetails.lbl"/>
  </c:when>
  <c:otherwise> 
 	<h2><fmt:message key="mycases.pendingActivities.lbl"/></h2>   
 	<p></p>
	 <table class="display dataTable">
		<thead>
			<tr>
			   <th><fmt:message key="mycases.activity.column.lbl"/></th>
			   <th><fmt:message key="mycases.startDate.column.lbl"/></th>
			   <th><fmt:message key="mycases.expectedEndDate.column.lbl"/></th>
			   <th><fmt:message key="mycases.candidates.column.lbl"/></th>
			   <th><fmt:message key="mycases.assignedto.column.lbl"/></th>			   
			</tr>
		</thead>
		<tbody>
	    <c:if test="${not empty processInstanceDetails.pending}">
			<c:forEach var="pendingTask" items="${processInstanceDetails.pending}">
				<tr>
			 	  	<td>${pendingTask.activityLabel}</td>
			 	  	<!--  TODO check start date vs lastStateUpdate -->
			 	  	<td><fmt:formatDate value="${pendingTask.lastStateUpdate}" type="Both" dateStyle="short" timeStyle="short"/></td>
			 	  	<td><fmt:formatDate value="${pendingTask.expectedEndDate}" type="Date" dateStyle="short" timeStyle="short"/></td> 
			 	  	<td>
			 	  	<c:choose>
				 	  	<c:when test="${empty pendingTask.candidates}}">
				 	  		
				 	  	</c:when>
				 	  	<c:otherwise>
				 	  		<c:forEach var="candidate" items="${pendingTask.candidates}">
				 	  			${candidate}<br>
				 	  		</c:forEach>
				 	  	</c:otherwise>
			 	  	</c:choose>
			 	  	</td>
					<td>${pendingTask.assignedUser}</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<p></p> 
	
  	    
  	 <h2><fmt:message key="mycases.timeline.lbl"/></h2>
  	 <p></p>
  	 <tag:timelinebyday timelineByDay="${timelineByDay}" viewMode="full"/>
    
  </c:otherwise>
 </c:choose>
