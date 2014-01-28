<cfcomponent
	output="false"
	hint="I define the main application settings.">


	<!--- Define the application settings. --->
	<cfset this.name = hash( getCurrentTemplatePath() ) />
	<cfset this.applicationTimeout = createTimeSpan( 0, 20, 0, 0 ) />

	<cfset this.sessionManagement = true />

	<!---
		Get the tests directory - we'll be setting up mappings for
		directories relative to our testing directory.
	--->
	<cfset this.directory = getDirectoryFromPath( getCurrentTemplatePath() ) />


	<!---
		Get the application-root directory (where our non-MXUnit,
		application code exists).
	--->
	<cfset this.appDirectory = (this.directory & "/") />



	<!---
		***** APPLICATION COMPONENTS *****
		Map the com directory 
	--->
	<cfset this.mappings[ "/com" ] = (this.appDirectory & "model/com/") />


</cfcomponent>

