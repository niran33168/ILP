*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Mobile E2E Case Success
    [tags]        Simulator
    [Setup]       Run Keywords         Set Test Variable                             ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                  Set Test Variable                             ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close Application
    [Template]    FlowE2E
     #rowNo        testcaseNo    Desc
    2             TS_001_001           ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน