*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SelectDataPayment
    WaitAndClick                 xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View[3]
    WaitAndClick                 ${TXT_PROGRESS}
    Swipe By Percent             90                                                                                                                                                                                                   60                                                      90                                                                                                                0
    WaitAndClick                 ${TXT_INPUT_PAYMENT}

SelectPaymentMethod
    [Arguments]                  ${data_test}
    Run Keyword If               '${data_test['Payment']['PaymentMethod']}' == 'creditcard'                                                                                                                                           CreditCard                                              ${data_test}
    ...                          ELSE IF                                                                                                                                                                                              '${data_test['Payment']['PaymentMethod']}' == 'bank'    Bank                                                                                                              ${data_test}
    ...                          ELSE                                                                                                                                                                                                 Other

CreditCard
    [Arguments]                  ${data_test}
    WaitAndClick                 ${BTN_METHOD_CREDITCARD}
    Swipe By Percent             90                                                                                                                                                                                                   40                                                      90                                                                                                                0
    SelectRelationCard           ${data_test}
    SelectMonthCard              ${data_test}
    SelectYearCard               ${data_test}
    SelectBank                   ${data_test}

    WaitAndInput                 xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.widget.EditText[1]    ${data_test['Credit']['CreditNo']}
    WaitAndInput                 xpath=//android.widget.EditText[@resource-id='forename']                                                                                                                                             ${data_test['Credit']['CardHolderName']}
    WaitAndInput                 xpath=//android.widget.EditText[@resource-id='surname']                                                                                                                                              ${data_test['Credit']['CardHolderSurName']}
    Run Keyword If               '${data_test['Credit']['FormatPay']}' == 'standard'                                                                                                                                                  PaymentStandard
    ...                          ELSE                                                                                                                                                                                                 PaymentCustom

SelectRelationCard
    [Arguments]                  ${data_test}
    WaitAndClick                 ${DDL_RELATION_CARD['${ENV}']}
    WaitAndClick                 xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['Relationship']}')]

SelectMonthCard
    [Arguments]                  ${data_test}
    WaitAndClick                 ${DDL_EXPIRY_MONTH['${ENV}']}
    FOR                          ${i}                                                                                                                                                                                                 IN RANGE                                                2
    ${status}                    Run Keyword And Return Status                                                                                                                                                                        AppiumLibrary.Wait Until Element Is Visible             xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateMonth']}')]
    Run Keyword If               '${status}' == 'True'                                                                                                                                                                                WaitAndClick                                            xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateMonth']}')]
    ...                          ELSE                                                                                                                                                                                                 Execute Adb Shell                                       input swipe 1000 1200 1000 900
    END

SelectYearCard
    [Arguments]                  ${data_test}
    WaitAndClick                 ${DDL_EXPIRY_YEAR['${ENV}']}
    WaitAndClick                 xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['ExpiryDateYear']}')]

SelectBank
    [Arguments]                  ${data_test}
    WaitAndClick                 ${DDL_BANK_NAME['${ENV}']}
    WaitAndClick                 xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['Credit']['BankName']}')]

PaymentStandard
    WaitAndClick                 xpath=//android.view.View[@text='หักตามรอบของบริษัท']
    Swipe By Percent             90                                                                                                                                                                                                   40                                                      90                                                                                                                0
    Execute Adb Shell            input tap 1000 1200

PaymentCustom
    WaitAndClick                 xpath=//android.view.View[@text='เลือกหักทุกวันที่กำหนดเอง']
    Swipe By Percent             90                                                                                                                                                                                                   40                                                      90                                                                                                                0
    WaitAndClick                 xpath=//android.view.View[@text='เลือกวันที่']
    WaitAndClick                 xpath=//android.view.View[@resource-id='EAppFormList']/android.view.View[1]/android.view.View/android.view.View[14]/android.view.View[2]/android.widget.ListView/android.view.View[1]
    Execute Adb Shell            input tap 800 1400

Bank
    [Arguments]                  ${data_test}
    WaitAndClick                 ${BTN_METHOD_BANK}
    sleep                        3s
    Swipe By Percent             90                                                                                                                                                                                                   50                                                      90                                                                                                                0
    MobileBankingRelationBank    ${data_test}
    MobileBankingInfo            ${data_test}
    MobileBankingSelectBank      ${data_test}
    Swipe By Percent             90                                                                                                                                                                                                   30                                                      90                                                                                                                0
    Execute Adb Shell            input tap 1000 1200

MobileBankingRelationBank
    [Arguments]                  ${data_test}
    WaitAndClick                 xpath=//android.view.View[@index='17']/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                 xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['MobileBank']['BankRelationship']}')]

MobileBankingInfo
    [Arguments]                  ${data_test}
    WaitAndInput                 xpath=//android.widget.EditText[@resource-id='forename']                                                                                                                                             ${data_test['MobileBank']['Name']}
    WaitAndInput                 xpath=//android.widget.EditText[@resource-id='surname']                                                                                                                                              ${data_test['MobileBank']['Surname']}
    # WaitAndInput                 xpath=//android.widget.EditText[@resource-id='IdCard']                                                                                                                                               ${data_test['MobileBank']['BankIdNo']}
    WaitAndInput                 xpath=//android.widget.EditText[@resource-id='MobileNumber']                                                                                                                                         ${data_test['MobileBank']['BankPhone']}

MobileBankingSelectBank
    [Arguments]                  ${data_test}
    WaitAndClick                 xpath=//android.view.View[@index='7']/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                 xpath=//android.widget.ListView/android.view.View[contains(@text,'${data_test['MobileBank']['BankName']}')]

Other
    [Arguments]                  ${data_test}
    WaitAndClick                 ${BTN_METHOD_OTHER}
