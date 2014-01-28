<cfcomponent displayname="MyUtility" hint="general utilities">
    <cffunction name="getSequence" access="public" returntype="Any" hint="return a sequence">
        <cfargument name="n" default="1" hint="step 1">
        <cfargument name="m" default="1" hint="step 2">
        <cfargument name="end" default="21">
        <cfset var l = {}>
        <cfset l.lastItem = arguments.n>
        <cfset l.secondLastItem = arguments.m>
        <cfset l.seq = l.secondLastItem>
        <cfset l.seq = listAppend(l.seq, l.lastItem)>
        
        <cfscript>
            do {
                    l.item = l.secondLastItem + l.lastItem;
                    l.seq = listAppend(l.seq, l.item);
                    l.secondLastItem = l.lastItem;
                    l.lastItem = l.item;
                    
                    
                } while (l.item LT arguments.end);
        </cfscript>
        <cfreturn l.seq>
    </cffunction>
    <cffunction name="convertNumberToWords" access="public" returntype="array" hint="return in words">
        <cfargument name="startNumber" required="true" hint="start number">
        <cfargument name="endNumber" required="true" hint="end seq number">
        <cfscript>
            var param1 = arguments.startNumber;
            var param2 = arguments.endNumber;
            var i = param1;
            var l = 0;
            var m = 0;
            var n = 0;
            var g = 0;
            var twodigit = 0;
            var currentNum = 0;
            var str = '';
            var arr = ArrayNew(1);
            param1 = replaceNocase(param1,' ','','All');
            param2 = replaceNocase(param2,' ','','All');
            param1 = replaceNocase(param1,',','','All');
            param2 = replaceNocase(param2,',','','All');
            param1 = Round(param1);
            param2 = Round(param2);
            if (param1 > param2)
            {
                param = param1;
                param1 = param2;
                param2 = param1;
            }
            str = '';	
            for (i = param1; i <= param2; i++)
            {
                l = len(i);
                //writeoutput('Main-' & i & '<br>');
                if (l > 2)
                {
                    m=l;
                    for (n=1; n <= l-2; n++)
                    {
                        currentNum = Mid(i,n,1);
                        //writeoutput('Inside loop-' & currentNum & '<br>');
                        if (currentNum > 0)
                        {
                            if (n ==1)
                                str = getWord(currentNum,m);
                            else
                                str = Str & ' ' & getWord(currentNum,m);
                            //writeoutput('Inside if-' & str & '<br>');
                        }
                        m--;
                    }
                    g= len(i)-1;
                    twodigit = Mid(i,g,l);
                    //writeoutput('twodigit-' & twodigit & '<br>');
                    if (val(twodigit) > 0)
                    {
                        str = Str & ' and ' & getTwoDigitWord(twodigit);
                        //writeoutput('Inside Twodigit-' & str & '<br>');
                    }
                }
                else
                {
                    str =  getTwoDigitWord(i);
                    
                }
                //writeOutPut(str & '<br/>');
                arrayAppend(arr,str);
                str = '';
            }
            //cnt = 0;
            
            
            return arr;
        </cfscript>
    </cffunction>
    <cffunction name="parseString" access="public" returntype="struct" hint="return word count">
        <cfargument name="str" required="true" hint="long story">
        <cfscript>
            str = replaceNocase(str,'"','','All');
            str = replaceNocase(str,",","",'All');
            str = replaceNocase(str,";","",'All');
            str = replaceNocase(str,"."," ",'All');
            str = replaceNocase(str,"-"," ",'All');
            strArr = ArrayNew(1);
            strArr = ListToArray(str," ");
            finalStruct = StructNew();
            len = ArrayLen(strArr);
            
            
            for (i=1; i <= len; i++)
            {
                currentW = strArr[i];
                currentW = Trim(currentW);
                if(Len(currentW))
                {
                if (find("'",currentW)) // For 
                {
                    fistLetter = Mid(currentW,1,1);
                    firstletterU = uCase(fistLetter);
                    if (find(firstletterU,fistLetter,1))
                    {
                        currentW = Mid(currentW,1,find("'",currentW)-1);
                    }
                }
                if (StructKeyExists(finalstruct,currentW))
                {
                    finalstruct[currentW]++;
                }
                else
                {
                    finalstruct[currentW] = 1;
                }
                }
            }
            /**
            cnt = 0;
            writeOutPut('<table>');
            currentStr = '<tr>';
            for (cell in finalstruct)
            {
                cnt++;
                currentStr = currentStr & '<td style="padding-right:5px;">' & cell & '</td><td style="padding-right:5px;">' & finalstruct[cell] & '</td> ';
                if (cnt == 4)
                {
                  cnt =0;
                  writeOutput(currentStr & '</tr>');
                  currentStr = '<tr>';
                }
            }
            writeOutPut('</table>');
            **/
            return finalstruct;
             
        </cfscript>
    </cffunction>
    <cffunction name="getWord" access="private" returntype="string">
        <cfargument name="item" required="true" hint="number">
        <cfargument name="wordPos" required="true" hint="number">
        <cfscript>
            var d = arguments.item;
            var pos = arguments.wordPos;
            var first = '';
            var other = '';
            var q = 0;
            d=val(d);
            if(d == 0)
                return '';
            first = wordSep['#d#'];
            if (pos == 5)
            {
                first = wordSep['#d#0'];
                return first;
                pos=pos-1;
            }
            else if (pos == 6)
            {
                first = wordSep['#d#'] & ' hundred and ';
                pos=pos-2;
                return first;
            }
            other = '1';
            for (q=1; q < pos; q++)
            {
                other = other & '0';
            }
            if (NOT structKeyExists(wordSep,'#other#'))
                return '';
            else
                return first & ' ' & wordSep['#other#'];
        </cfscript>
    </cffunction>
            
    
    <cfscript>
        // Componnent level variable
        wordSep = StructNew();
        wordSep['1'] = 'one';
        wordSep['2'] = 'two';
        wordSep['3'] = 'three';
        wordSep['4'] = 'four';
        wordSep['5'] = 'five';
        wordSep['6'] = 'six';
        wordSep['7'] = 'seven';
        wordSep['8'] = 'eight';
        wordSep['9'] = 'nine';
        wordSep['10'] = 'ten';
        wordSep['11'] = 'eleven';
        wordSep['12'] = 'twelve';
        wordSep['13'] = 'thirteen';
        wordSep['14'] = 'fourteen';
        wordSep['15'] = 'fifteen';
        wordSep['16'] = 'sixteen';
        wordSep['17'] = 'seventeen';
        wordSep['18'] = 'eighteen';
        wordSep['19'] = 'ninteen';
        wordSep['20'] = 'twenty';
        wordSep['30'] = 'thirty';
        wordSep['40'] = 'forty';
        wordSep['50'] = 'fifty';
        wordSep['60'] = 'sixty';
        wordSep['70'] = 'seventy';
        wordSep['80'] = 'eighty';
        wordSep['90'] = 'ninty';
        wordSep['100'] = 'hundred';
        wordSep['1000'] = 'thousand';
        //wordSep['10000'] = 'thousand';
        //wordSep['100000'] = 'hundred thousand';
        wordSep['1000000'] = 'million';  
        
        function getTwoDigitWord(k)
         {
            k = val(k);
            if ( k == 0) return '';
            if (structKeyExists(wordSep,'#k#'))
            {
                str =  wordSep['#k#'];
            }
            else
            {
            str = wordSep['#Mid(k,1,1)#0'];
            str = str & ' ' & wordSep['#Mid(k,2,1)#'];
                
            }
            return str;
         }
    </cfscript>
</cfcomponent>