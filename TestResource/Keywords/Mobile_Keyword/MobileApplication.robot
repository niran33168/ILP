*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
LoginAndSetupPin
    [Arguments]                                    ${data_test}
    ${Reset}                                       mGetDevices                                                                                                                                                                                                                                                      ${devicesName}[0]                                                                        ${JsonfilePath}                                                                                                                                                                                                     ${AppPackage['${ENV}']}                                                                          ${AppActivity}    true
    Run Keyword If                                 '${Reset}' == 'False'                                                                                                                                                                                                                                            ResetFalse                                                                               ELSE                                                                                                                                                                                                                InputPasscode

ResetFalse
    CheckPermission
    VerifyAndLogin                                 ${data_test}
    SetupPin

ClickImportant
    WaitAndClick                                   ${TXT_IMPORTANTMOBILE['${ENV}']}

SelectFormatSale
    [Arguments]                                    ${data_test}
    Run Keyword If                                 '${data_test['InsuredInformation']['Format']}' == 'Y'                                                                                                                                                                                                            WaitAndClick                                                                             ${BTN_F2FMOBILE}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             ${BTN_NONF2FMOBILE}

SelectDocMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${DDL_DOCMOBILE['${ENV}']}
    Run Keyword If                                 '${data_test['InsuredInformation']['CardType']}' == 'ID'                                                                                                                                                                                                         WaitAndClick                                                                             ${TXT_ID_MOBILE['${ENV}']}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             ${TXT_ID1_MOBILE['${ENV}']}

InputIdAndLaser
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_IDNO}                                                                                                                                                                                                                                              ${data_test['InsuredInformation']['Id']}
    WaitAndInput                                   ${TXT_INSURED_LASERCODE}                                                                                                                                                                                                                                         ${data_test['InsuredInformation']['LaserCode']}

SelectExpiredateApplication
    [Arguments]                                    ${data_test}
    WaitAndTap                                     ${TXT_INSURED_EXPIRYDATE}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                          ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                                              6x                                                                                                                                                                                                                  ${timeout}                                                                                       WaitAndTap        ${TXT_INSURED_EXPIRYDATE}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                                                      False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 2
    SelectYearExpiredate
    END
    WaitAndClick                                   ${BTN_EXPIREDATEOK_MOBILE}

SelectYearExpiredate
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                                                                       ${timeout}
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            WaitAndTap                                                                               //android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[2]
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input swipe                                                                                                                                                                                                         1500                                                                                             1100              1500                         1200
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input tap 1500 950

SelectBirthdayApplication
    [Arguments]                                    ${data_test}
    ${age}                                         Set Variable                                                                                                                                                                                                                                                     ${data_test['InsuredInformation']['Age']}
    WaitAndTap                                     ${TXT_INSURED_BIRTHDAY}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                           ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                                              6x                                                                                                                                                                                                                  ${timeout}                                                                                       WaitAndTap        ${TXT_INSURED_BIRTHDAY}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                                                      False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 ${age}
    SelectYearBirthday
    END
    WaitAndClick                                   ${BTN_BIRTHDATEOK_MOBILE}
    Run Keyword If                                 ${age} >= 16                                                                                                                                                                                                                                                     AgeMoreThanEqual                                                                         ${data_test}
    ...                                            ELSE                                                                                                                                                                                                                                                             AgeLess                                                                                  ${data_test}

SelectYearBirthday
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                                                                        ${timeout}
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input tap 1500 1100

SelectRelationship
    Execute Adb Shell                              input tap 1200 1400
    Execute Adb Shell                              input tap 1200 1500
    Execute Adb Shell                              input tap 1200 1400
    Execute Adb Shell                              input tap 1200 1500

SelectBeneficiariesRelationship
    Execute Adb Shell                              input tap 1200 1250
    Execute Adb Shell                              input tap 1200 1300
    Execute Adb Shell                              input tap 1200 1350
    Execute Adb Shell                              input tap 1200 300

SelectRelationshipPayer
    Execute Adb Shell                              input tap 1300 550
    Execute Adb Shell                              input tap 1300 600

SelectDocPayer
    Execute Adb Shell                              input tap 1300 550
    Execute Adb Shell                              input tap 1300 600

SelectPayerNation
    Execute Adb Shell                              input tap 1000 1500
    Execute Adb Shell                              input tap 1000 500

