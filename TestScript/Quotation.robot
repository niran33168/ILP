*** Settings ***
Resource          ../TestResource/Keywords/AllKeywords.txt
Library           Selenium2Library
Suite Teardown    Close All Browsers

*** Test Cases ***
Quotation Case Success
    [Setup]       Run Keywords          Set Test Variable                                  ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable                                  ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close All Browsers
    [Template]    Quotation
    #rowNo                                      testcaseNo            Desc
    2             TS_1001_001           ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน
    3             TS_1001_002           ผู้เอาประกันอายุน้อยกว่า 16 ปี ชำระรายเดือน
    4             TS_1001_003           ผู้เอาประกันอายุมากกว่า 16 ปี ชำระรายปี
    5             TS_1001_004           ผู้เอาประกันอายุมากกว่า 16 ปี ชำระรายเดือน

Quotation Case Edit Success
    [Setup]       Run Keywords          Set Test Variable                                  ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable                                  ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close All Browsers
    [Template]    QuotationEdit
    #rowNo                                      testcaseNo    Desc
    7             TS_1002_001           แก้ไขผู้เอาประกันอายุมากกว่า 16 ปี ชำระรายเดือน

Quotation Case Delete Success
    [Setup]       Run Keywords          Set Test Variable                                  ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                   Set Test Variable                                  ${SHEET_NAME}    ${SHEET_QUOTATION}
    [Teardown]    Close All Browsers
    [Template]    QuotationDelete
    #rowNo                                      testcaseNo    Desc
    7             TS_1002_001           แก้ไขผู้เอาประกันอายุมากกว่า 16 ปี ชำระรายเดือน