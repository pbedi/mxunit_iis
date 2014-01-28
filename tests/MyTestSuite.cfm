<cfscript>
 testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite();
 //Add all runnable methods in MyComponentTest
 testSuite.addAll("MyTutorialTest");
 testSuite.addAll("RomanNumeralEncoderTest"); 
 //add explicit test cased (don't start with 'test').
 //Note you can add more than one at a time as a list
 testSuite.add("MyUtilityTest","testSequence,testConvertNumberToWords,testParseString");
 results = testSuite.run();
 //Now print the results. Simple\!
 writeOutput(results.getResultsOutput('html')); //See next section for other output formats
</cfscript>