ScrollDown500
    Execute Adb Shell                              input swipe 1300 500 1300 0

ScrollDown750
    Execute Adb Shell                              input swipe 1300 750 1300 0

ScrollDown1000
    Execute Adb Shell                              input swipe 1300 1000 1300 0

ClickNone6Month
    Execute Adb Shell                              input tap 1500 1100
    Execute Adb Shell                              input tap 1500 1200
    Execute Adb Shell                              input tap 1500 1300
    Execute Adb Shell                              input tap 1500 1400

ClickNone
    Execute Adb Shell                              input tap 1300 900
    Execute Adb Shell                              input tap 1300 1000
    Execute Adb Shell                              input tap 1300 1100
    Execute Adb Shell                              input tap 1300 1200
    Execute Adb Shell                              input tap 1300 1300
    Execute Adb Shell                              input tap 1300 1400
    Execute Adb Shell                              input tap 1300 1500
    Execute Adb Shell                              input tap 1300 1600
    Execute Adb Shell                              input tap 1300 1700
    Execute Adb Shell                              input tap 1300 1800

ClickNoneChoice
    Execute Adb Shell                              input tap 1500 900
    Execute Adb Shell                              input tap 1500 1000
    Execute Adb Shell                              input tap 1500 1100
    Execute Adb Shell                              input tap 1500 1200
    Execute Adb Shell                              input tap 1500 1300
    Execute Adb Shell                              input tap 1500 1400
    Execute Adb Shell                              input tap 1500 1500

ConfirmDOPA
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.widget.TextView[11]
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 5
    Execute Adb Shell                              input swipe 1500 400 1500 1600
    END
    ScrollDown1000
    Execute Adb Shell                              input tap 1000 550
    ScrollDown1000
    Execute Adb Shell                              input tap 1000 450
    Execute Adb Shell                              input tap 1000 550

ConfirmDOPA2
    WaitAndClick                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView[10]
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 5
    Execute Adb Shell                              input swipe 1500 400 1500 1600
    END
    ScrollDown750
    Execute Adb Shell                              input tap 1000 550
    ScrollDown750
    Execute Adb Shell                              input tap 1000 450
    Execute Adb Shell                              input tap 1000 550

PopupApplication
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${TXT_POPUP_APPLICATION['${ENV}']}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Tap                                                                        ${TXT_POPUP_APPLICATION['${ENV}']}
    Execute Adb Shell                              input tap 1000 550
    Execute Adb Shell                              input tap 1000 600
    Execute Adb Shell                              input tap 1200 750
    Execute Adb Shell                              input tap 1200 800
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Element Text Should Be                                                     ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}                                                                                                                                                                           E-Application

CreateApplicationMobile
    [Arguments]                                    ${data_test}
    PopupApplication
    WaitAndClick                                   ${BTN_CREATE_APPLICATION_MOBILE['${ENV}']}
    FromCreate

FromCreate
    TapPoint    1000    1300
    TapPoint    1000    1200
    TapPoint    1300    1500

InsuredInformationMobile
    [Arguments]                                    ${data_test}                                                                                                                                                                                                                                                     ${rowNo}
    ClickImportant
    SelectFormatSale                               ${data_test}
    SelectDocMobile                                ${data_test}
    InputIdAndLaser                                ${data_test}
    SelectExpiredateApplication                    ${data_test}
    SelectBirthdayApplication                      ${data_test}

PayerInformationMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION1['${ENV}']}
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}
    WaitAndClick                                   ${TXT_SUBSECTION2['${ENV}']}
    WaitAndClick                                   ${DDL_RELATION_MOBILE['${ENV}']}
    SelectRelationshipPayer
    WaitAndClick                                   ${DDL_PAYER_TITLE_MOBILE['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[1]/android.view.View/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[2]
    WaitAndInput                                   ${TXT_PAYER_IDNO}                                                                                                                                                                                                                                                ${data_test['PayerInformation']['Id']}
    WaitAndInput                                   ${TXT_PAYER_LASERCODE}                                                                                                                                                                                                                                           ${data_test['PayerInformation']['LaserCode']}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.view.View
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1000 750
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_IdExpiryDate']
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_EXPIREDATEOK_MOBILE}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                                              xpath=//android.widget.EditText[@resource-id='Payer_IdExpiryDate']
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                                                                       ${timeout}
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 2
    WaitAndTap                                     ${DDL_YEAR_PRE_MOBILE}
    END
    WaitAndClick                                   ${BTN_EXPIREDATEOK_MOBILE}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[4]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[4]/android.view.View/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[2]
    WaitAndInput                                   ${TXT_PAYER_THNAME_FIRST}                                                                                                                                                                                                                                        ${data_test['PayerInformation']['Name']}
    WaitAndInput                                   ${TXT_PAYER_THNAME_LAST}                                                                                                                                                                                                                                         ${data_test['PayerInformation']['Lastname']}
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_BirthDate']
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_BIRTHDATEOK_MOBILE}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                                              xpath=//android.widget.EditText[@resource-id='Payer_BirthDate']
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                                                                        ${timeout}
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 20
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[1]                                                                                                                                            ${timeout}
    AppiumLibrary.Tap                              xpath=//android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[1]
    END
    WaitAndClick                                   ${BTN_BIRTHDATEOK_MOBILE}
    Execute Adb Shell                              input tap 1000 800
    Execute Adb Shell                              input tap 1000 500

    Execute Adb Shell                              input tap 1000 900                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    WaitAndInput                                   ${TXT_PAYER_MOBILENO}                                                                                                                                                                                                                                            0894444835
    WaitAndInput                                   ${TXT_PAYER_EMAIL}                                                                                                                                                                                                                                               niran.loe@tokiomarinelife.co.th
    WaitAndClick                                   xpath=//android.widget.Button[@resource-id='Payer_Occupation1_Occupation']
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.ilp:id/occ_edittext_search']                                                                                                                                                             ${data_test['PayerInformation']['Occupation']}
    WaitAndClick                                   xpath=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/agm_list_item_code']
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}

PolicyMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION3['${ENV}']}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[2]/android.widget.TextView[1]
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                                              ${TXT_SECTION3['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[2]/android.widget.TextView[1]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View[6]/android.view.View/android.widget.TextView
    WaitAndClick                                   xpath=//android.widget.TextView[@text='URP1']
    WaitAndClick                                   xpath=//android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View[1]/android.widget.TextView
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.widget.Button
    WaitAndInput                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.EditText[1]                                              Kanig
    WaitAndInput                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.EditText[2]                                              Button
    WaitAndInput                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.EditText[4]                                              70
    WaitAndClick                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.Button[1]
    WaitAndClick                                   ${TXT_SECTION3['${ENV}']}

QuestionnaireMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[4]/android.view.View[2]/android.widget.TextView[1]
    WaitAndClick                                   ${TXT_INSURED_HASEXISTINGPOLICIES}
    WaitAndClick                                   ${TXT_INSURED_HASBEENREJECTED}
    WaitAndClick                                   ${TXT_INSURED_INVOLVEDINNARCOTICS}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_HealthyDetail']                                                                                                                                                                                            -
    WaitAndClick                                   ${TXT_INSURED_DRUGFLAG}
    WaitAndClick                                   ${TXT_INSURED_ALCOHOLFLAG}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               90                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${TXT_INSURED_SMOKEFLAG}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Weight']                                                                                                                                                                                                   ${data_test['Weight']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Height']                                                                                                                                                                                                   ${data_test['Hight']}
    WaitAndClick                                   ${TXT_INSURED_HASWEIGHTCHANGE}
    WaitAndClick                                   ${TXT_INSURED_HASFAMILYHISTORY}
    WaitAndClick                                   ${TXT_INSURED_HASSPOUSELIVERHIV}
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}

QuestionnaireMobile2
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[5]/android.view.View[2]/android.widget.TextView[1]
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                                              ${TXT_SECTION5['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[5]/android.view.View[2]/android.widget.TextView[1]
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_GestationalAge']                                                                                                                                                                                           ${data_test['GestationalAging']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_BirthWeight']                                                                                                                                                                                              ${data_test['BirthWeight']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_ChildAdmit']                                                                                                                                                                                               5
    ScrollDown1000
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[@index='63']/android.view.View/android.view.View/android.widget.ListView[2]/android.view.View
    ScrollDown1000
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[@index='64']/android.view.View/android.view.View/android.widget.ListView[2]/android.view.View
    ScrollDown500
    ClickNone6Month
    ScrollDown500
    ClickNone
    ScrollDown1000
    ClickNoneChoice
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}

QuestionnaireTaxMobile
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[6]/android.view.View[2]/android.widget.TextView
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}

