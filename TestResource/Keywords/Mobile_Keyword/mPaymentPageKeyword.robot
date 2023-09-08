*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SelectPaymentMethod
    [Arguments]                         ${data_test}
    IF                                  '${data_test['Payment']['PaymentMethod']}' == 'creditcard'                                                             CreditCard                                              ${data_test}
    ...                                 ELSE IF                                                                                                                '${data_test['Payment']['PaymentMethod']}' == 'bank'    Bank                                                                                                                                                                                                                                                                                  ${data_test}
    ...                                 ELSE                                                                                                                   Other

CreditCard
    [Arguments]                         ${data_test}
    WaitAndClick                        ${BTN_METHOD_CREDITCARD['${ENV}']}
    ScrollDown50Percent
    IF                                  '${ENV}' == 'android'                                                                                                  SelectRelationCard                                      ${data_test}
    ...                                 ELSE                                                                                                                   SelectRelationCardIOS
    SelectMonthCard                     ${data_test}
    IF                                  '${ENV}' == 'android'                                                                                                  SelectYearCard                                          ${data_test}
    ...                                 ELSE                                                                                                                   SelectYearCardIOS
    IF                                  '${ENV}' == 'android'                                                                                                  SelectBank                                              ${data_test}
    ...                                 ELSE                                                                                                                   SelectBankIOS
    WaitAndInput                        ${TXT_INSTALCREDIT_CREDITNO['${ENV}']}                                                                                 ${data_test['Credit']['CreditNo']}
    WaitAndInput                        ${TXT_INSTALCREDIT_FORENAME['${ENV}']}                                                                                 ${data_test['Credit']['CardHolderName']}
    WaitAndInput                        ${TXT_INSTALCREDIT_SURNAME['${ENV}']}                                                                                  ${data_test['Credit']['CardHolderSurName']}
    IF                                  '${data_test['Credit']['FormatPay']}' == 'standard'                                                                    PaymentStandard
    Capture Page Screenshot

SelectRelationCard
    [Arguments]                         ${data_test}
    WaitAndClick                        ${DDL_RELATION_CARD['${ENV}']}
    WaitAndClick                        xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['Relationship']}')]

SelectRelationCardIOS
    AppiumLibrary.Click Element         ${DDL_RELATION_CARD['${ENV}']}
    WaitElement2sec
    AppiumLibrary.Tap With Positions    100                                                                                                                    ${393, 214}
    AppiumLibrary.Hide Keyboard         Done
    Capture Page Screenshot

SelectMonthCard
    [Arguments]                         ${data_test}
    WaitAndClick                        ${DDL_EXPIRY_MONTH['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  SelectMonthAndroid                                      ${data_test}
    ...                                 ELSE                                                                                                                   SelectMonthIOS

SelectMonthAndroid
    [Arguments]                         ${data_test}
    FOR                                 ${i}                                                                                                                   IN RANGE                                                2
    ${status}                           Run Keyword And Return Status                                                                                          AppiumLibrary.Wait Until Element Is Visible             xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateMonth']}')]
    IF                                  '${status}' == 'True'                                                                                                  WaitAndClick                                            xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateMonth']}')]
    ...                                 ELSE                                                                                                                   Execute Adb Shell                                       input swipe 1000 1200 1000 900
    END

SelectMonthIOS
    FOR                                 ${i}                                                                                                                   IN RANGE                                                2
    AppiumLibrary.Click Element         ${DDL_EXPIRY_MONTH['${ENV}']}
    WaitElement2sec
    AppiumLibrary.Tap                   ${None}                                                                                                                ${380}                                                  ${220}
    AppiumLibrary.Hide Keyboard         Done
    Capture Page Screenshot
    END
    Capture Page Screenshot

SelectYearCard
    [Arguments]                         ${data_test}
    WaitAndClick                        ${DDL_EXPIRY_YEAR['${ENV}']}
    WaitAndClick                        xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateYear']}')]

SelectYearCardIOS
    AppiumLibrary.Click Element         ${DDL_EXPIRY_YEAR['${ENV}']}
    WaitElement2sec
    AppiumLibrary.Tap With Positions    100                                                                                                                    ${550, 265}
    AppiumLibrary.Hide Keyboard         Done
    Capture Page Screenshot

SelectBank
    [Arguments]                         ${data_test}
    WaitAndClick                        ${DDL_BANK_NAME['${ENV}']}
    WaitAndClick                        xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['BankName']}')]

