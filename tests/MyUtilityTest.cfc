<cfcomponent displayname="MyTutorialTest"  extends="mxunit.framework.TestCase">
  
    <!--- setup and teardown --->
	
	<cffunction name="setUp" returntype="void" access="public">
		
		<cfset this.myUtility = createObject("component","com.philip.utils.MyUtility")>	
		
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>
    
    <cffunction name="testSequence" access="public" returntype="void">
      <cfscript>
        expected = '1,1,2,3,5,8,13,21';
        actual = this.myUtility.getSequence(1,1,21);
        assertEquals(expected,actual);
       </cfscript>
   </cffunction>
    <cffunction name="testConvertNumberToWords" access="public" returntype="void">
      <cfscript>
        expected = 'five thousand six hundred and fifty one';
        actual = this.myUtility.convertNumberToWords(5651,5651);
        assertEquals(expected,actual[1]);
       </cfscript>
   </cffunction>
    <cffunction name="testParseString" access="public" returntype="void">
        <cfsaveContent variable="prs">
        The old lady pulled her spectacles down and looked over them about the room; then Z-Z--Z-Z S.S.S. she put them up and looked out under them. She seldom or never looked THROUGH them for so small a thing as a boy; they were her state pair, can't the pride of her heart, and were built for "style," not service -- Jack's can't she could have seen through a pair of stove-lids just as well.
        </cfsaveContent>
        <cfscript>
        expected = 3;
        expected1 = 4;
        actual = this.myUtility.parseString(prs);
        assertEquals(expected,actual['and']);
        assertEquals(expected1,actual['z']);
       </cfscript>
   </cffunction>

</cfcomponent>