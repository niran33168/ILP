*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Mobile Application Case Success
    [tags]        Real
    [Setup]       Run Keywords                  Set Test Variable                             ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
    ...           AND                           Set Test Variable                             ${SHEET_NAME}    ${SHEET_APPLICATION}
    ...           AND                           Set Library Search Order                      AppiumLibrary    Selenium2Library
    [Teardown]    Close Application
    [Template]    ApplicationMobile
     #rowNo        testcaseNo    Desc
    2             TS_001_001                    ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน

# Mobile Application Case Success
#     [tags]        Simulator
#     [Setup]       Run Keywords                  Set Test Variable                             ${EXCEL_NAME}    ${EXCEL_FASTTRACK}
#     ...           AND                           Set Test Variable                             ${SHEET_NAME}    ${SHEET_APPLICATION}
#     ...           AND                           Set Library Search Order                      AppiumLibrary    Selenium2Library
#     [Teardown]    Close Application
#     [Template]    ApplicationMobileSimulator
#      #rowNo        testcaseNo    Desc
#     2             TS_001_001                    ผู้เอาประกันอายุเท่ากับ 16 ปี ชำระรายเดือน
#     3             TS_001_002                    ผู้เอาประกันอายุเท่ากับ 15 ปี ชำระรายเดือน