SelectBankIOS
    AppiumLibrary.Click Element         ${DDL_BANK_NAME['${ENV}']}
    WaitElement2sec
    AppiumLibrary.Tap With Positions    100                                                                                                                    ${430, 330}
    AppiumLibrary.Hide Keyboard         Done
    Capture Page Screenshot

PaymentStandard
    IF                                  '${ENV}' == 'android'                                                                                                  WaitAndClick                                            xpath=//android.view.View[@text='หักตามรอบของบริษัท']
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeStaticText[@name="หักตามรอบของบริษัท"]
    ScrollDown50Percent
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1000 1200
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[122]

Bank
    [Arguments]                         ${data_test}
    WaitAndClick                        ${BTN_METHOD_BANK}
    sleep                               3s
    ScrollDown50Percent
    MobileBankingRelationBank           ${data_test}
    MobileBankingInfo                   ${data_test}
    MobileBankingSelectBank             ${data_test}
    ScrollDown50Percent
    Execute Adb Shell                   input tap 1000 1200

MobileBankingRelationBank
    [Arguments]                         ${data_test}
    WaitAndClick                        xpath=//android.view.View[@index='17']/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                        xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['MobileBank']['BankRelationship']}')]

MobileBankingInfo
    [Arguments]                         ${data_test}
    WaitAndInput                        xpath=//android.widget.EditText[@resource-id='forename']                                                               ${data_test['MobileBank']['Name']}
    WaitAndInput                        xpath=//android.widget.EditText[@resource-id='surname']                                                                ${data_test['MobileBank']['Surname']}
    # WaitAndInput                 xpath=//android.widget.EditText[@resource-id='IdCard']                                                                                                                                               ${data_test['MobileBank']['BankIdNo']}
    WaitAndInput                        xpath=//android.widget.EditText[@resource-id='MobileNumber']                                                           ${data_test['MobileBank']['BankPhone']}

MobileBankingSelectBank
    [Arguments]                         ${data_test}
    WaitAndClick                        xpath=//android.view.View[@index='7']/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                        xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['MobileBank']['BankName']}')]

Other
    [Arguments]                         ${data_test}
    WaitAndClick                        ${BTN_METHOD_OTHER}

FillterApplication
    [Arguments]                         ${insured_id}
    SearchFillter                       ${insured_id}
    SelectFirstItem
    TabProgress
    PagePayment

TabProgress
    IF                                  '${ENV}' == 'android'                                                                                                  WaitAndClick                                            ${TXT_TAB_PROGRESS['${ENV}']}
    ...                                 ELSE                                                                                                                   Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${645, 158}
    ScrollDown50Percent
    ScrollDown50Percent
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${2314, 952}
    ...                                 ELSE                                                                                                                   Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${966, 521}
    Capture Page Screenshot

PagePayment
    ${status}                           Run Keyword And Return Status                                                                                          AppiumLibrary.Wait Until Element Is Visible             xpath=//XCUIElementTypeButton[@name="รับทราบ"]
    IF                                  '${status}' == 'True'                                                                                                  WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="รับทราบ"]
    WaitAndClick                        ${BTN_ONLINE['${ENV}']}
    Capture Page Screenshot

SelectMethodPay
    [Arguments]                         ${data_test}
    IF                                  '${data_test['Payment']['PaymentMethod']}' == 'creditcard'                                                             SelectCreditCard
    ...                                 ELSE IF                                                                                                                '${data_test['Payment']['PaymentMethod']}' == 'mpos'    SelectMPOS
    ...                                 ELSE                                                                                                                   SelectMobileBanking

