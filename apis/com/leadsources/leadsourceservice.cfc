<cfcomponent displayname="leadsourceservice">
	<cffunction name="init" access="public" output="false" returntype="clientservice" hint="I create an initialized client service object.">
		<cfreturn this >
	</cffunction>		
	<cffunction name="getleadsources" access="public" returntype="query" output="false" hint="I get the company referral sources.">			
		<cfargument name="officeID" type="numeric" required="no" default="#session.officeID#">
		<cfset var leadsources = "" />
			<cfquery datasource="#application.dsn#" NAME="leadsources">
				select *
				  from referralsources, offices
				 where referralsources.officeid = offices.officeid
				   and referralsourceid <> <cfqueryparam value="1" cfsqltype="cf_sql_integer" />
				   and referralsourceid <> <cfqueryparam value="43" cfsqltype="cf_sql_integer" />
				   and referralsourceid <> <cfqueryparam value="95" cfsqltype="cf_sql_integer" />
				   and referralsourceid <> <cfqueryparam value="96" cfsqltype="cf_sql_integer" />					
				    
					<cfif structkeyexists( url, "filter" ) and url.filter eq true>
						and referralsources.officeID = <cfqueryparam value="17" cfsqltype="cf_sql_integer" />
					<cfelse>
						and referralsources.officeID = <cfqueryparam value="#arguments.officeID#" cfsqltype="cf_sql_integer" />
					</cfif>		   
			  order by referralsource asc
			</cfquery>	
		<cfreturn leadsources>
	</cffunction>
</cfcomponent>