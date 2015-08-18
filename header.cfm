

		<!DOCTYPE html>
			<html lang="en">
				<head>
					<meta charset="utf-8">
					<title>eFiscal Networks, LLC.  | Progressive Debt Relief | v3</title>			
					<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
					<meta name="apple-mobile-web-app-capable" content="yes">		
					<link href="./css/bootstrap.min.css" rel="stylesheet">
					<link href="./css/bootstrap-responsive.min.css" rel="stylesheet">
					<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
					<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">		
					<link href="./css/ui-lightness/jquery-ui-1.10.0.custom.min.css" rel="stylesheet">		
					<link href="./css/base-admin-3.css" rel="stylesheet">
					<link href="./css/base-admin-3-responsive.css" rel="stylesheet">		
					<link href="./css/pages/dashboard.css" rel="stylesheet">
					<link href="./css/custom.css" rel="stylesheet">
				
					<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
					<!--[if lt IE 9]>
					  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
					<![endif]-->	
					
					<!--- // make sure that none of our dynamic pages are cached by the users browser --->
					<cfheader name="cache-control" value="no-cache,no-store,must-revalidate" >
					<cfheader name="pragma" value="no-cache" >
					<cfheader name="expires" value="#getHttpTimeString( Now() )#" >
					
					<!--- // also enure that non-dynamic pages are not cached by the users browser --->
					<META HTTP-EQUIV="expires" CONTENT="-1">
					<META HTTP-EQUIV="pragma" CONTENT="no-cache">
					<META HTTP-EQUIV="cache-control" CONTENT="no-cache,no-store,must-revalidate">
				
				</head>		
				
					
				<body>	
					<!--- // used to debug/track cfif and cftoken session variables 
					<cfinclude template="secchk.cfm">
					--->
					
					
					
					<!--- include the top-bar header all users --->
					<cfinclude template="top-bar-nav.cfm">

					<cfif isuserloggedin()>
						
						<!--- include the sub-header based on the users system role --->
						<cfif not structkeyexists( session, "selectedclientid" )>
							<cfif isuserinrole( "efiscal" ) or isuserinrole( "execmanager" )>
								<cfinclude template="sub-nav-header.cfm">				
							<cfelseif isuserinrole( "counselor" ) or isuserinrole( "enrollment" )>					
								<cfinclude template="sub-nav-header-cn.cfm">				
							<cfelseif isuserinrole( "intake" ) or isuserinrole( "sls" )>				
								<cfinclude template="sub-nav-header-sls.cfm">					
							<cfelseif isuserinrole( "bclient" )>
								<cfinclude template="sub-nav-client-header.cfm">									
							</cfif>
						<cfelse>
							<cfinclude template="templates/views/client-data-header.cfm">
						</cfif>
					</cfif>