<%@ include file="/WEB-INF/jspf/htmlTags.jspf"%>

<!-- Workflow add candidate -->

<div id="box"><div>
    <h3><fmt:message key="mycases.workflowoverview.lbl"/></h3>
    <p>    
      <label><fmt:message key="mycases.priority.lbl"/></label>
      <select id="activity-priority">
		<option value="0"><fmt:message key="mycases.prioritynormal.lbl"/></option>
		<option value="1"><fmt:message key="mycases.priorityhigh.lbl"/></option>
		<option value="2"><fmt:message key="mycases.priorityurgent.lbl"/></option>
      </select>
    </p>
    <p> 
	    <span id="activity-candidates">Loading candidates...</span>
	    <a href="#" id="edit-candidates"><fmt:message key="mycases.editcandidates.lbl"/></a>
	    <a href="#" id="unassign"><fmt:message key="mycases.unassign.lbl"/></a>
    </p>
    <p>
	    <a href="#" id="assign-to-me"><fmt:message key="mycases.assigntome.lbl"/></a>
    </p>    
    <p>
    <a href="#" id="add-comment">Kommentera ärendet</a>
    </p>
 </div></div> 

<div id="box"><div>
<h3>Etiketter</h3>
    <ul>
      <li>diarienr: 12345678/12</li>
      <li>ansökan av: Pelle Pettersson</li>
      <li>och 5 till</li>
    </ul>
    <p><a href="#" id="add-tags"><fmt:message key="mycases.edittags.lbl"/></a></p>
 </div></div> 


<c:if test="${not empty guide}">
	<h3>Handl&auml;ggningsguide</h3>
	<h1>${guide.title}</h1>
	<p>${guide.summary}</p>
	<hst:html hippohtml="${guide.html}" />
</c:if>

<!-- Modal dialog to edit tags associated to the case-->
<div id="dialog-tags-case" title="<fmt:message key="mycases.tags.lbl"/>">
<p class="validateTips"><fmt:message key="mycases.tagsdialog.hint"/></p>
<!-- Taggar TODO case -->
<h3><fmt:message key="mycases.tags.lbl"/></h3>
 <table>
    <thead>
      <tr>
	<th>Aktivitet</th>
	<th>Typ</th>
	<th>V&auml;rde</th>
	<th>Tidstämpel</th>
	<th></th>
	<th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
	<td>
	  Start
	</td>
	<td>
	  Ansökan av
	</td>
	<td>
	  Kalle
	</td>
	<td>2013-01-22</td>
	<td><button class="edit-tag-btn" href="#">Redigera</button></td>
	<td><button class="remove-tag-btn" href="#"></button></td>
      </tr>
    </tbody>
  </table>

	<form action="/site/restservices/site-ajax/addTag" id="addTag" class="siteAjaxForm">
		<input type="hidden" name="activityInstanceUuid" value="${activity.activityInstanceUuid}" /> 
		<input type="text" name="tag-value" placeholder="Diarienr" /> 
		<input type="submit" value="<fmt:message key="mycases.add.lbl"/>" />
		<button class="add-tag-btn" href="#"></button>
	</form>
</div>

<!-- Modal dialog to comment the case-->
<div id="dialog-comment-case" title="<fmt:message key="mycases.addcomment.lbl"/>">
	<p class="validateTips"><fmt:message key="mycases.addcommentdialoghint.lbl"/></p>
	<form action="/site/restservices/site-ajax/addComment" id="addCommentForm" class="siteAjaxForm">
		<input type="hidden" name="activityInstanceUuid" value="${activity.activityInstanceUuid}" /> 
		<input type="text" name="comment" placeholder="<fmt:message key="mycases.message.column.lbl"/>" class="text ui-widget-content ui-corner-all"/> 
	</form>
</div> 

