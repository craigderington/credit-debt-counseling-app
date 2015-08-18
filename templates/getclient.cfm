


			<!--- capture client id from url query string and start session, then redirect to the payment schedule --->
			
			<cfif structkeyexists( url, "fuseaction" ) and trim( url.fuseaction ) eq "getClientDetails">				
				
				<cfif structkeyexists( url, "clientID" ) and isvalid( "integer", url.clientID )>
				
					<!--- // define some vars --->
					<cfparam name="clientID" default="">
					<cfparam name="today" default="">
					<cfset clientID = url.clientID />	
					<cfset today = now() />
					
					<cfquery datasource="#application.dsn#" NAME="clientdetail">
						select personalData.clientID, personalData.clientFirstName, personalData.clientLastName, personalData.ssn,
							   personalData.spouseFirstName, personalData.spouseLastName, personalData.streetAddress, personalData.bothApplying, personalData.spouseCellPhone, personalData.spouseWorkPhone, personalData.spouseEmail,
							   personalData.city, personalData.stateID, personalData.zip, personalData.phone, personalData.faxPhone, personalData.cellPhone,
							   personalData.email, personalData.workPhone, personalData.preferredContact, personalData.TextMsg, personalData.flaggedNote, personalData.clientType, personalData.stateInitials,
							   personalData.CoClientTextMsg, states.stateID, states.stateAbbreviation,
							   referralSources.referralSource, programSummary.recordedCall, personalData.payDayClient, programSummary.ACHHold, programsummary.assignedOffice,
							   programSummary.accountLocked, programSummary.enrollmentCompletionDate, programSummary.salesDate, programSummary.clientStatus, programSummary.dvdUp
						  from personalData, states, programSummary, referralSources
						 where personalData.clientID = <cfqueryparam value="#clientID#" cfsqltype="cf_sql_integer" />
						   and personalData.clientID = programSummary.clientID
						   and personalData.stateID = states.stateID
						   and personalData.referralSource = referralSources.referralSourceID
					  order by clientFirstName, clientLastName ASC
					</cfquery>

					<cfset session.selectedClientID = clientdetail.clientID />
					<cfset session.selectedClientName = "#clientdetail.clientFirstName# #clientdetail.clientLastName#" />
					<cfset session.spouseName = "#clientdetail.spouseFirstName# #clientdetail.spouseLastName#" />
					<cfset session.address = "#clientdetail.streetAddress# #clientdetail.city#, #clientdetail.stateAbbreviation# #clientdetail.zip#" />
					<cfset session.ssn = "#clientdetail.ssn#" />
					<cfset session.phone = "#clientdetail.phone#" />
					<cfset session.faxPhone = "#clientdetail.faxPhone#" />
					<cfset session.cellPhone = "#clientdetail.cellPhone#" />
					<cfset session.email = "#clientdetail.email#" />
					<cfset session.workPhone = "#clientdetail.workPhone#" />
					<cfset session.preferredContact = "#clientdetail.preferredContact#" />
					<cfset session.TextMsg = "#clientdetail.TextMsg#" />
					<cfset session.CoClientTxtMsg = "#clientdetail.CoClientTextMsg#" />
					<cfset session.enrollmentDate = "#dateformat( clientdetail.enrollmentCompletionDate, 'mm/dd/yyy' )#" />
					<cfset session.status = "#clientdetail.clientStatus#" />
					<cfset session.flaggedNote = "#clientdetail.flaggedNote#" />
					<cfset session.leadSource = "#clientdetail.referralSource#" />
					<cfset session.spousecellphone = "#clientdetail.spouseCellPhone#" />
					<cfset session.spouseWorkPhone = "#clientdetail.spouseWorkPhone#" />
					<cfset session.spouseEmail = "#clientdetail.spouseEmail#" />
					<cfset session.bothApplying = "#clientdetail.bothApplying#" />
					<cfset session.clientType = "#clientdetail.clientType#" />
					<cfset session.clientState = "#clientdetail.stateInitials#" />
					<cfset session.payDayLoan = "#clientdetail.payDayClient#" />
					<cfset session.recordedCall = "#clientdetail.recordedCall#" />
					<cfset session.achHoldStat = "#clientdetail.ACHHold#" />
					<cfset session.DVD = "#clientdetail.dvdUp#" />
					<cfset session.CO = "#clientdetail.assignedOffice#" />	
					
					<cflocation url="#application.root#client" addtoken="no">	
					
				<cfelse>
					
					<!--- // throw error if the lead id is not numeric or an empty string --->
					<script>
						alert('Sorry, there was a problem starting the client session.  The client ID is malformed.  Please try again!');
						self-location="javascript:history.back(-1);"
					</script>
					
				</cfif>			
			
			<cfelse>
				
				<!--- // if the fuseaction is not defined - redirect to page.index --->
				<cflocation url="#application.root#?event=index&error=1" addtoken="no">
			
			</cfif>