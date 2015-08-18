
							
							
							
							
							
						<cfinvoke component="apis.com.dashboard.dashboardservice" method="getdashboardclients" returnvariable="dashboardclientlist">
						



						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th class="td-actions">Select</th>
									<th>Client Name</th>
									<th>Last Payment</th>
									<th>State</th>
								</tr>
							</thead>
						
							<tbody>
								<cfoutput query="dashboardclientlist">
									<tr>
										<td class="td-actions">
											<a href="#application.root#getclient&fuseaction=getClientDetails&clientID=#clientID#" class="btn btn-xs btn-primary">
												<i class="btn-icon-only fa fa-check-square-o"></i>										
											</a>
										</td>
										<td>#clientfirstname# #clientlastname#</td>
										<td><cfif lastpaydate neq "">#dateformat( lastpaydate, "mm/dd/yyyy ")#  <i style="margin-left:5px;" class="fa fa-check-square-o"></i><cfelse><span class="label label-danger">No Payments</cfif></td>
										<td><span class="label label-success"><small>ACTIVE</small></span></td>
																			
									</tr>
								</cfoutput>
							</tbody>
						</table>