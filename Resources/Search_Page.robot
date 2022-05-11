*** Settings ***
Resource          ../Config/Config.robot

*** Variables ***
${Search_Result_Count}    //*[@id="number-of-search-results-and-search-terms"]/strong[1]
${All_Words_Input}    //*[@id="all-words"]
${Exact_Phrase_Input}    //*[@id="exact-phrase"]
${One_Of_The_Words_Input}    //*[@id="least-words"]
${Without_Words_Input}    //*[@id="without-words"]
${Title_Input}    //*[@id="title-is"]
${Author_Input}    //*[@id="author-is"]
${Start_Year_Input}    //*[@id="facet-start-year"]
${End_Year_Input}    //*[@id="facet-end-year"]
${Published_Date_Dropdown}    //*[@id="date-facet-mode"]
${Search_Btn}     //*[@id="submit-advanced-search"]

*** Test Cases ***

*** Keywords ***
Advance Search
    [Arguments]    ${All_Words}=${EMPTY}    ${Exact_Phrase}=${EMPTY}    ${One_Of_The_Word}=${EMPTY}    ${Without_Words}=${EMPTY}    ${Title}=${EMPTY}    ${Author_Editor}=${EMPTY}    ${In_Between}='Between'    ${Between_Start_Year}=${EMPTY}    ${Between_End_Year}=${EMPTY}
    Run keyword if    ${All_Words}!=${EMPTY}    input text    ${All_Words_Input}    ${All_Words}
    Run keyword if    ${Exact_Phrase}!=${EMPTY}    input text    ${Exact_Phrase_Input}    ${Exact_Phrase}
    Run keyword if    ${One_Of_The_Word}!=${EMPTY}    input text    ${One_Of_The_Words_Input}    ${One_Of_The_Word}
    Run keyword if    ${Without_Words}!=${EMPTY}    input text    ${Without_Words_Input}    ${Without_Words}
    Run keyword if    ${Title}!=${EMPTY}    input text    ${Title_Input}    ${Title}
    Run keyword if    ${Author_Editor}!=${EMPTY}    input text    ${Author_Input}    ${Author_Editor}
    Run keyword if    '${In_Between}'=='in'    Run keywords    click element    ${Published_Date_Dropdown}
    ...    AND    click element    //*[@id="date-facet-mode"]/option[2]
    Run keyword if    ${Between_Start_Year}!=${EMPTY}    input text    ${Start_Year_Input}    ${Between_Start_Year}
    Run keyword if    ${Between_End_Year}!=${EMPTY}    input text    ${End_Year_Input}    ${Between_End_Year}
    click element    ${Search_Btn}
    ${Search_count}    get text    ${Search_Result_Count}
    Run keyword if    ${Search_count}>0    Log    Multiple results found
    ...    ELSE    Fail    No document found of such name

Verify in search results
    [Arguments]    ${Document_Name}    ${IsPresent}
    ${Status}    Run keyword and return status    Page should contain element    //a[text()='${Document_Name}']
    Run keyword if    ${Status} and ${IsPresent}    Log    Document is present as expected
    ...    ELSE IF    ${Status} and !${IsPresent}    Fail    Document is present but was not expected
    ...    ELSE IF    !${Status} and ${IsPresent}    Fail    Document is not present but was expected
    ...    ELSE IF    !${Status} and ${IsPresent}    Log    Document is not present as expected
