		
			<cfcomponent displayname="clientservice">
				<cffunction name="init" access="public" output="false" returntype="clientservice" hint="I create an initialized client service object.">
					<cfreturn this >
				</cffunction>
		
				<cffunction name="getclientlist" access="public" returntype="query" output="false" hint="I get the client details.">			
					<cfargument name="search" type="any" required="yes">
					
						<cfif isvalid( "integer", arguments.search )>
							<cfset clientID = arguments.search />
						<cfelseif isvalid( "string", arguments.search )>
							<cfset clientname = arguments.search />
						</cfif>
						<cfset var clientlist = "" />	
						<cfquery datasource="#application.dsn#" name="clientlist">					
								SELECT personalData.clientID, personalData.clientFirstName, personalData.clientLastName, personalData.ssn, 
									personalData.spouseFirstName, personalData.spouseLastName, personalData.streetAddress, personalData.bothApplying, personalData.spouseCellPhone, personalData.spouseWorkPhone, personalData.spouseEmail,
									personalData.city, personalData.stateID, personalData.zip, personalData.phone, personalData.faxPhone, personalData.cellPhone, 
									personalData.email, personalData.workPhone, personalData.preferredContact, personalData.TextMsg, personalData.flaggedNote, personalData.clientType, personalData.stateInitials,
									states.stateID, states.stateAbbreviation, personalData.CoClientTextMsg,
									referralSources.referralSource, programSummary.recordedCall, personalData.payDayClient, programSummary.ACHHold, programsummary.assignedOffice,
									programSummary.accountLocked, programSummary.enrollmentCompletionDate, programSummary.salesDate, programSummary.clientStatus, programSummary.dvdUp
								FROM personalData, states, programSummary, referralSources
							   WHERE personalData.stateID = states.stateID
								AND personalData.clientID = programSummary.clientID															   
								AND personalData.referralSource = referralSources.referralSourceID	
									<cfif isdefined( "clientID" )>
										AND personalData.clientID = <cfqueryparam value="#clientID#" cfsqltype="cf_sql_integer" />								   
									<cfelseif isdefined( "clientname" )>
										AND personalData.clientFirstName + ' ' + personalData.clientLastName LIKE <cfqueryparam value="#clientname#%" cfsqltype="cf_sql_varchar" />								
									</cfif>
							ORDER BY personaldata.clientID DESC, personaldata.clientFirstName, personaldata.clientLastName ASC  
						</cfquery>
					<cfreturn clientlist>
				</cffunction>
				
				<cffunction name="checkclientsettings" returntype="query" access="public" hint="I get some client settings.">
					<cfargument name="clientID" type="numeric" required="yes" default="#session.selectedclientid#">
					<cfset var checkclient = "" />
					<cfquery datasource="#application.dsn#" NAME="checkclient">
						SELECT pd.clientid, pd.paperCheck, ps.achhold, ps.achholddate, ps.achholdreason, ps.freezeacct, ps.freezedate,
							   ps.achban, ps.achbandate, ps.achbanreason
						  FROM personalData pd, programsummary ps
						 WHERE pd.clientid = ps.clientid
						   AND pd.clientID = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" />							 
					</cfquery>
					<cfreturn checkclient>
				</cffunction>
			</cfcomponent>