*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Mobile Instalment Case Success
    [Setup]       Run Keywords         Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                  Set Test Variable    ${SHEET_NAME}    ${SHEET_PAYMENT}
    [Teardown]    Close Application
    [Template]    InstalmentMethod
     #rowNo        testcaseNo
    2             CraditCard