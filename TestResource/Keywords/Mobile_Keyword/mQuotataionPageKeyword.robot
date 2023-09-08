*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
CreateQuotationMobile
    [Arguments]                                    ${data_test}
    ClickButtonCreateQuotation
    DialogCreate
    InsuredInformation                             ${data_test}
    IF                                             ${data_test['InsuredInformation']['Age']} > 0                                                                     PlanA                                               ${data_test}
    ...                                            ELSE                                                                                                              PlanB                                               ${data_test}

PlanA
    [Arguments]                                    ${data_test}
    ChooseBasicPlan                                ${data_test}

PlanB
    [Arguments]                                    ${data_test}
    PayerInformation                               ${data_test}
    ChooseBasicPlan                                ${data_test}

DialogCreate
    IF                                             '${ENV}' == 'android'                                                                                             DialogCreateAndroid
    ...                                            ELSE                                                                                                              DialogCreateIOS

DialogCreateAndroid
    Tap With Positions                             100                                                                                                               ${1038, 1326}
    Tap With Positions                             100                                                                                                               ${1256, 1219}
    Tap With Positions                             100                                                                                                               ${1283, 1495}

DialogCreateIOS
    FOR                                            ${i}                                                                                                              IN RANGE                                            2
    Tap With Positions                             100                                                                                                               ${426, 642}
    Tap With Positions                             100                                                                                                               ${534, 592}
    Tap With Positions                             100                                                                                                               ${549, 756}
    END

InsuredInformation
    [Arguments]                                    ${data_test}
    InputInsuredName                               ${data_test}
    InputInsuredLastname                           ${data_test}
    SelectInsuredGender                            ${data_test}
    SelectDateOfBirth                              ${data_test}
    SeleteInsuredOccuption                         ${data_test}

ClickButtonCreateQuotation
    IF                                             '${ENV}' == 'android'                                                                                             AppiumLibrary.Wait Until Element Is Visible         ${BTN_CREATE_QUOTATION_MOBILE['${ENV}']}
    IF                                             '${ENV}' == 'android'                                                                                             WaitAndClick                                        ${BTN_CREATE_QUOTATION_MOBILE['${ENV}']}
    ...                                            ELSE                                                                                                              Tap With Positions                                  100                                                                                               ${915, 150}

InputInsuredName
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_NAME_MOBILE['${ENV}']}                                                                                      ${data_test['InsuredInformation']['Name']}

InputInsuredLastname
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_LASTNAME_MOBILE['${ENV}']}                                                                                  ${data_test['InsuredInformation']['Lastname']}

SelectInsuredGender
    [Arguments]                                    ${data_test}
    IF                                             '${data_test['InsuredInformation']['Gender']}' == 'M'                                                             InsuredClickRadioMale
    ...                                            ELSE                                                                                                              InsuredClickRadioFemale

InsuredClickRadioMale
    IF                                             '${ENV}' == 'android'                                                                                             Execute Adb Shell                                   input tap 1000 750
    ...                                            ELSE                                                                                                              WaitAndTap                                          xpath=//XCUIElementTypeStaticText[@name="ชาย"]

InsuredClickRadioFemale
    IF                                             '${ENV}' == 'android'                                                                                             Execute Adb Shell                                   input tap 1200 750
    ...                                            ELSE                                                                                                              WaitAndTap                                          xpath=//XCUIElementTypeStaticText[@name="หญิง"]

SelectDateOfBirth
    [Arguments]                                    ${data_test}
    IF                                             '${ENV}' == 'android'                                                                                             SelectDateAndroid                                   ${data_test}
    ...                                            ELSE                                                                                                              InputAgeIOS                                         ${data_test}

InputAgeIOS
    [Arguments]                                    ${data_test}
    AppiumLibrary.Wait Until Element Is Visible    xpath=//XCUIElementTypeOther[@name="ยืนยันความสนใจแบบประกันยูนิตลิงค์, tab panel"]/XCUIElementTypeTextField[4]    ${timeout}
    AppiumLibrary.Input Text                       xpath=//XCUIElementTypeOther[@name="ยืนยันความสนใจแบบประกันยูนิตลิงค์, tab panel"]/XCUIElementTypeTextField[4]    ${data_test['InsuredInformation']['Age']}
    Run Keyword If                                 '${ENV}' == 'ios'                                                                                                 Perform iOS Specific Actions
    Capture Page Screenshot

SelectDateAndroid
    [Arguments]                                    ${data_test}
    IF                                             ${data_test['InsuredInformation']['Age']} > 0                                                                     SelectDateMobile                                    ${data_test}
    ...                                            ELSE                                                                                                              SelectMonthMobile
    AppiumLibrary.Tap                              ${None}                                                                                                           500                                                 500
    WaitElement2sec

SelectDateMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_BIRTHDAY_MOBILE['${ENV}']}
    ${status}                                      Run Keyword And Return Status                                                                                     AppiumLibrary.Wait Until Element Is Visible         ${BTN_BIRTHDAY_MOBILE['${ENV}']}                                                                  ${timeout}
    IF                                             '${status}' == 'True'                                                                                             Execute Adb Shell                                   input tap 1900 1050
    AppiumLibrary.Wait Until Element Is Visible    ${DDL_BIRTHDAY_MOBILE_PRR_First}                                                                                  ${timeout}
    AppiumLibrary.Click Element                    ${DDL_BIRTHDAY_MOBILE_PRR_First}
    FOR                                            ${index}                                                                                                          IN RANGE                                            ${data_test['InsuredInformation']['Age']}
    AppiumLibrary.Wait Until Element Is Visible    ${DDL_BIRTHDAY_MOBILE_PRR}                                                                                        ${timeout}
    AppiumLibrary.Click Element                    ${DDL_BIRTHDAY_MOBILE_PRR}
    END
    AppiumLibrary.Tap                              ${DDL_BIRTHDAY_MOBILE_PRR}

SelectMonthMobile
    WaitAndClick                                   ${BTN_BIRTHDAY_MOBILE['${ENV}']}
    WaitAndClick                                   ${DDL_BIRTHDAY_MOBILE_MONTH_First}                                                                                ${timeout}

SeleteInsuredOccuption
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_OCCUPTION_MOBILE['${ENV}']}
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                 ${data_test['InsuredInformation']['Occupation']}
    WaitAndClick                                   ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}

ChooseBasicPlan
    [Arguments]                                    ${data_test}
    ClickButtonSelectProduct
    SelectProduct
    InputSumInsured                                ${data_test}

ClickButtonSelectProduct
    WaitAndClick                                   ${MENU_INSURANCE['${ENV}']}
    WaitAndClick                                   ${BTN_ADD_INSURANCE['${ENV}']}                                                                                    ${timeout}

SelectProduct
    WaitAndTap                                     ${TXT_ITEMCODE['${ENV}']}
    IF                                             '${ENV}' == 'android'                                                                                             Execute Adb Shell                                   input tap 1870 930
    ...                                            ELSE                                                                                                              AppiumLibrary.Tap With Positions                    100                                                                                               ${1300, 1050}

InputSumInsured
    [Arguments]                                    ${data_test}
    IF                                             '${ENV}' == 'android'                                                                                             Android_SumInsured                                  ${data_test}
    ...                                            ELSE                                                                                                              WaitAndInput                                        xpath=//XCUIElementTypeTextField[@value=0]                                                        ${data_test['Insured']['Suminsured']}
    AppiumLibrary.Tap With Positions               100                                                                                                               ${1300, 1300}
    WaitAndTap                                     ${TXT_MONTH3_MOBILE['${ENV}']}

Android_SumInsured
    [Arguments]                                    ${data_test}
    Tap With Positions                             100                                                                                                               ${1828, 998}
    Execute Adb Shell                              input text 50000

SuitablityTest
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${MENU_SUITABILITY_TEST['${ENV}']}
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_SUITABILITY_TEST_NEXT['${ENV}']}
    IF                                             '${data_test['Suitablitytest']['Choice']}' == 'Yes'                                                               WaitAndClick                                        ${TXT_SUITABILITY_TEST_YES['${ENV}']}
    ...                                            ELSE                                                                                                              WaitAndClick                                        ${TXT_SUITABILITY_TEST_NO['${ENV}']}
    WaitAndClick                                   ${BTN_SUITABILITY_TEST_NEXT['${ENV}']}
    IF                                             '${data_test['Suitablitytest']['Choice']}' == 'Yes'                                                               AnswerSuitablity                                    ${data_test}
    IF                                             '${data_test['Suitablitytest']['Choice']}' == 'Yes'                                                               ResultInvestment                                    ${data_test}

AnswerSuitablity
    [Arguments]                                    ${data_test}
    FOR                                            ${index}                                                                                                          IN RANGE                                            1                                                                                                 11
    AnswerChoice${index}                           ${data_test}                                                                                                      ${index}
    END
    FindButtonSubmit
    WaitAndClick                                   ${AnswerChoice11['${ENV}']}
    WaitAndClick                                   ${AnswerChoice12['${ENV}']}
    ClickSubmitAnswer

AnswerChoice${index}
    [Arguments]                                    ${data_test}                                                                                                      ${index}
    IF                                             '${ENV}' == 'android'                                                                                             Answer_Android                                      ${data_test}                                                                                      ${index}
    ...                                            ELSE                                                                                                              Answer_IOS                                          ${data_test}                                                                                      ${index}

Answer_Android
    [Arguments]                                    ${data_test}                                                                                                      ${index}
    IF                                             ${index} >= 3                                                                                                     AppiumLibrary.Swipe                                 2000                                                                                              800                                      2000    200
    IF                                             ${index} == 7                                                                                                     AppiumLibrary.Swipe                                 2000                                                                                              800                                      2000    200
    WaitAndClick                                   xpath=//android.widget.TextView[@text='${data_test['Suitablitytest']['Answer${index}']}']
    Capture Page Screenshot

Answer_IOS
    [Arguments]                                    ${data_test}                                                                                                      ${index}
    SwipeFindTextIOS                               ${data_test['Suitablitytest']['Answer${index}']}
    ${element_visible}                             Run Keyword And Return Status                                                                                     AppiumLibrary.Wait Until Page Contains              ${data_test['Suitablitytest']['Answer${index}']}                                                  ${timeout}
    Run Keyword If                                 '${element_visible}' == 'True'                                                                                    AppiumLibrary.Click Text                            ${data_test['Suitablitytest']['Answer${index}']}
    Run Keyword If                                 '${ENV}' == 'ios'                                                                                                 Perform iOS Specific Actions
    Capture Page Screenshot

FindButtonSubmit
    IF                                             '${ENV}' == 'ios'                                                                                                 SwipeFindLocatorIOS                                 ${BTN_SUBMIT_ANSWER['${ENV}']}
    ...                                            ELSE                                                                                                              AppiumLibrary.Swipe                                 2000                                                                                              1200                                     2000    200

ClickSubmitAnswer
    WaitAndClick                                   ${BTN_SUBMIT_ANSWER['${ENV}']}

ResultInvestment
    [Arguments]                                    ${data_test}
    AppiumLibrary.Wait Until Element Is Visible    ${TXT_TESTRESULT['${ENV}']}                                                                                       ${timeout}
    SwipeFindLocator                               ${BTN_TESTAGIN['${ENV}']}
    IF                                             '${data_test['Investment']['Choice']}' == 'Yes'                                                                   ClickInvestment                                     ${data_test}
    ...                                            ELSE                                                                                                              WaitAndClick                                        ${BTN_NONEINVEST['${ENV}']}

ClickInvestment
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_INVEST['${ENV}']}
    Investment                                     ${data_test}

Investment
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${MENU_INVESTMENT['${ENV}']}
    WaitAndClick                                   ${BTN_INVESTMENT_SUBMIT['${ENV}']}
    IF                                             '${data_test['Investment']['Choice']}' == 'Yes'                                                                   WaitAndClick                                        ${BTN_SELECT_INVEST['${ENV}']}
    ...                                            ELSE                                                                                                              WaitAndClick                                        ${BTN_NONESELECT_INVEST['${ENV}']}
    WaitAndClick                                   ${BTN_NEXT_INVEST['${ENV}']}
    IF                                             '${data_test['Investment']['Choice']}' == 'Yes'                                                                   BasicAllocation                                     ${data_test}
    ...                                            ELSE                                                                                                              AutoFundSwitching                                   ${data_test}

BasicAllocation
    [Arguments]                                    ${data_test}
    AppiumLibrary.Click Text                       Basic Allocation
    Capture Page Screenshot
    WaitAndClick                                   ${BTN_SELECT_FUND['${ENV}']}
    IF                                             '${ENV}' == 'ios'                                                                                                 WaitAndClick                                        ${BTN_SELECT_FUND1['${ENV}']}
    ...                                            ELSE                                                                                                              Tap With Positions                                  100                                                                                               ${2278, 343}
    IF                                             '${ENV}' == 'ios'                                                                                                 SelectQuotationFund                                 ${data_test}
    ...                                            ELSE                                                                                                              AndroidSelectQuotationFund                          ${data_test}
    SelectFund

