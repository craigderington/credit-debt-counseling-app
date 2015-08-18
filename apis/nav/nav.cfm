


			<!--- // CLD 2-5-2015 // templating engine --->

			<!--- Scope the URL variable --->
			<cfparam name="event" default="index">

			<!--- generate page template based on event scope --->
			<cfswitch expression="#event#">				
				<cfcase value="index">					
					<!--- show dashboard for selected user role ??? --->
					<cfinclude template="../../templates/index.cfm">					
				</cfcase>
				<cfcase value="close">					
					<cfinclude template="../../templates/close.cfm">					
				</cfcase>
				<cfcase value="profile">					
					<cfinclude template="../../templates/profile.cfm">					
				</cfcase>
				<cfcase value="results">					
					<cfinclude template="../../templates/results.cfm">					
				</cfcase>
				<cfcase value="newlead">					
					<cfinclude template="../../templates/newlead.cfm">					
				</cfcase>
				<cfcase value="search">					
					<cfinclude template="../../templates/search.cfm">					
				</cfcase>
				<cfcase value="paymentcenter">					
					<cfinclude template="../../templates/paymentcenter.cfm">					
				</cfcase>
				<cfcase value="processreturns">					
					<cfinclude template="../../templates/processreturns.cfm">					
				</cfcase>
				<cfcase value="getclient">					
					<cfinclude template="../../templates/getclient.cfm">					
				</cfcase>
				<cfcase value="logout">					
					<cfinclude template="../../templates/logout.cfm">					
				</cfcase>
				<cfcase value="client">					
					<cfinclude template="../../templates/client.cfm">					
				</cfcase>
				<cfcase value="receipts">					
					<cfinclude template="../../templates/receipts.cfm">					
				</cfcase>
				<cfcase value="fees">					
					<cfinclude template="../../templates/fees.cfm">					
				</cfcase>
				<cfcase value="docs">					
					<cfinclude template="../../templates/docs.cfm">					
				</cfcase>
				<cfcase value="disbursements">					
					<cfinclude template="../../templates/disbursements.cfm">					
				</cfcase>
				<cfcase value="settlements">					
					<cfinclude template="../../templates/settlements.cfm">					
				</cfcase>
				<cfcase value="lead">					
					<cfinclude template="../../templates/lead.cfm">					
				</cfcase>
				<cfcase value="program">					
					<cfinclude template="../../templates/program.cfm">					
				</cfcase>				
				<cfcase value="debtworksheet">					
					<cfinclude template="../../templates/debtworksheet.cfm">					
				</cfcase>
				<cfcase value="assets">					
					<cfinclude template="../../templates/assets.cfm">					
				</cfcase>
				<cfcase value="budget">					
					<cfinclude template="../../templates/budget.cfm">					
				</cfcase>
				<cfcase value="personaldata">					
					<cfinclude template="../../templates/personaldata.cfm">					
				</cfcase>
				<cfcase value="worksheet">					
					<cfinclude template="../../templates/worksheet.cfm">					
				</cfcase>
				<cfcase value="admin">					
					<cfinclude template="../../templates/admin.cfm">					
				</cfcase>
				<cfcase value="users">					
					<cfinclude template="../../templates/personnel.cfm">					
				</cfcase>
				<cfcase value="offices">					
					<cfinclude template="../../templates/offices.cfm">					
				</cfcase>
				<cfcase value="calendar">					
					<cfinclude template="../../templates/calendar.cfm">					
				</cfcase>
				<cfcase value="leads">					
					<cfinclude template="../../templates/leads.cfm">					
				</cfcase>
				<cfcase value="clients">					
					<cfinclude template="../../templates/clients.cfm">					
				</cfcase>
				<cfcase value="wizard">					
					<cfinclude template="../../templates/wizard.cfm">					
				</cfcase>
				<cfcase value="checklist">					
					<cfinclude template="../../templates/checklist.cfm">					
				</cfcase>
				<cfcase value="reports">					
					<cfinclude template="../../templates/reports.cfm">					
				</cfcase>
				<cfcase value="checkcenter">					
					<cfinclude template="../../templates/checkcenter.cfm">					
				</cfcase>
				<cfcase value="feesdue">					
					<cfinclude template="../../templates/feesdue.cfm">					
				</cfcase>
				<cfcase value="newapps">					
					<cfinclude template="../../templates/newapps.cfm">					
				</cfcase>
				<cfcase value="balances">					
					<cfinclude template="../../templates/balances.cfm">					
				</cfcase>
				<cfcase value="trustbalances">					
					<cfinclude template="../../templates/trustbalances.cfm">					
				</cfcase>
				<cfcase value="escrowregister">					
					<cfinclude template="../../templates/escrowregister.cfm">					
				</cfcase>
				<cfcase value="leadsources">					
					<cfinclude template="../../templates/leadsources.cfm">					
				</cfcase>
				<cfcase value="paymentholding">					
					<cfinclude template="../../templates/paymentholding.cfm">					
				</cfcase>
				<cfcase value="settings">					
					<cfinclude template="../../templates/settings.cfm">					
				</cfcase>
				<!--- default case --->
				<cfdefaultcase>
					<cfinclude template="../../templates/errortemplate.cfm">
				</cfdefaultcase>			
			</cfswitch>