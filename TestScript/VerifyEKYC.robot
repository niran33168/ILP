*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Mobile Application Case Success
    [tags]        Real
    [Setup]       Run Keywords         Set Test Variable                             ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                  Set Test Variable                             ${SHEET_NAME}    ${SHEET_APPLICATION}
    [Teardown]    Close Application
    [Template]    VerifyEKYC
     #rowNo        testcaseNo    Desc
    2             TS_001_001           ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน