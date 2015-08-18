<cfcomponent displayname="leadservice">
	<cffunction name="init" access="public" output="false" returntype="leadservice" hint="I create an initialized lead service object.">
		<cfreturn this >
	</cffunction>		
	<cffunction name="getleadlist" access="public" returntype="query" output="false" hint="I get the list of prospects.">			
		<cfargument name="officeid" type="numeric" required="yes" default="#session.officeID#">
		<cfargument name="userid" type="numeric" required="yes" default="#session.userID#">
		<cfset var leadlist = "" />
			<cfquery datasource="#application.dsn#" NAME="leadlist">
				select personaldata.clientid, personaldata.clientfirstname, personaldata.clientlastname, personaldata.textmsg, 
					   personaldata.cellphone, personaldata.phone, personaldata.workphone, personaldata.email, personaldata.dateentered,
				       personaldata.textmsgnum, personaldata.bothapplying, personaldata.spousecellphone, personaldata.spouseworkphone, 
					   personaldata.spouseemail, programsummary.clientid, programsummary.salesdate, programsummary.enrollmentcompletiondate, 
					   personaldata.coclienttextmsg, personaldata.coclienttextmsgnum, states.stateid, states.stateabbreviation,
					   referralsources.referralsource
				  from personaldata, programsummary, states, referralsources, personnel
				 where personaldata.clientid = programsummary.clientid
				   and personaldata.referralsource = referralsources.referralsourceid
				   and programsummary.salespersonid = personnel.personnelid
				   and referralsources.referralsourceid <> <cfqueryparam value="95" cfsqltype="cf_sql_integer" />
				   and referralsources.referralsourceid <> <cfqueryparam value="96" cfsqltype="cf_sql_integer" />
				   and personaldata.stateid = states.stateid
				   and ( programsummary.assignedoffice = <cfqueryparam value="#arguments.officeid#" cfsqltype="cf_sql_integer" /> )				   
				   and programsummary.clientstatus = <cfqueryparam value="Prospect" cfsqltype="cf_sql_varchar" />

					    <cfif isuserinrole( "sales" )>
							and programsummary.salespersonid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer" />
						</cfif>
							
						<cfif structkeyexists( form, "filtermyresults" )>
								
							<cfif structkeyexists( form, "leadsource" ) and form.leadsource is not "" and form.leadsource is not "Filter Lead Source">					   
								and personaldata.referralsource = <cfqueryparam value="#form.leadsource#" cfsqltype="cf_sql_integer" />
							</cfif>
								
							<cfif structkeyexists( form, "filterbyname" ) and form.filterbyname is not "" and form.filterbyname is not "Filter By Name">					   
								and personaldata.clientfirstname + ' ' + personaldata.clientlastname LIKE <cfqueryparam value="#form.filterbyname#%" cfsqltype="cf_sql_varchar" />
							</cfif>
								
							<cfif structkeyexists( form, "counselors" ) and form.counselors is not "" and form.counselors is not "Filter Counselor">					   
								and programsummary.salespersonid = <cfqueryparam value="#form.counselors#" cfsqltype="cf_sql_integer" />
							</cfif>
								
							<cfif structkeyexists( form, "startleaddate" ) and form.startleaddate is not "" and form.startleaddate is not "Select Start Date" and structkeyexists( form, "endleaddate" ) and form.endleaddate is not "" and form.endleaddate is not "Select End Date">
									and personaldata.dateentered between <cfqueryparam value="#form.startleaddate#" cfsqltype="cf_sql_date" /> and <cfqueryparam value="#form.endleaddate#" cfsqltype="cf_sql_date" />
							</cfif>					   
							
						</cfif>
			
					
			  order by personaldata.clientlastname, personaldata.clientfirstname asc
			</cfquery>	
		<cfreturn leadlist>
	</cffunction>
</cfcomponent>