<!-- Modal dialog to edit candidates to perform the activity-->
<div id="dialog-edit-candidates" title="<fmt:message key="mycases.editcandidatesdlg.title"/>">
	<p class="validateTips"><fmt:message key="mycases.editcandidatesdlg.hint"/></p>
	
	<h3><fmt:message key="mycases.candidates.column.lbl"/></h3>
	 <table>
	    <thead>
	      <tr>
		<th><fmt:message key="mycases.name.lbl"/></th>
		<th><fmt:message key="mycases.username.lbl"/></th>
		<th></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
		<td>
		  Bj&ouml;rn Molin
		</td>
		<td>
		  bjmo
		</td>
		<td><button class="remove-candidate-btn" href="#"></button></td>
	      </tr>
	    </tbody>
	  </table>
	<h3>Sök användare</h3>
	<form>
	<fieldset>
	<label for="name"><fmt:message key="mycases.name.lbl"/></label>
	<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
	<label for="email"><fmt:message key="mycases.email.lbl"/></label>
	<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
	<button id="search-button" class="search-button"><fmt:message key="mycases.search.lbl"/></button>
	
	 <table>
	    <thead>
	      <tr>
		<th><fmt:message key="mycases.name.lbl"/></th>
		<th><fmt:message key="mycases.username.lbl"/></th>
		<th></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
		<td>
		  John Doe
		</td>
		<td>
		  john
		</td>
		<td><button class="add-candidate-btn" href="#"></button></td>
	      </tr>
	      <tr>
		<td>
		  Jack
		</td>
		<td>
		  jack
		</td>
		<td><button class="add-candidate-btn" href="#"></button></td>
	      </tr>
	      <tr>
		<td>
		  James
		</td>
		<td>
		  james
		</td>
		<td><button class="add-candidate-btn" href="#"></button></td>
	      </tr>
	    </tbody>
	  </table>
	</fieldset>
	</form>
	
	<form action="/site/restservices/site-ajax/assignTask" id="addCandidate" class="siteAjaxForm">
		<input type="hidden" name="activityInstanceUuid" value="${activity.activityInstanceUuid}" /> 
		<input type="hidden" name="action" value="addcandidate" /> 
		<input type="hidden" size="8" name="targetUserId" placeholder="" /> 
	</form>
	
</div>


<form action="/site/restservices/site-ajax/assignTask" id="assignToMe" class="siteAjaxForm">
	<input type="hidden" name="activityInstanceUuid" value="${activity.activityInstanceUuid}" /> 
	<input type="hidden" name="action" value="assign" /> 
	<input type="hidden" size="8" name="targetUserId" value="${userName}" /> 
</form>
<form action="/site/restservices/site-ajax/assignTask" id="unassign" class="siteAjaxForm">
	<input type="hidden" name="activityInstanceUuid" value="${activity.activityInstanceUuid}" /> 
	<input type="hidden" name="action" value="unassign" /> 
	<input type="hidden" size="8" name="targetUserId" value="${userName}" /> 
</form>


<!-- jquery scripts for dialogs etc TODO move to separate js file -->
<script type="text/javascript">