AutoFundSwitching
    [Arguments]                                    ${data_test}
    AppiumLibrary.Click Text                       Auto Fund Switching
    Capture Page Screenshot
    WaitAndClick                                   ${BTN_SELECT_FUND['${ENV}']}
    IF                                             '${ENV}' == 'ios'                                                                                                 WaitAndClick                                        ${BTN_SELECT_FUND1['${ENV}']}
    ...                                            ELSE                                                                                                              Tap With Positions                                  100                                                                                               ${2278, 343}
    IF                                             '${ENV}' == 'ios'                                                                                                 SelectQuotationFund                                 ${data_test}
    ...                                            ELSE                                                                                                              AndroidSelectQuotationFund                          ${data_test}
    SelectFund

AndroidSelectQuotationFund
    [Arguments]                                    ${data_test}
    WaitElement2sec
    FOR                                            ${index}                                                                                                          IN RANGE                                            5
    AppiumLibrary.Swipe                            2000                                                                                                              800                                                 2000                                                                                              200
    Capture Page Screenshot
    END
    WaitAndClick                                   xpath=//android.widget.TextView[@text='SCBFP']
    WaitElement5sec
    Execute Adb Shell                              input tap 2500 50

SelectQuotationFund
    [Arguments]                                    ${data_test}
    ${input_string}                                Set Variable                                                                                                      ${data_test['Investment']['Fund']}
    ${fund}                                        Evaluate                                                                                                          "${input_string}".split(',')
    FOR                                            ${index}                                                                                                          IN RANGE                                            0                                                                                                 ${fund.__len__()}
    ${item}                                        Set Variable                                                                                                      ${fund[${index}]}
    SwipeFindTextIOS                               ${item}
    AppiumLibrary.Click Text                       ${item}
    CloseFund
    END

SelectFund
    IF                                             '${ENV}' == 'ios'                                                                                                 WaitAndClick                                        ${CHK_SCBFP_FUND['${ENV}']}
    ...                                            ELSE                                                                                                              ClickFund
    WaitAndClick                                   ${BTN_CONFIRM['${ENV}']}
    IF                                             '${ENV}' == 'android'                                                                                             WaitAndInput                                        ${TXT_PERCENTAGE['${ENV}']}                                                                       100
    ...                                            ELSE                                                                                                              WaitAndInput                                        ${TXT_PERCENTAGE['${ENV}']}                                                                       10
    WaitAndClick                                   ${BTN_CONFIRM['${ENV}']}

ClickFund
    Execute Adb Shell                              input tap 270 950

CloseFund
    FOR                                            ${i}                                                                                                              IN RANGE                                            2
    Tap With Positions                             100                                                                                                               ${45, 787}
    AppiumLibrary.Wait Until Element Is Visible    ${CHK_SCBFP_FUND['${ENV}']}                                                                                       ${timeout}
    END

PayerInformation
    [Arguments]                                    ${data_test}
    InputPayerName                                 ${data_test}
    InputPayerLastName                             ${data_test}
    SelectPayerGender                              ${data_test}
    SelectDateOfBirthPayer                         ${data_test}

InputPayerName
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${MENU_PAYERINSURANCE}
    IF                                             '${ENV}' == 'ios'                                                                                                 ${TXT_PAYER_NAME['${ENV}']}                         ${data_test['PayerInformation']['Name']}
    ...                                            ELSE                                                                                                              Execute Adb Shell                                   input tap 1000 500
    IF                                             '${ENV}' == 'android'                                                                                             Execute Adb Shell                                   input text QA

InputPayerLastName
    [Arguments]                                    ${data_test}
    IF                                             '${ENV}' == 'ios'                                                                                                 ${TXT_PAYER_LASTNAME['${ENV}']}                     ${data_test['PayerInformation']['Lastname']}
    ...                                            ELSE                                                                                                              Execute Adb Shell                                   input tap 1800 500
    IF                                             '${ENV}' == 'android'                                                                                             Execute Adb Shell                                   input text Auto

SelectPayerGender
    [Arguments]                                    ${data_test}
    IF                                             '${data_test['PayerInformation']['Gender']}' == 'M'                                                               PayerClickRadioMale
    ...                                            ELSE                                                                                                              PayerClickRadioFemale

