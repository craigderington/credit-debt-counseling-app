


		<cfset temp1 = structdelete( session, "selectedclientid" ) />
		<cfset temp2 = structdelete( session, "selectedclientname" ) />
		<cfset temp3 = structdelete( session, "ssn" ) />
		<cfset temp4 = structdelete( session, "leadSource" ) />
		
		
		<cflocation url="#application.root#index" addtoken="no">