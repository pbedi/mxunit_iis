<cfcomponent displayname="MyTutorialTest"  extends="mxunit.framework.TestCase">
  
    <!--- setup and teardown --->
	
	<cffunction name="setUp" returntype="void" access="public">
		
		<cfset this.myTutorial = createObject("component","com.philip.MyTutorial")>	
		
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>
        
    <cffunction name="testAdd" access="public" returntype="void">
      <cfscript>
        expected = 2;
        actual = this.myTutorial.add(1,1);
        assertEquals(expected,actual);
       </cfscript>
   </cffunction>
    
    <cffunction name="testSubtract" access="public" returntype="void">
        <cfscript>
            expected = 5;
            actual = this.myTutorial.subtract(10,5);
            assertEquals(expected,actual);
        </cfscript>
     </cffunction>
        
    <cffunction name="testDivide" access="public" returntype="void">
        <cfscript>
          expected = 2;
          actual = this.myTutorial.divide(10,5);
          assertEquals(expected,actual);
         </cfscript>
     </cffunction>
    
    
    <cffunction name="testMultiply" access="public" returntype="void">
        <cfscript>
          expected = 25;
          actual = this.myTutorial.multiply(5,5);
          assertEquals(expected,actual);
         </cfscript>
     </cffunction>
</cfcomponent>