PayerClickRadioMale
    IF                                             '${ENV}' == 'android'                                                                                             AppiumLibrary.Click Element                         ${RDO_MALE_MOBILE}
    ...                                            ELSE                                                                                                              WaitAndTap                                          xpath=//XCUIElementTypeStaticText[@name="ชาย"]

PayerClickRadioFemale
    IF                                             '${ENV}' == 'android'                                                                                             AppiumLibrary.Click Element                         ${RDO_FEMALE_MOBILE}
    ...                                            ELSE                                                                                                              WaitAndTap                                          xpath=//XCUIElementTypeStaticText[@name="หญิง"]

SelectDateOfBirthPayer
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_PAYBIRTHDAY_MOBILE}
    IF                                             ${data_test['PayerInformation']['Age']} > 0                                                                       SelectDateMobile2                                   ${data_test}
    ...                                            ELSE                                                                                                              SelectMonthMobile2
    AppiumLibrary.Tap                              ${None}                                                                                                           500                                                 500
    SeletePayerOccuption                           ${data_test}

SelectDateMobile2
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_BIRTHDAY_MOBILE['${ENV}']}
    WaitAndClick                                   ${DDL_BIRTHDAY_MOBILE_PRR_First}                                                                                  ${timeout}
    FOR                                            ${index}                                                                                                          IN RANGE                                            ${data_test['PayerInformation']['Age']}
    WaitAndClick                                   ${DDL_BIRTHDAY_MOBILE_PRR}                                                                                        ${timeout}
    END
    AppiumLibrary.Tap                              ${DDL_BIRTHDAY_MOBILE_PRR}

SelectMonthMobile2
    WaitAndClick                                   ${BTN_BIRTHDAY_MOBILE['${ENV}']}
    AppiumLibrary.Wait Until Element Is Visible    ${DDL_BIRTHDAY_MOBILE_MONTH_First}                                                                                ${timeout}
    AppiumLibrary.Click Element                    ${DDL_BIRTHDAY_MOBILE_MONTH_First}

SeletePayerOccuption
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${BTN_OCCUPTION2_MOBILE}
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                 ${data_test['PayerInformation']['Occupation']}
    WaitAndClick                                   ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}

MobileSummaryInsured
    WaitAndClick                                   ${MENU_SUMMARY['${ENV}']}
    IF                                             '${ENV}' == 'android'                                                                                             AppiumLibrary.Swipe                                 2000                                                                                              800                                      2000    400
    ...                                            ELSE                                                                                                              SwipeFindLocatorIOS                                 ${BTN_VIEW_SALE['${ENV}']}
    WaitAndClick                                   ${BTN_VIEW_SALE['${ENV}']}
    IF                                             '${ENV}' == 'android'                                                                                             WaitElement2sec
    AppiumLibrary.Tap                              ${NONE}                                                                                                           ${100}                                              ${100}

HomeQuotation
    IF                                             '${ENV}' == 'android'                                                                                             WaitAndClick                                        xpath=//android.view.View[2]/android.view.View[@index=1]                                          ${timeout}
    ...                                            ELSE                                                                                                              AppiumLibrary.Tap                                   ${None}                                                                                           135                                      350
    IF                                             '${ENV}' == 'android'                                                                                             WaitAndClick                                        xpath=//android.view.View[@resource-id='quotation-info']/android.view.View[7]                     ${timeout}
    ...                                            ELSE                                                                                                              WaitAndClick                                        xpath=//XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeImage[6]

PreviewSI
    [Arguments]                                    ${insured_id}
    SearchFillter                                  ${insured_id}
    SelectFirstItem
    ClickButtonViewSI

ClickButtonViewSI
    WaitAndClick                                   ${BTN_VIEW_SI_QUOTATION['${ENV}']}
    WaitElement2sec
    IF                                             '${ENV}' == 'android'                                                                                             Tap With Positions                                  100                                                                                               ${957, 444}
    ...                                            ELSE                                                                                                              Tap With Positions                                  100                                                                                               ${380, 214}
    Capture Page Screenshot
    IF                                             '${ENV}' == 'android'                                                                                             Tap With Positions                                  100                                                                                               ${1256, 964}
    ...                                            ELSE                                                                                                              Tap With Positions                                  100                                                                                               ${539, 460}
    WaitElement5sec
    Capture Page Screenshot
