<cfcomponent displayname="officeservice">
	<cffunction name="init" access="public" output="false" returntype="officeservice" hint="I create an initialized office service object.">
		<cfreturn this >
	</cffunction>		
	<cffunction name="getoffices" access="public" returntype="query" output="false" hint="I get the list of offices.">	
		<cfset var officelist = "" />
			<cfquery datasource="#application.dsn#" NAME="officelist">
				select *
				  from offices
				  where active = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
				order by office asc
			</cfquery>
		<cfreturn officelist>
	</cffunction>
</cfcomponent>