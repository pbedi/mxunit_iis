<cfcomponent
	extends="mxunit.framework.TestCase"
	output="false"
	hint="I test the Roman Numeral encoder.">


	<!--- this will run before every single test in this test case --->
	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">

	</cffunction>

	<!--- this will run after every single test in this test case --->
	<cffunction name="tearDown" returntype="void" access="public" hint="put things here that you want to run after each test">

	</cffunction>

        <!--- this will run once after initialization and before setUp() --->
	<cffunction name="beforeTests" returntype="void" access="public" hint="put things here that you want to run before all tests">

	</cffunction>

	<!--- this will run once after all tests have been run --->
	<cffunction name="afterTests" returntype="void" access="public" hint="put things here that you want to run after all tests">

	</cffunction>

	<cffunction
		name="testDecode"
		hint="I test the decode() method.">

		<!--- Create an instance of our roman numeral encoder. --->
		<cfset var encoder = createObject( "component", "com.philip.RomanNumeralEncoder" ).init() />

		<!--- Test encoding. --->
		<cfset assertEquals( "I", encoder.encode( 1 ), "Encoding 1 Failed" ) />
		<!---<cfset assertEquals( "II", encoder.encode( 2 ), "Encoding 2 Failed" ) />
		<cfset assertEquals( "III", encoder.encode( 3 ), "Encoding 3 Failed" ) />
		<cfset assertEquals( "IV", encoder.encode( 4 ), "Encoding 4 Failed" ) />
		<cfset assertEquals( "V", encoder.encode( 5 ), "Encoding 5 Failed" ) />
		<cfset assertEquals( "VI", encoder.encode( 6 ), "Encoding 6 Failed" ) />
		<cfset assertEquals( "VII", encoder.encode( 7 ), "Encoding 7 Failed" ) />
		<cfset assertEquals( "VIII", encoder.encode( 8 ), "Encoding 8 Failed" ) />
		<cfset assertEquals( "IX", encoder.encode( 9 ), "Encoding 9 Failed" ) />
		<cfset assertEquals( "X", encoder.encode( 10 ), "Encoding 10 Failed" ) />--->


    </cffunction>


	<cffunction
		name="testEncode"
		hint="I test the encode() method.">

		<!--- Create an instance of our roman numeral encoder. --->
		<cfset var encoder = createObject( "component", "com.philip.RomanNumeralEncoder" ).init() />

		<!--- Test encoding. --->
		<cfset assertEquals( "1", encoder.decode( "I" ), "Decoding I Failed" ) />
		<!---<cfset assertEquals( "2", encoder.decode( "II" ), "Decoding II Failed" ) />
		<cfset assertEquals( "3", encoder.decode( "III" ), "Decoding III Failed" ) />
		<cfset assertEquals( "4", encoder.decode( "IV" ), "Decoding IV Failed" ) />
		<cfset assertEquals( "5", encoder.decode( "V" ), "Decoding V Failed" ) />
		<cfset assertEquals( "6", encoder.decode( "VI" ), "Decoding VI Failed" ) />
		<cfset assertEquals( "7", encoder.decode( "VII" ), "Decoding VII Failed" ) />
		<cfset assertEquals( "8", encoder.decode( "VIII" ), "Decoding VIII Failed" ) />
		<cfset assertEquals( "9", encoder.decode( "IX" ), "Decoding IX Failed" ) />
		<cfset assertEquals( "10", encoder.decode( "X" ), "Decoding X Failed" ) />--->
    
    </cffunction>


</cfcomponent>