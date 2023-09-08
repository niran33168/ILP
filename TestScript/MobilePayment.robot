*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Mobile Payment Case Success
    [Setup]       Run Keywords         Set Test Variable    ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                  Set Test Variable    ${SHEET_NAME}    ${SHEET_PAYMENT}
    [Teardown]    Close Application
    [Template]    PaymentMethod
     #rowNo        testcaseNo
    2             CraditCard