Fatca
    AppiumLibrary.Swipe                            10                                                                                                                                                                                                                                                               1300                                                                                     10                                                                                                                                                                                                                  0
    WaitAndClick                                   ${TXT_SECTION7}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[7]/android.view.View[2]/android.widget.TextView[1]
    WaitAndClick                                   ${TXT_SECTION7}

RetryDopa
    AppiumLibrary.Swipe                            10                                                                                                                                                                                                                                                               500                                                                                      10                                                                                                                                                                                                                  1300
    WaitAndClick                                   ${TXT_SECTION1['${ENV}']}
    ConfirmDOPA
    WaitAndClick                                   ${TXT_SECTION1['${ENV}']}

RetryDopa2
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}
    ConfirmDOPA2
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}

SelectNation
    WaitAndClick                                   ${DDL_NATION['${ENV}']}
    WaitAndClick                                   ${DDL_NATION_THAI['${ENV}']}
    Execute Adb Shell                              input tap 1000 1000
    Execute Adb Shell                              input tap 900 500
    sleep                                          2s

SelectStatus
    WaitAndClick                                   ${DDL_STATUS['${ENV}']}
    WaitAndClick                                   ${DDL_STATUS_SINGLE['${ENV}']}
    Execute Adb Shell                              input tap 1000 850
    Execute Adb Shell                              input tap 900 500
    sleep                                          2s

InputAddress
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_POSTCODE_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['Postcode']}
    WaitAndTap                                     ${TXT_SELECT_POSTCODE['${ENV}']}

AgeMoreThanEqual
    [Arguments]                                    ${data_test}
    InputInsureName                                ${data_test}
    SelectNation
    SelectStatus
    InputAddress                                   ${data_test}
    WaitAndInput                                   ${TXT_INSURED_MOBILENO_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['MobileNo']}
    WaitAndInput                                   ${TXT_INSURED_EMAIL_MOBILE['${ENV}']}                                                                                                                                                                                                                            ${data_test['InsuredInformation']['Email']}
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ตามทะเบียนบ้านผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               80                                                                                       90                                                                                                                                                                                                                  0
    Run Keyword If                                 '${data_test['Contract']}' == '1'                                                                                                                                                                                                                                WaitAndClick                                                                             xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[1]
    ...                                            ELSE IF                                                                                                                                                                                                                                                          '${data_test['Contract']}' == '2'                                                        WaitAndClick                                                                                                                                                                                                        xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[2]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[3]
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               80                                                                                       90                                                                                                                                                                                                                  0
    AppiumLibrary.Click Element                    xpath=//android.widget.Button[@resource-id='Insured_Occupation1_Occupation']
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                                                                ${data_test['InsuredInformation']['Occupation']}
    AppiumLibrary.Click Element                    ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Occupation1_Income']                                                                                                                                                                                       ${data_test['InsuredInformation']['AnnualIncome']}
    WaitAndClick                                   xpath=//android.view.View[@resource-id='Insured_MotorcycleFlag']/android.widget.TextView[@text='ไม่ใช้']
    Execute Adb Shell                              input tap 1200 800
    sleep                                          2s

AgeLess
    [Arguments]                                    ${data_test}
    ApplicationKeyword.Education                   ${data_test}
    InformationFather                              ${data_test}
    InformationMother                              ${data_test}
    InputAddress                                   ${data_test}

### Simulator ###
InsuredInformationMobileSimulator
    [Arguments]                                    ${data_test}                                                                                                                                                                                                                                                     ${rowNo}
    ClickImportant
    SelectFormatSale                               ${data_test}
    SelectDocMobile                                ${data_test}
    InputIdAndLaser                                ${data_test}
    SelectExpiredateApplicationSimulator           ${data_test}
    InputInsureNameSimulator                       ${data_test}
    SelectBirthdayApplicationSimulator             ${data_test}
    SelectNationSimulator
    ConditionalFlow                                ${data_test}

InputInsureNameSimulator
    [Arguments]                                    ${data_test}
    sleep                                          5s
    WaitAndClick                                   xpath=//android.view.View [@resource-id='react-select-3--value']/android.view.View[1]
    WaitAndClick                                   xpath=//android.widget.ListView/android.view.View[1]
    WaitAndInput                                   ${TXT_INSURED_THNAME_FIRST}                                                                                                                                                                                                                                      ${data_test['InsuredInformation']['Name']}
    WaitAndInput                                   ${TXT_INSURED_THNAME_LAST}                                                                                                                                                                                                                                       ${data_test['InsuredInformation']['Lastname']}

ConditionalFlow
    [Arguments]                                    ${data_test}
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} >= 16                                                                                                                                                                                                                  MorethanOrEqual                                                                          ${data_test}
    ...                                            ELSE                                                                                                                                                                                                                                                             Lessthan                                                                                 ${data_test}

MorethanOrEqual
    [Arguments]                                    ${data_test}
    SelectStatusSimulator
    InputAddress                                   ${data_test}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                                                       90                                                                                                                                                                                                                  0
    WaitAndInput                                   ${TXT_INSURED_MOBILENO_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['MobileNo']}
    WaitAndInput                                   ${TXT_INSURED_EMAIL_MOBILE['${ENV}']}                                                                                                                                                                                                                            ${data_test['InsuredInformation']['Email']}
    WaitAndClick                                   ${BTN_CURRENT_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${BTN_WORK_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                                                       90                                                                                                                                                                                                                  0
    Run Keyword If                                 '${data_test['InsuredInformation']['Contact']}' == 'current'                                                                                                                                                                                                     WaitAndClick                                                                             ${TXT_CURRENT_ADDRESS['${ENV}']}
    ...                                            ELSE IF                                                                                                                                                                                                                                                          '${data_test['InsuredInformation']['Contact']}' == 'register'                            WaitAndClick                                                                                                                                                                                                        ${TXT_REGISTER_ADDRESS['${ENV}']}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             ${TXT_BUSINESS_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               50                                                                                       90                                                                                                                                                                                                                  0
    AppiumLibrary.Click Element                    xpath=//android.widget.Button[@resource-id='Insured_Occupation1_Occupation']
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                                                                ${data_test['InsuredInformation']['Occupation']}
    WaitAndClick                                   ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Occupation1_Income']                                                                                                                                                                                       ${data_test['InsuredInformation']['AnnualIncome']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               50                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${BTN_INSURED_MOTORCYCLE['${ENV}']}
    Execute Adb Shell                              input tap 1200 700

Lessthan
    [Arguments]                                    ${data_test}
    Run Keyword If                                 '${data_test['InsuredInformation']['Education']}' == 'Y'                                                                                                                                                                                                         WaitAndClick                                                                             xpath=//android.view.View[@resource-id='Insured_IsStudent']/android.view.View[1]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             xpath=//android.view.View[@resource-id='Insured_IsStudent']/android.view.View[2]
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.widget.EditText[@resource-id='Insured_StudyYear']                                                                                                                                                   ${timeout}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Run Keywords                                                                             WaitAndInput                                                                                                                                                                                                        xpath=//android.widget.EditText[@resource-id='Insured_StudyYear']                                1
    ...                                            AND                                                                                                                                                                                                                                                              WaitAndInput                                                                             xpath=//android.widget.EditText[@resource-id='Insured_SchoolName']                                                                                                                                                  AutomateSchool
    ...                                            AND                                                                                                                                                                                                                                                              AppiumLibrary.Swipe By Percent                                                           90                                                                                                                                                                                                                  50                                                                                               90                0
    InformationFatherAppilication                  ${data_test}
    InformationMotherAppilication                  ${data_test}
    Execute Adb Shell                              input tap 450 800
    sleep                                          2s
    Execute Adb Shell                              input tap 450 1100
    sleep                                          2s
    Execute Adb Shell                              input tap 1000 700
    Execute Adb Shell                              input text 1
    sleep                                          2s
    Execute Adb Shell                              input tap 1000 750
    sleep                                          2s
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               80                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.view.View[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']

InformationFatherAppilication
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_FATHERNAME_FIRST}                                                                                                                                                                                                                                  ${data_test['InsuredInformation']['FatherName']}
    WaitAndInput                                   ${TXT_INSURED_FATHERNAME_LAST}                                                                                                                                                                                                                                   ${data_test['InsuredInformation']['FatherLastname']}
    sleep                                          2s
    Run Keyword If                                 '${data_test['InsuredInformation']['FatherAlive']}' == 'Y'                                                                                                                                                                                                       WaitAndClick                                                                             xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[1]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${DDL_TITLE_FATHER}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[1]

InformationMotherAppilication
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${DDL_TITLE_MOTHER}
    WaitAndClick                                   ${DDL_TITLE_MISS_MOBILE}
    WaitAndInput                                   ${TXT_INSURED_MOTHERNAME_FIRST}                                                                                                                                                                                                                                  ${data_test['InsuredInformation']['MotherName']}
    WaitAndInput                                   ${TXT_INSURED_MOTHERNAME_LAST}                                                                                                                                                                                                                                   ${data_test['InsuredInformation']['MotherLastname']}
    Run Keyword If                                 '${data_test['InsuredInformation']['MotherAlive']}' == 'Y'                                                                                                                                                                                                       WaitAndClick                                                                             ${RDO_MOTHER_ALIVE_MOBILE['${ENV}']}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                                             ${RDO_MOTHER_NOT_ALIVE_MOBILE['${ENV}']}

PayerInformationMobileSimulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION1['${ENV}']}
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}
    WaitAndClick                                   ${TXT_SUBSECTION2['${ENV}']}
    WaitAndClick                                   ${DDL_RELATION_MOBILE['${ENV}']}
    SelectRelationshipPayer
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   SelectDocPayer
    InputPayerIdAndLaser                           ${data_test}
    SelectPayerExpiredateSimulator                 ${data_test}
    InputPayerInfo                                 ${data_test}
    SelectPayerBirthdaySimulator                   ${data_test}
    SelectPayerNation
    WaitAndClick                                   ${Path}/android.view.View[5]/android.view.View/android.view.View[1]
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   WaitAndClick                                                                             xpath=//android.view.View[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   AppiumLibrary.Swipe By Percent                                                           90                                                                                                                                                                                                                  60                                                                                               90                0
    WaitAndInput                                   ${TXT_PAYER_MOBILENO}                                                                                                                                                                                                                                            0894444835
    WaitAndInput                                   ${TXT_PAYER_EMAIL}                                                                                                                                                                                                                                               niran.loe@tokiomarinelife.co.th
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   WaitAndClick                                                                             xpath=//android.view.View[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   AppiumLibrary.Swipe By Percent                                                           90                                                                                                                                                                                                                  50                                                                                               90                0
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   AppiumLibrary.Swipe By Percent                                                           90                                                                                                                                                                                                                  60                                                                                               90                0
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} < 16                                                                                                                                                                                                                   Execute Adb Shell                                                                        input tap 1400 650
    sleep                                          5s
    AppiumLibrary.Capture Page Screenshot
    WaitAndClick                                   xpath=//android.widget.Button[@resource-id='Payer_Occupation1_Occupation']
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.memo:id/occ_edittext_search']                                                                                                                                                            ${data_test['PayerInformation']['Occupation']}
    WaitAndClick                                   xpath=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.memo:id/agm_list_item_code']
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}

PolicyMobileSimulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION3['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View[3]/android.view.View[2]/android.view.View[1]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.view.View[4]/android.view.View[2]
    Execute Adb Shell                              input tap 1000 1000
    WaitAndClick                                   xpath=//android.widget.TextView[@text='10EN10']
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.view.View[13]/android.widget.EditText
    Execute Adb Shell                              input text 100000
    Execute Adb Shell                              input tap 1300 1350
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                                                       90                                                                                                                                                                                                                  0
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Dividend_BankAccountHolderName']                                                                                                                                                                                   ${data_test['PayerInformation']['Name']} ${data_test['PayerInformation']['Lastname']}
    SelectPayerBank                                ${data_test}
    WaitAndClick                                   ${TXT_SECTION3['${ENV}']}

QuestionnaireMobileSimulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}
    WaitAndClick                                   xpath=//android.webkit.WebView/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View[4]/android.view.View[2]/android.view.View[1]
    WaitAndClick                                   ${Path}/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[5]/android.view.View/android.view.View[2]/android.view.View[2]
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                                                       90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndInput                                   ${Path}/android.view.View[4]/android.view.View/android.widget.EditText[1]                                                                                                                                                                                        ${data_test['Weight']}
    WaitAndInput                                   ${Path}/android.view.View[4]/android.view.View/android.widget.EditText[2]                                                                                                                                                                                        ${data_test['Hight']}
    WaitAndClick                                   ${Path}/android.view.View[5]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[6]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${Path}/android.view.View[7]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}

