*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Preview Sale Illustration Case Success
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_APPLICATION}
    [Teardown]    Close Application
    [Template]    PreviewSaleIllustration
     #rowNo        testcaseNo
    3             TS_001_002