<cfoutput>
	<div class="alert alert-danger alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<i class="fa fa-warning fa-3x"></i> <h2><strong> SECURITY SYSTEM ALERT!</strong></h2> 
		<p>You are attempting to access a secured resource in which your user's permissions are insufficient.</p>
		<p><strong><i>This activity has been logged and an email has been sent to the system administrator.</i></strong></p>
		<p>Event Date Time Stamp:  #dateformat( now(), "mm/dd/yyyy" )# at #timeformat( now(), "hh:mm:ss tt" )#</p>
		<p>Security Reference ID:  #createuuid()# </p>
		<p>You can navigate away from this page at any time.</p>
	</div>
</cfoutput>