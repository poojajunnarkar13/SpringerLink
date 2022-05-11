*** Settings ***
Resource          ../Config/Config.robot

*** Test Cases ***
Search document
    Open Springer Link
    Search Document    hgsdchxjkl
    Verify in search results    hgsdchxjkl    ${FALSE}
    Search Document    Frontiers in Energy
    Verify in search results    Frontiers in Energy    ${TRUE}
    Search Document    'Frontiers in Energy'
    Verify in search results    Frontiers in Energy    ${TRUE}
    Search Document    "Frontiers in Energy"
    Verify in search results    Frontiers in Energy    ${TRUE}
    Search Document    Frontiers in Energy*
    Verify in search results    Frontiers in Energy    ${TRUE}
    Search Document    Frontiers in Energy#
    Verify in search results    Frontiers in Energy    ${TRUE}

Advanced Search document
    Open Springer Link
    Advance Search    hgsdchxjkl
    Verify in search results    hgsdchxjkl    ${FALSE}
    Advance Search    ${EMPTY}    Law and Critique
    Verify in search results    Law and Critique    ${TRUE}
    Advance Search    ${EMPTY}    ${EMPTY}    Law and Critique
    Verify in search results    Law and Critique    ${TRUE}
    Advance Search    ${EMPTY}    ${EMPTY}    ${EMPTY}    Law and Critique
    Verify in search results    Law and Critique    ${TRUE}
    Advance Search    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Law and Critique
    Verify in search results    Law and Critique    ${FALSE}
    Advance Search    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Law and Critique
    Verify in search results    Law and Critique    ${TRUE}
    Advance Search    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Costas Douzinas
    Verify in search results    Law and critique: Twentieth Anniversary    ${TRUE}
