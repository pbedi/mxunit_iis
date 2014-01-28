<cfcomponent
	output="false"
	hint="encode/ encode.">

	<cffunction
			name="init"
			hint="">
        
			<cfreturn this>
	</cffunction>

	<cffunction
			name="decode"
			hint=""
            returntype="Numeric">
            <cfargument name="romanValue" required="true">
            <cfset returnValue = 0>
            <cfif arguments.romanValue EQ 'I'>
                <cfset returnValue = 1>
            </cfif>
			<cfreturn returnValue>
	</cffunction>

	<cffunction
			name="encode"
			hint="">
            <cfargument name="numberValue" required="true">
            <cfset returnValue = ''>
            <cfif arguments.numberValue EQ 1>
                <cfset returnValue = 'I'>
            </cfif>
			<cfreturn returnValue>
	</cffunction>
</cfcomponent>