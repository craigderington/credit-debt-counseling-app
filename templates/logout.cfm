


		
		
		<!--- // kill the user ID --->
		<cfif structkeyexists( session, "userid" )>
			<cfparam name="tempU" default="">
			<cfset tempU = structdelete( session, "userid" ) />
		</cfif>		
		
		<!--- // kill the jsessionid --->
		<cfif structkeyexists( session, "jsessionid" )>
			<cfparam name="tempJ" default="">
			<cfset tempJ = structdelete( session, "jsessionid" ) />
		</cfif>		
			
		<!--- // log out the user --->
		<cflogout>
		
		<!--- // redirect to index page --->
		<cflocation url="#application.root#page.index&logout=1" addtoken="no">
		