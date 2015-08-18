		
			<cfcomponent displayname="dashboardservice">				
				<cffunction name="init" access="public" output="false" returntype="dashboardservice" hint="I create an initialized dashboard service object.">
					<cfreturn this >
				</cffunction>			
				<cffunction name="getdashboardclients" returntype="query" access="public" hint="I get the dashboard random client list.">					
					<cfset var dashboardclientlist = "" />
						<cfquery datasource="#application.dsn#" NAME="dashboardclientlist">
								SELECT TOP 10 pd.clientid, pd.clientfirstname, pd.clientlastname, ps.clientstatus, s.stateabbreviation,
									   (select max(paymentpaid) from payments p where p.clientid = pd.clientid and paymentpaid is not null) as lastpaydate
								  FROM personaldata pd, programsummary ps, states s
								 WHERE pd.clientid = ps.clientid
								   AND pd.stateID = s.stateID
								   AND ps.clientstatus = <cfqueryparam value="Active" cfsqltype="cf_sql_varchar" />
							  ORDER BY newid();							 
						</cfquery>
					<cfreturn dashboardclientlist>
				</cffunction>
				<cffunction name="getdashboard" access="public" returntype="query" output="false" hint="I get the dashboard counts.">
					<cfset var dashboard = "" />
						<cfquery datasource="#application.dsn#" NAME="dashboard">
							select
								(select count(ps.clientid) from programsummary ps where ps.clientstatus = <cfqueryparam value="active" cfsqltype="cf_sql_varchar" />) as totalactiveclients,
								(select count(ps.clientid) from programsummary ps where ps.clientstatus = <cfqueryparam value="prospect" cfsqltype="cf_sql_varchar" />) as totalprospect,
								(select count(ps.clientid) from programsummary ps where ps.clientstatus = <cfqueryparam value="completed" cfsqltype="cf_sql_varchar" />) as totalcompleted,
								(select sum(dw.balanceInitial) from debtworksheet dw, programsummary ps1 where dw.clientid = ps1.clientid and ps1.clientstatus = <cfqueryparam value="active" cfsqltype="cf_sql_varchar" /> ) as totaldebt										 
						</cfquery>
					<cfreturn dashboard>
				</cffunction>
			</cfcomponent>