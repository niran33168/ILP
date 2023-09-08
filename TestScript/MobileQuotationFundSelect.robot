*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt
Library     AppiumLibrary

*** Test Cases ***
Mobile MobileQuotation Fund Select Case Success
    [tags]        Simulator
    [Setup]       Run Keywords         Set Test Variable                             ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                  Set Test Variable                             ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close Application
    [Template]    MobileQuotationFundSelect
     #rowNo        testcaseNo    Desc
    2             TS_001_001           ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน
    # 3             TS_001_002           ผู้เอาประกันอายุน้อยกว่า 16 ปี ชำระรายเดือน