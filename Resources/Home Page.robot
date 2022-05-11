*** Settings ***
Resource          ../Config/Config.robot

*** Variables ***
${Search_Btn}     //*[@id="search"]
${Search_Input}    //*[@id="query"]
${New_Books_Journals}    //*[@id="newest"]
${Springer_Link_Logo}    //*[@id="logo"]
${Search_Options}    //*[@id="search-options"]
${Search_Help}    //*[@id="search-help-link"]

*** Keywords ***
Open Springer Link
    Open browser    ${HOSTNAME}    ${BROWSER}
    Wait until element is visible    ${Springer_Link_Logo}    ${TIMEOUT}

Search Document
    [Arguments]    ${FileName}
    input text    ${Search_Input}    ${FileName}
    click elemnt    ${Search_Btn}
    wait until element is not visible    ${New_Books_Journals}    ${TIMEOUT}
    ${Search_count}    get text    ${Search_Result_Count}
    Run keyword if    ${Search_count}>0    Log    Multiple results found
    ...    ELSE    Fail    No document found of such name

Go To Advance Search
    click element    ${Search_Options}
    click element

Go To Search Help
    Click element    ${Search_Options}
    Click element    ${Search_Help}
    wait until page contains element    ${Search_Help_Page}    ${TIMEOUT}
