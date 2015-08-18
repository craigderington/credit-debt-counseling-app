<cfcomponent>
	<cffunction name="getclientbalance" returntype="numeric" access="remote">
		<cfargument name="clientID" type="numeric" required="yes" default="#session.selectedclientid#">	
			<cfset var clienttotalbalance = 0.00 />
			<cfquery datasource="#application.dsn#" name="totals">
				select (select coalesce(sum (paymentamount), 0) from disbursements, creditors where disbursements.creditorid = creditors.creditorid and clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and paymentmadedate is not null and disbursements.creditorid <> '-2' and disbursements.creditorid <> '-5' and disbursements.creditorid <> '2352') as totaldisbursements,
				   (select coalesce(sum (paymentamount), 0) from payments where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and payments.clientid = personaldata.clientid and paymentpaid is not null and updatedamount is null) as totalreceived,
				   (select coalesce(sum (updatedamount), 0) from payments where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and payments.clientid = personaldata.clientid and paymentpaid is not null and updatedamount is not null and nsfdate is null) as totalmodifiedpayments,
				   (select coalesce(sum (paymentamount), 0) from payments where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and payments.clientid = personaldata.clientid and nsfdate is not null and updatedamount is null) as totalnsf,
				   (select coalesce(sum (updatedamount), 0) from payments where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and payments.clientid = personaldata.clientid and nsfdate is not null and updatedamount is not null) as totalmodifiednsf,
				   (select coalesce(sum (feepaid), 0) from fees where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" /> and fees.clientid = personaldata.clientid and feepaiddate is not null) as totalfeesamountpaid
				from personaldata
				where clientid = <cfqueryparam value="#clientid#" cfsqltype="cf_sql_integer" />
			</cfquery>	 
			<cfset totalavailable = ( totals.totalreceived + totals.totalmodifiedpayments - totals.totaldisbursements - totals.totalfeesamountpaid ) />
			<cfset clienttotalbalance = totalavailable />		
			<cfreturn clienttotalbalance>
	</cffunction>
	
	<cffunction name="getclientescrowregister" returntype="query" access="remote">
		<cfargument name="clientID" type="numeric" required="yes" default="#session.selectedclientid#">
		<cfset var escrowregister = "" />
			<cfquery datasource="#application.dsn#" name="escrowregister">  
				SELECT p.paymentReceived as dateRegister, p.paymentAmount as amount, p.payProgram as description, p.nsfDate as returnDate, p.nsfReason as reason, p.paymentPaid as cleared
				  FROM payments p
				 WHERE clientid = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" />
				   AND p.paymentReceived IS NOT NULL
				   AND paymentPaid IS NOT NULL
				UNION ALL
				  SELECT d.paymentMadeDate as dateRegister, d.paymentAmount as amount, c.creditorName as description, d.paymentDueDate as returnDate, d.paymentType as reason, d.paymentMadeDate as cleared
				    FROM disbursements d, creditors c
				   WHERE d.creditorID = c.creditorID
				     AND d.clientID = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" />
				     AND d.paymentMadeDate IS NOT NULL
				     AND d.creditorID <> <cfqueryparam value="-2" cfsqltype="cf_sql_integer" />
				     AND d.creditorID <> <cfqueryparam value="-5" cfsqltype="cf_sql_integer" />
				UNION ALL
				  SELECT f.feePaidDate as dateRegister, f.feepaid as amount, f.feePurpose as description, f.feeDueDate as returnDate, f.feePurpose as reason, f.feePaidDate as cleared
				    FROM fees f
				   WHERE f.clientID = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" />
				     AND feePaidDate IS NOT NULL					
				  
				  
				ORDER BY dateRegister ASC
			</cfquery>
			<cfreturn escrowregister>	
	</cffunction>
	<cffunction name="getclientpayments" access="public" returntype="query" hint="I get the client payments.">
		<cfargument name="clientID" type="numeric" required="yes" default="#session.selectedclientid#">
			<cfquery datasource="#application.dsn#" NAME="paymentList2">
				SELECT *, paymentDueDate AS payDate1, updatedDueDate AS payDate1
				  FROM payments
				 WHERE clientID = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" /> 								   							   
			   ORDER BY payDate1, paymentID ASC
		    </cfquery>
		<cfreturn paymentList2>
	</cffunction>
	<cffunction name="checkclientpayments" access="public" returntype="query" hint="I check the total of the client payments.">
		<cfargument name="clientID" type="numeric" required="yes" default="#session.selectedclientid#">			
		<cfset var checkpaid = "" />
		<cfquery datasource="#application.dsn#" name="checkpaid">
			select count(*) as totalpaid
				from payments
				where clientid = <cfqueryparam value="#arguments.clientID#" cfsqltype="cf_sql_integer" />
			and paymentpaid is not null
		</cfquery>		    
		<cfreturn checkpaid>
	</cffunction>
</cfcomponent>