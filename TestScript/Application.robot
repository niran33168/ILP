*** Settings ***
Resource          ../TestResource/Keywords/AllKeywords.txt
Library           Selenium2Library
Suite Teardown    Close All Browsers

*** Test Cases ***
Application Case Success
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_APPLICATION}
    [Teardown]    Close All Browsers
    [Template]    Application
     #rowNo        testcaseNo
    2             TS_002_001