



				<!--- // get data access components --->
				<cfinvoke component="apis.com.clients.clienttotals" method="getclientescrowregister" returnvariable="escrowregister">
					<cfinvokeargument name="clientID" value="#session.selectedclientid#">
				</cfinvoke>			
				

				<!--- page vars --->
				<cfparam name="runningTotal" default="0.00">
				<cfparam name="trustBalance" default="0.00">

				
				<cfoutput>
					
					

					<cfif escrowregister.recordcount gt 0> 
												
							<table class="table table-hover table-striped">
								<thead>	
									<tr>					
										<th>Date</th>
										<th>Transaction Description</th>
										<th>Payment Amount</th>
										<th>Deposit Amount</th>
										<th>Balance</th>
									</tr>
								</thead>
								<tbody>
									<cfloop query="escrowregister">
										
											<!--- calc running escrow totals --->
											<cfif trim( description ) is "ds" and returndate eq "">
											  <cfset runningtotal = runningtotal + amount />
											<cfelseif trim( description ) is "ds" and returndate neq "">
											  <cfset runningtotal = runningtotal + amount />											
											<cfelse>
											  <cfset runningtotal = runningtotal - amount />
											</cfif>		
										
											<tr>
												<td><cfif trim( description ) eq "ds" and returndate eq "">#dateformat( dateregister, "mm/dd/yyyy" )#<cfelse>#dateformat(cleared, "mm/dd/yyyy")#</cfif></td>
												<td><cfif trim( description ) eq "ds" and returndate eq ""><font color="blue">Deposit payment received from client. <cfif cleared is not "">Cleared on #dateformat(cleared, "mm/dd/yyyy")#<cfelse>Payment pending.</cfif></font><cfelseif trim(description) is "ds" and returndate is not ""><font color="red"><strong>Client payment returned nsf on #dateformat(returndate, "mm/dd/yyyy")# for #reason#</strong></font><cfelse><cfif trim(description) contains "monthly fee" or trim(description) contains "escrow fee"><font color="green">Payment to #description#</font><cfelseif trim(description) is not "ds" and returndate is not "" and isdate(reason)><font color="darkred">Payment to #description# - payment returned and voided</font><cfelse><font color="purple">Payment to #description#</font></cfif></cfif></td>
												<td><cfif trim( description ) neq "ds">#dollarformat(amount)#</cfif></td>
												<td><cfif trim( description ) eq "ds" and returndate eq ""><font color="blue">#dollarformat( amount )#</font><cfelseif trim(description) is "ds" and returndate is not ""><font color="red"><strong>#dollarformat(amount)#</strong></font></cfif></td>
												<td><cfif escrowregister.currentrow eq 1>#dollarformat( amount )#<cfelse>#dollarformat( runningtotal )#</cfif></td>											
											</tr>											
												
											
									</cfloop>
								</tbody>
							</table>
						
						
						
						
						
						
						
						
					
					<cfelse>		
				
				
							<div class="alert alert-warning alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
									<i class="fa fa-warning"></i> <strong>NO RECORDS FOUND!</strong>
							</div>
		
		
		
					</cfif>
					
					
					
					<!---
					
					
					
					
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<i class="fa fa-warning"></i> <strong>UNDER DEVELOPMENT.  PLEASE CHECK BACK SHORTLY...!</strong>
					</div>
					
					--->

				</cfoutput>				