$(".add-button").button(
  {
    color: 'green',
    icons: {primary: 'ui-icon-circle-plus', secondary: null}
  }
);

 $( "#dialog-tags-case" ).dialog({
autoOpen: false,
height: 300,
width: 350,
modal: true,
buttons: {
"Ok": function() {
var bValid = true;
allFields.removeClass( "ui-state-error" );
bValid = bValid && checkLength( tag, "Ogiltig etikett", 1, 255 );
if ( bValid ) {
 // submit form
}
},
Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});

 $( "#dialog-comment-case" ).dialog({
autoOpen: false,
height: 300,
width: 350,
modal: true,
buttons: {
"Kommentera": function() {
	siteAjaxPost($("#addCommentForm").attr( 'action' ), $("#addCommentForm").serialize(), function() {
        $("#dialog-comment-case").dialog( "close" );
    });
},
Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});

 $( "#dialog-edit-candidates" ).dialog({
autoOpen: false,
height: 500,
width: 400,
modal: true,
buttons: {
"Ok": function() {
var bValid = true;
allFields.removeClass( "ui-state-error" );
bValid = bValid && checkLength( name, "Namn", 1, 255 );
if ( bValid ) {

$( this ).dialog( "close" );
}
},
Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});

 $( "#add-candidate" ).click(function() {
$( "#dialog-edit-candidates" ).dialog( "open" );
});


$( "#add-comment" ).click(function() {
$( "#dialog-comment-case" ).dialog( "open" );
});

$( "#add-tags" ).click(function() {
$( "#dialog-tags-case" ).dialog( "open" );
});

$(".remove-candidate-btn").button({
  color: 'red',
  icons: {primary: 'ui-icon-trash', secondary: null}
});

$(".add-candidate-btn").button({
  color: 'green',
  icons: {primary: 'ui-icon-circle-plus', secondary: null}
});

$(".add-tag-btn").button({
  icons: {primary: 'ui-icon-circle-plus', secondary: null}
});
$(".edit-tag-btn").button();
$(".remove-tag-btn").button({
  icons: {primary: 'ui-icon-trash', secondary: null}
});

/*
 * Button and links to act on in page
 */
$("#assign-to-me").click(function() {
   siteAjaxPost("/site/restservices/site-ajax/assignTask", {activityInstanceUuid: '${activity.activityInstanceUuid}', action: 'assign', targetUserId: '${userName}'}, function(data) {
    refreshActivityWorkflowInfo(data);
   } );
});
$("#unassign").click(function() {
  siteAjaxPost("/site/restservices/site-ajax/assignTask", {activityInstanceUuid: '${activity.activityInstanceUuid}', action: 'unassign', targetUserId: '${userName}'}, function(data) {
   refreshActivityWorkflowInfo(data);
  } );
});

$("#activity-priority").change(function() {
	 siteAjaxPost("/site/restservices/site-ajax/setActivityPriority", {activityInstanceUuid: '${activity.activityInstanceUuid}', priority: $("select option:selected").val()}, function(data) {
	   refreshActivityWorkflowInfo(data);
	  } );
	});

/*
 * Refresh work flow info in page i.e. activity candidates and assigned 
 */
function refreshActivityWorkflowInfo(info) {
	   var str = "";

	   if (!$.isEmptyObject(info) &&  !$.isEmptyObject(info.assignedUserId)) {
		  /* Assigned task */
	      if (info.assignedUserId == '${userName}') {
			/* Assigned to me */
	        str = "Jag är tilldelad att utföra aktiviteten"; 
	        $("#assign-to-me").hide();
	        $("#unassign").show();
	        $("#edit-candidates").hide();
	      }
	      else {
			/* Assigned to someone else */
	        str = info.assignedUserId + " är tilldelad att utföra aktiviteten";
	        $("#assign-to-me").show();
	        $("#unassign").show();
	        $("#edit-candidates").hide();        
	      }
	   }
	   else {
		  /* not assigned i.e. list candidates */
	      if ($.isEmptyObject(info) || $.isEmptyObject(info.candidates)) {
	      	str = "Ingen kandidat till att utföra aktiviteten";
	   	  }
		   else {
		      if (info.candidates.length < 4) {
			     str = info.candidates.join(", ");	   
		      }
		      else {
		        str = info.candidates[0] + ", " + info.candidates[1] + ", " + info.candidates[2] + " och " + (info.candidates.length-3) + " till";
		      }
		  	    str += " är kandidater till att utföra aktiviteten";
	      }  
          $("#assign-to-me").show();
          $("#unassign").hide();
          $("#edit-candidates" ).show();
	   }

	   $("#activity-candidates").text(str);
	   $("#activity-priority").val(info.priority);
}

siteAjaxPost("/site/restservices/site-ajax/getActivityWorkflowInfo", {activityInstanceUuid: '${activity.activityInstanceUuid}'}, function(data) {
    refreshActivityWorkflowInfo(data);
} );


</script>
  