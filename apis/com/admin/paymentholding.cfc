<cfcomponent displayname="paymentholdingservice">
	<cffunction name="init" access="public" output="false" returntype="paymentholdingservice" hint="I create an initialized payment holding service object.">
		<cfreturn this >
	</cffunction>
		
	<cffunction name="getpaymenttypes" access="public" returntype="query" output="false" hint="I get the list of payment types.">			
		<cfset var paymentholding = "" />
			<cfquery datasource="#application.dsn#" name="paymentholding">					
				select paymenttypeid, paymenttype, daystohold
				  from paymentholding
				 order by paymenttype asc
			</cfquery>
		<cfreturn paymentholding>
	</cffunction>
</cfcomponent>