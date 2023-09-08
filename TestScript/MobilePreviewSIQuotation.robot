*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Preview Sale Illustration Quotation Case Success
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close Application
    [Template]    PreviewSIQuotation
     #rowNo        testcaseNo
    3             TS_001_002