QuestionnaireMobile2Simulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View[5]/android.view.View[2]/android.view.View[1]
    FOR                                            ${i}                                                                                                                                                                                                                                                             IN RANGE                                                                                 8
    Execute Adb Shell                              input swipe 1800 500 1800 0
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.widget.ListView[2]/android.view.View
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[2]/android.view.View/android.widget.ListView[2]/android.view.View
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.widget.ListView[2]/android.view.View
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.widget.ListView[2]/android.view.View
    END
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}

QuestionnaireTaxMobileSimulator
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View[6]/android.view.View[2]/android.view.View
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View[1]
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}

InputPayerIdAndLaser
    [Arguments]                                    ${data_test}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.view.View/android.app.Dialog
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1300 700
    WaitAndInput                                   ${TXT_PAYER_IDNO}                                                                                                                                                                                                                                                ${data_test['PayerInformation']['Id']}
    WaitAndInput                                   ${TXT_PAYER_LASERCODE}                                                                                                                                                                                                                                           ${data_test['PayerInformation']['LaserCode']}

InputPayerInfo
    [Arguments]                                    ${data_test}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              xpath=//android.view.View/android.app.Dialog
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1300 700
    WaitAndClick                                   ${DDL_PAYER_TITLE_MOBILE['${ENV}']}
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[2]
    WaitAndInput                                   ${TXT_PAYER_THNAME_FIRST}                                                                                                                                                                                                                                        ${data_test['PayerInformation']['Name']}
    WaitAndInput                                   ${TXT_PAYER_THNAME_LAST}                                                                                                                                                                                                                                         ${data_test['PayerInformation']['Lastname']}

SelectExpiredateApplicationSimulator
    [Arguments]                                    ${data_test}
    WaitAndTap                                     ${TXT_INSURED_EXPIRYDATE}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                          ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                                              6x                                                                                                                                                                                                                  ${timeout}                                                                                       WaitAndTap        ${TXT_INSURED_EXPIRYDATE}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                                                      False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 2
    SelectYearExpiredateSimulator
    END
    Execute Adb Shell                              input tap 1500 950

SelectYearExpiredateSimulator
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            WaitAndTap                                                                               //android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[2]
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input swipe 1500 1350 1500 1200

SelectBirthdayApplicationSimulator
    [Arguments]                                    ${data_test}
    ${age}                                         Set Variable                                                                                                                                                                                                                                                     ${data_test['InsuredInformation']['Age']}
    WaitAndTap                                     ${TXT_INSURED_BIRTHDAY}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                                              ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                           ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                                              6x                                                                                                                                                                                                                  ${timeout}                                                                                       WaitAndTap        ${TXT_INSURED_BIRTHDAY}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                                                      False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 ${age}
    SelectYearBirthdaySimulator
    END
    Execute Adb Shell                              input tap 1500 950

SelectYearBirthdaySimulator
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            Execute Adb Shell                                                                        input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               sleep                                                                                    1s
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                                        input tap 1500 1100

SelectPayerExpiredateSimulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_IdExpiryDate']
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 2
    SelectYearExpiredateSimulator
    END
    Execute Adb Shell                              input tap 1500 950

SelectPayerBirthdaySimulator
    [Arguments]                                    ${data_test}
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_BirthDate']
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                                                 2
    SelectYearExpiredateSimulator
    END
    Execute Adb Shell                              input tap 1500 950

SelectStatusSimulator
    Execute Adb Shell                              input tap 1300 800
    WaitAndClick                                   ${DDL_STATUS_SINGLE['${ENV}']}

SelectNationSimulator
    Execute Adb Shell                              input tap 1300 750
    WaitAndClick                                   ${DDL_NATION_THAI['${ENV}']}

SelectPayerBank
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${Path}/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[1]
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Dividend_BankAccountNo']                                                                                                                                                                                           0987654321
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Dividend_BankBranch']                                                                                                                                                                                              เอกมัย
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='FirstName']                                                                                                                                                                                                        เอมา
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='LastName']                                                                                                                                                                                                         สวย
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Age']                                                                                                                                                                                                              60
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               10                                                                                       90                                                                                                                                                                                                                  0
    SelectBeneficiariesRelationship