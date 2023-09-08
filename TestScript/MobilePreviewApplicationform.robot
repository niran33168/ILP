*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Preview Application Case Success
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_APPLICATION}
    [Teardown]    Close Application
    [Template]    PreviewApplication
     #rowNo        testcaseNo
    3             TS_001_002