SelectCreditCard
    WaitAndClick                        xpath=//android.widget.TextView[@text='ชำระเบี้ยประกันออนไลน์']
    WaitAndClick                        ${BTN_CREDITCARD['${ENV}']}
    ScrollDown50Percent
    WaitAndClick                        ${DDL_SELECT_BANK['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1848, 189}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="ธนาคารกรุงเทพ จำกัด(มหาชน)"]
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1000 1270
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input text 4123456789012349
    ...                                 ELSE                                                                                                                   WaitAndInput                                            ${TXT_ACCOUNT_NO['${ENV}']}                                                                                                                                                                                                                                                           4123456789012349
    WaitAndInput                        ${TXT_CREDITCARD_FORENAME['${ENV}']}                                                                                   QA
    WaitAndInput                        ${TXT_CREDITCARD_SURENAME['${ENV}']}                                                                                   Automation
    WaitAndClick                        ${DDL_SELECTMONTH['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${957, 1208}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="10"]
    WaitAndClick                        ${DDL_SELECTYEAR['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1350, 665}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="2024"]
    WaitAndClick                        ${DDL_RELATIONSHIP['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1800, 1115}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="ตนเอง"]
    IF                                  '${ENV}' == 'android'                                                                                                  Clear Text                                              xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View[4]/android.widget.EditText
    ...                                 ELSE                                                                                                                   AppiumLibrary.Clear Text                                xpath=//XCUIElementTypeTextField[@value= "5,000,000"]
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1080 1080
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input text 1
    ...                                 ELSE                                                                                                                   WaitAndInput                                            ${TXT_AMOUNT['${ENV}']}                                                                                                                                                                                                                                                               1
    Capture Page Screenshot

SelectMPOS
    WaitAndClick                        ${BTN_MPOS['${ENV}']}
    IF                                  '${ENV}' == 'ios'                                                                                                      ScrollDown50Percent
    WaitAndClick                        ${DDL_SELECT_BANK['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1710, 195}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="ธนาคารกรุงเทพ จำกัด(มหาชน)"]
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1178 1265
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input text 4123456789012349
    ...                                 ELSE                                                                                                                   WaitAndInput                                            ${TXT_ACCOUNT_NO['${ENV}']}                                                                                                                                                                                                                                                           4123456789012349
    WaitAndInput                        ${TXT_MPOS_FORENAME['${ENV}']}                                                                                         QA
    WaitAndInput                        ${TXT_MPOS_SURENAME['${ENV}']}                                                                                         Automation
    WaitAndClick                        ${DDL_SELECTMONTH['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${963, 1208}
    WaitAndClick                        xpath=//XCUIElementTypeButton[@name="10"]
    WaitAndClick                        ${DDL_SELECTYEAR['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1352, 676}
    WaitAndClick                        xpath=//XCUIElementTypeButton[@name="2024"]
    WaitAndClick                        ${DDL_RELATIONSHIP['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1777, 1120}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="ตนเอง"]
    IF                                  '${ENV}' == 'android'                                                                                                  Clear Text                                              xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View[4]/android.widget.EditText
    ...                                 ELSE                                                                                                                   AppiumLibrary.Clear Text                                xpath=//XCUIElementTypeTextField[@value= "5000000"]
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1080 1080
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input text 1
    ...                                 ELSE                                                                                                                   WaitAndInput                                            ${TXT_AMOUNT['${ENV}']}                                                                                                                                                                                                                                                               1
    Capture Page Screenshot

SelectMobileBanking
    WaitAndClick                        ${BTN_CASH['${ENV}']}
    IF                                  '${ENV}' == 'android'                                                                                                  WaitAndClick                                            xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View[5]/android.view.View
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeOther[@value='ความสัมพันธ์กับผู้ขอเอาประกันภัย']
    IF                                  '${ENV}' == 'android'                                                                                                  Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${1750, 872}
    ...                                 ELSE                                                                                                                   WaitAndClick                                            xpath=//XCUIElementTypeButton[@name="ตนเอง"]
    WaitAndInput                        ${TXT_MOBILEBANKING_FORENAME['${ENV}']}                                                                                QA
    WaitAndInput                        ${TXT_MOBILEBANKING_SURENAME['${ENV}']}                                                                                Automation
    IF                                  '${ENV}' == 'android'                                                                                                  Clear Text                                              xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View[4]/android.widget.EditText
    ...                                 ELSE                                                                                                                   AppiumLibrary.Clear Text                                xpath=//XCUIElementTypeTextField[@value= "5000000"]
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 1000 1070
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input text 1
    ...                                 ELSE                                                                                                                   WaitAndInput                                            ${TXT_AMOUNT['${ENV}']}                                                                                                                                                                                                                                                               1
    Capture Page Screenshot

TabProgressInstalment
    IF                                  '${ENV}' == 'android'                                                                                                  WaitAndClick                                            ${TXT_TAB_PROGRESS['${ENV}']}
    ...                                 ELSE                                                                                                                   Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${645, 158}
    ScrollDown50Percent
    IF                                  '${ENV}' == 'android'                                                                                                  Execute Adb Shell                                       input tap 2300 1170
    ...                                 ELSE                                                                                                                   Tap With Positions                                      100                                                                                                                                                                                                                                                                                   ${911, 543}
    Capture Page Screenshot
    IF                                  '${ENV}' == 'ios'                                                                                                      WaitAndClick                                            xpath=//XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeImage[2]

Instalment
    [Arguments]                         ${insured_id}
    SearchFillter                       ${insured_id}
    SelectFirstItem
    TabProgressInstalment
