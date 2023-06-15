*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
LoginAndSetupPin
    [Arguments]                                    ${data_test}
    ${reset}                                       mGetDevices                                                                                                                                                                                                                                                      ${devicesName}[0]                                                ${JsonfilePath}
    Run Keyword If                                 '${reset}' == 'false' or '${reset}' == 'False'                                                                                                                                                                                                                   CheckReset                                                       ${data_test}
    ...                                            ELSE                                                                                                                                                                                                                                                             InputPasscode

CheckReset
    [Arguments]                                    ${data_test}
    CheckPermission
    VerifyAndLogin                                 ${data_test}
    SetupPin

EditData
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View[1]
    WaitAndClick                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[3]/android.view.View[4]/android.view.View[1]

ClickImportant
    WaitAndTap                                     ${TXT_IMPORTANTMOBILE['${ENV}']}
    Capture Page Screenshot

SelectDocMobile
    [Arguments]                                    ${data_test}
    Execute Adb Shell                              input tap 500 600
    Execute Adb Shell                              input swipe 2400 400 2400 1000
    # WaitAndClick                                   ${DDL_DOCMOBILE['${ENV}']}
    Run Keyword If                                 '${data_test['InsuredInformation']['CardType']}' == 'ID'                                                                                                                                                                                                         DocID
    ...                                            ELSE                                                                                                                                                                                                                                                             NonId
    Capture Page Screenshot

DocID
    Execute Adb Shell                              input tap 1000 550
    Execute Adb Shell                              input tap 1000 600

NonId
    Execute Adb Shell                              input tap 1000 550
    Execute Adb Shell                              input tap 1000 700

InputIdAndLaser
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_IDNO}                                                                                                                                                                                                                                              ${data_test['InsuredInformation']['Id']}
    WaitAndInput                                   ${TXT_INSURED_LASERCODE}                                                                                                                                                                                                                                         ${data_test['InsuredInformation']['LaserCode']}

SelectExpiredateApplication
    [Arguments]                                    ${data_test}
    WaitAndTap                                     ${TXT_INSURED_EXPIRYDATE}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                          ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                      6x                                                                                                                                                                                                                  10s                                                                                              WaitAndTap    ${TXT_INSURED_EXPIRYDATE}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                              False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         2
    SelectYearExpiredate
    END
    WaitAndClick                                   ${BTN_EXPIREDATEOK_MOBILE}

SelectYearExpiredate
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_EXPIREDATEOK_MOBILE}                                                                                                                                                                                                                                       ${timeout}
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            WaitAndTap                                                       //android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[2]
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                input swipe                                                                                                                                                                                                         1500                                                                                             1100          1500                         1200
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                input tap 1500 950

SelectBirthdayApplication
    [Arguments]                                    ${data_test}
    ${age}                                         Set Variable                                                                                                                                                                                                                                                     ${data_test['InsuredInformation']['Age']}
    WaitAndTap                                     ${TXT_INSURED_BIRTHDAY}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                           ${timeout}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           Wait Until Keyword Succeeds                                      6x                                                                                                                                                                                                                  10s                                                                                              WaitAndTap    ${TXT_INSURED_BIRTHDAY}
    ...                                            ELSE                                                                                                                                                                                                                                                             Log                                                              False
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         ${age}
    SelectYearBirthday
    END
    WaitAndClick                                   ${BTN_BIRTHDATEOK_MOBILE}
    Run Keyword If                                 ${age} >= 16                                                                                                                                                                                                                                                     AgeMoreThanEqual                                                 ${data_test}
    ...                                            ELSE                                                                                                                                                                                                                                                             AgeLess                                                          ${data_test}

SelectYearBirthday
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_BIRTHDATEOK_MOBILE}                                                                                                                                                                                                                                        ${timeout}
    Run Keyword If                                 '${ENV}' == 'android'                                                                                                                                                                                                                                            Execute Adb Shell                                                input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                input tap 1500 1100
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               Execute Adb Shell                                                input tap 1500 1100

SelectRelationship
    Execute Adb Shell                              input tap 1200 850
    Execute Adb Shell                              input tap 1200 550

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

CloseFrom
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View
    Execute Adb Shell                              input tap 1000 1300
    sleep                                          2s
    Execute Adb Shell                              input tap 1000 1300
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View
    Execute Adb Shell                              input tap 1300 1200
    sleep                                          2s
    Execute Adb Shell                              input tap 1300 1200
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View
    Execute Adb Shell                              input tap 1300 1550
    sleep                                          2s
    Execute Adb Shell                              input tap 1300 1550

SelectPayerNation
    WaitAndClick                                   ${DDL_PAYER_NATION['${ENV}']}
    sleep                                          5s
    Execute Adb Shell                              input tap 1000 500
    Run Keyword If                                 '${ENV}' == 'memo'                                                                                                                                                                                                                                               WaitAndClick                                                     ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[1]

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
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         5
    Execute Adb Shell                              input swipe 1500 400 1500 1600
    END
    ScrollDown1000
    Execute Adb Shell                              input tap 1000 550
    ScrollDown1000
    Execute Adb Shell                              input tap 1000 450
    Execute Adb Shell                              input tap 1000 550

ConfirmDOPA2
    WaitAndClick                                   xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView[10]
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         5
    Execute Adb Shell                              input swipe 1500 400 1500 1600
    END
    ScrollDown750
    Execute Adb Shell                              input tap 1000 550
    ScrollDown750
    Execute Adb Shell                              input tap 1000 450
    Execute Adb Shell                              input tap 1000 550

PopupApplication
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${TXT_POPUP_APPLICATION['${ENV}']}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Tap                                                ${TXT_POPUP_APPLICATION['${ENV}']}
    Execute Adb Shell                              input tap 1000 550
    Execute Adb Shell                              input tap 1000 600
    Execute Adb Shell                              input tap 1200 750
    Execute Adb Shell                              input tap 1200 800
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Element Text Should Be                             ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}                                                                                                                                                                           E-Application

CreateApplicationMobile
    [Arguments]                                    ${data_test}
    Execute Adb Shell                              input tap 1200 850
    # PopupApplication
    WaitAndClick                                   ${BTN_CREATE_APPLICATION_MOBILE['${ENV}']}
    sleep                                          2s
    Execute Adb Shell                              input tap 2200 350
    CloseFrom

CreateRequest
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${BTN_CREATE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Click Element                                      ${BTN_CREATE_APPLICATION_MOBILE['${ENV}']}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${TXT_LIFEMOBILE}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            AppiumLibrary.Click Element                                      ${TXT_LIFEMOBILE}

InsuredInformationMobile
    [Arguments]                                    ${data_test}
    ClickImportant
    SelectDocMobile                                ${data_test}
    InputIdAndLaser                                ${data_test}
    SelectExpiredateApplication                    ${data_test}
    SelectBirthdayApplication                      ${data_test}

PayerInformationMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION1['${ENV}']}
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}
    Execute Adb Shell                              input tap 300 800
    # # WaitAndClick                                   ${TXT_SUBSECTION2['${ENV}']}
    WaitAndClick                                   ${DDL_RELATION_MOBILE['${ENV}']}
    SelectRelationshipPayer
    sleep                                          2s
    WaitAndInput                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View/android.widget.EditText                                                                                                          ${data_test['PayerInformation']['Id']}
    WaitAndInput                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View[1]/android.widget.EditText                                                                                                       ${data_test['PayerInformation']['LaserCode']}
    WaitAndClick                                   ${DDL_PAYER_TITLE_MOBILE['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[1]/android.view.View/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[2]
    ExpiryDatePayer
    PayerName                                      ${data_test}
    BirthdayPayer
    SelectPayerNation
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                               90                                                                                                                                                                                                                  0
    WaitAndInput                                   ${TXT_PAYER_MOBILENO}                                                                                                                                                                                                                                            0894444835
    WaitAndInput                                   ${TXT_PAYER_EMAIL}                                                                                                                                                                                                                                               niran.loe@tokiomarinelife.co.th
    sleep                                          2s
    WaitAndClick                                   xpath=//android.widget.Button[@resource-id='Payer_Occupation1_Occupation']
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.ilp:id/occ_edittext_search']                                                                                                                                                             ${data_test['PayerInformation']['Occupation']}
    WaitAndClick                                   xpath=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/agm_list_item_code']
    WaitAndClick                                   ${TXT_SECTION2['${ENV}']}

ExpiryDatePayer
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      xpath=//android.view.View
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                input tap 1000 750
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_IdExpiryDate']
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${BTN_EXPIREDATEOK_MOBILE}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                      xpath=//android.widget.EditText[@resource-id='Payer_IdExpiryDate']
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_PAYER_EXPIREDATEOK_MOBILE}
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         2
    WaitAndTap                                     ${DDL_YEAR_PRE_MOBILE}
    END
    WaitAndClick                                   ${BTN_PAYER_EXPIREDATEOK_MOBILE}

PayerName
    [Arguments]                                    ${data_test}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[4]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[4]/android.view.View/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[2]
    WaitAndInput                                   ${TXT_PAYER_THNAME_FIRST}                                                                                                                                                                                                                                        ${data_test['PayerInformation']['Name']}
    WaitAndInput                                   ${TXT_PAYER_THNAME_LAST}                                                                                                                                                                                                                                         ${data_test['PayerInformation']['Lastname']}

BirthdayPayer
    WaitAndClick                                   xpath=//android.widget.EditText[@resource-id='Payer_BirthDate']
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      ${BTN_BIRTHDATEOK_MOBILE}
    Run Keyword If                                 '${status}' == 'False'                                                                                                                                                                                                                                           AppiumLibrary.Click Element                                      xpath=//android.widget.EditText[@resource-id='Payer_BirthDate']
    AppiumLibrary.Wait Until Element Is Visible    ${BTN_PAYER_BIRTHDATEOK_MOBILE}
    FOR                                            ${index}                                                                                                                                                                                                                                                         IN RANGE                                                         20
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button
    AppiumLibrary.Tap                              xpath=//android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button
    END
    WaitAndClick                                   ${BTN_PAYER_BIRTHDATEOK_MOBILE}

PolicyMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   xpath=//android.widget.TextView[@text='แบบประกัน']
    Execute Adb Shell                              input tap 200 800
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View[2]/android.widget.TextView[1]
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View[6]/android.view.View/android.widget.TextView
    WaitAndClick                                   xpath=//android.widget.TextView[@text='URP1']
    sleep                                          10s
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View/android.view.View[10]/android.widget.EditText
    Execute Adb Shell                              input text 13000
    Execute Adb Shell                              input tap 1300 300
    sleep                                          10s
    Execute Adb Shell                              input swipe 2400 1000 2400 200
    Execute Adb Shell                              input tap 900 650
    Execute Adb Shell                              input tap 900 700
    Execute Adb Shell                              input tap 1000 850
    Execute Adb Shell                              input tap 1000 650
    WaitAndInput                                   xpath=//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.EditText[1]                                                                AAAA
    WaitAndInput                                   xpath=//android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.EditText[2]                                                                BBBB
    Execute Adb Shell                              input tap 1800 1000
    Execute Adb Shell                              input text 60
    Execute Adb Shell                              input tap 1200 1150
    sleep                                          5s
    Capture Page Screenshot
    WaitAndClick                                   xpath=//android.widget.TextView[@text='แบบประกัน']

QuestionnaireMobile
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}
    Execute Adb Shell                              input tap 300 1200
    Execute Adb Shell                              input swipe 2400 400 2400 1500
    Execute Adb Shell                              input swipe 2400 400 2400 1500
    sleep                                          5s
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                     ${timeout}
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                     ${timeout}
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                     ${timeout}
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[4]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                     ${timeout}
    WaitAndClick                                   xpath=//android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                     ${timeout}
    Execute Adb Shell                              input swipe 2400 600 2400 0
    AppiumLibrary.Wait Until Element Is Visible    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                                       ${timeout}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[5]/android.view.View/android.view.View/android.widget.TextView[2]                                                                                                       ${timeout}
    Execute Adb Shell                              input tap 1200 900
    Execute Adb Shell                              input tap 1400 950
    # AppiumLibrary.Wait Until Element Is Visible    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[6]/android.view.View/android.view.View/android.widget.TextView[2]    ${timeout}
    # WaitAndClick    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[6]/android.view.View/android.view.View/android.widget.TextView[2]    ${timeout}
    # AppiumLibrary.Wait Until Element Is Visible    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[7]/android.view.View/android.widget.EditText[1]    ${timeout}
    # WaitAndClick    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[7]/android.view.View/android.widget.EditText[1]    ${timeout}
    Execute Adb Shell                              input tap 1000 1100
    Execute Adb Shell                              input text 60
    sleep                                          3s
    # AppiumLibrary.Wait Until Element Is Visible    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[7]/android.view.View/android.widget.EditText[2]    ${timeout}
    # WaitAndClick    xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[7]/android.view.View/android.widget.EditText[2]    ${timeout}
    Execute Adb Shell                              input tap 1800 400
    sleep                                          3s
    Execute Adb Shell                              input text 179
    Execute Adb Shell                              input tap 1300 940
    Execute Adb Shell                              input tap 1300 950
    Execute Adb Shell                              input tap 1300 630
    Execute Adb Shell                              input tap 1300 1150
    Execute Adb Shell                              input tap 1300 1160
    sleep                                          3s
    WaitAndClick                                   ${TXT_SECTION4['${ENV}']}

QuestionnaireMobile2
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}
    Execute Adb Shell                              input tap 300 1300
    Execute Adb Shell                              input swipe 2400 400 2400 1500
    Execute Adb Shell                              input swipe 2400 1000 2400 0
    Execute Adb Shell                              input tap 1600 1050
    Execute Adb Shell                              input tap 1600 1060
    Execute Adb Shell                              input tap 1600 1070
    sleep    2s

    Execute Adb Shell                              input swipe 2400 1000 2400 0
    Execute Adb Shell                              input tap 1600 800
    Execute Adb Shell                              input tap 1600 810
    Execute Adb Shell                              input tap 1600 820
    sleep    2s

    Execute Adb Shell                              input swipe 2400 600 2400 0
    Execute Adb Shell                              input tap 1600 620
    Execute Adb Shell                              input tap 1600 740
    Execute Adb Shell                              input tap 1600 750
    sleep    2s

    Execute Adb Shell                              input tap 1250 1050
    Execute Adb Shell                              input tap 1250 1150
    Execute Adb Shell                              input tap 1250 1160
    sleep    2s

    Execute Adb Shell                              input tap 1250 1320
    Execute Adb Shell                              input tap 1250 1440
    Execute Adb Shell                              input tap 1250 1450
    sleep    2s

    Execute Adb Shell                              input swipe 2400 1000 2400 0
    Execute Adb Shell                              input tap 1600 1050
    Execute Adb Shell                              input tap 1600 1100
    Execute Adb Shell                              input tap 1600 1150
    sleep    2s
    Capture Page Screenshot
    WaitAndClick                                   ${TXT_SECTION5['${ENV}']}

QuestionnaireTaxMobile
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[6]/android.view.View[2]/android.widget.TextView
    Execute Adb Shell                              input tap 1500 640
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                                   ${TXT_SECTION6['${ENV}']}

UnitHolder
    Execute Adb Shell                              input swipe 500 500 500 0
    WaitAndClick                                   ${TXT_SECTION7['${ENV}']}
    Execute Adb Shell                              input tap 200 1000
    Execute Adb Shell                              input tap 200 1000
    Execute Adb Shell                              input swipe 2400 400 2400 1600
    WaitAndInput                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.widget.EditText[1]                                                                                                                         AAAAAAAAAA
    WaitAndInput                                   xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[1]/android.view.View/android.widget.EditText[2]                                                                                                                         QA
    WaitAndTap                                     xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    SelectItemFirst
    WaitAndTap                                     xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    SelectDropDownUnit
    SelectDropDownUnit
    SelectDropDownUnit
    SelectDropDownUnit
    SelectDropDownUnit
    SelectDropDownUnit
    Execute Adb Shell                              input tap 1000 750
    Execute Adb Shell                              input tap 1800 750
    Execute Adb Shell                              input tap 1000 900

    Execute Adb Shell                              input tap 1000 1520
    SelectItemFirst
    # WaitAndTap                                     xpath=//android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[10]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    Execute Adb Shell                              input tap 1000 750
    sleep                                          2s
    Execute Adb Shell                              input tap 1000 1350
    Execute Adb Shell                              input text 500000

    Execute Adb Shell                              input tap 1000 750
    SelectItemFirst

    Execute Adb Shell                              input tap 1000 620
    Execute Adb Shell                              input text AAAA%sBBBB

    Execute Adb Shell                              input tap 1000 850
    sleep                                          5s
    Capture Page Screenshot
    WaitAndClick                                   ${TXT_SECTION7['${ENV}']}

SelectDropDownUnit
    Execute Adb Shell                              input tap 1000 600
    Execute Adb Shell                              input tap 1000 500
    sleep                                          5s

SelectItemFirst
    Execute Adb Shell                              input tap 1000 500
    sleep                                          5s

SelectNation
    # WaitAndClick                                   ${DDL_NATION['${ENV}']}
    # WaitAndClick                                   ${DDL_NATION_THAI['${ENV}']}

SelectStatus
    WaitAndClick                                   ${DDL_STATUS['${ENV}']}
    WaitAndClick                                   ${DDL_STATUS_SINGLE['${ENV}']}

InputAddress
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_POSTCODE_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['Postcode']}
    WaitAndTap                                     ${TXT_SELECT_POSTCODE['${ENV}']}

AgeMoreThanEqual
    [Arguments]                                    ${data_test}
    InputInsureName                                ${data_test}
    WaitAndTap                                     xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.view.View[4]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView
    Execute Adb Shell                              input tap 1000 500
    sleep                                          5s
    Execute Adb Shell                              input tap 1000 1000
    Execute Adb Shell                              input tap 1000 500
    Execute Adb Shell                              input tap 1000 900
    Execute Adb Shell                              input tap 1000 500

    InputAddress                                   ${data_test}
    WaitAndInput                                   ${TXT_INSURED_MOBILENO_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['MobileNo']}
    WaitAndInput                                   ${TXT_INSURED_EMAIL_MOBILE['${ENV}']}                                                                                                                                                                                                                            ${data_test['InsuredInformation']['Email']}
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                               90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.widget.TextView[@text='คัดลอกจากที่อยู่ตามทะเบียนบ้านผู้ขอเอาประกัน']
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               80                                                               90                                                                                                                                                                                                                  0
    Run Keyword If                                 '${data_test['Contract']}' == '1'                                                                                                                                                                                                                                WaitAndClick                                                     xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[1]
    ...                                            ELSE IF                                                                                                                                                                                                                                                          '${data_test['Contract']}' == '2'                                WaitAndClick                                                                                                                                                                                                        xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[2]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                     xpath=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[3]
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               60                                                               90                                                                                                                                                                                                                  0
    AppiumLibrary.Click Element                    xpath=//android.widget.Button[@resource-id='Insured_Occupation1_Occupation']
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                                                                ${data_test['InsuredInformation']['Occupation']}
    AppiumLibrary.Click Element                    ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}

    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Occupation1_Income']                                                                                                                                                                                       ${data_test['InsuredInformation']['AnnualIncome']}
    WaitAndClick                                   xpath=//android.view.View[@resource-id='Insured_MotorcycleFlag']/android.widget.TextView[2]
    sleep                                          5s
    Capture Page Screenshot

AgeLess
    [Arguments]                                    ${data_test}
    ApplicationKeyword.Education                   ${data_test}
    InformationFather                              ${data_test}
    InformationMother                              ${data_test}
    InputAddress                                   ${data_test}

### Simulator ###
ConditionalFlow
    [Arguments]                                    ${data_test}
    Run Keyword If                                 ${data_test['InsuredInformation']['Age']} >= 16                                                                                                                                                                                                                  MorethanOrEqual                                                  ${data_test}
    ...                                            ELSE                                                                                                                                                                                                                                                             Lessthan                                                         ${data_test}

MorethanOrEqual
    [Arguments]                                    ${data_test}
    SelectStatusSimulator
    InputAddress                                   ${data_test}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                               90                                                                                                                                                                                                                  0
    WaitAndInput                                   ${TXT_INSURED_MOBILENO_MOBILE['${ENV}']}                                                                                                                                                                                                                         ${data_test['InsuredInformation']['MobileNo']}
    WaitAndInput                                   ${TXT_INSURED_EMAIL_MOBILE['${ENV}']}                                                                                                                                                                                                                            ${data_test['InsuredInformation']['Email']}
    WaitAndClick                                   ${BTN_CURRENT_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                               90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${BTN_WORK_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               70                                                               90                                                                                                                                                                                                                  0
    Run Keyword If                                 '${data_test['InsuredInformation']['Contact']}' == 'current'                                                                                                                                                                                                     WaitAndClick                                                     ${TXT_CURRENT_ADDRESS['${ENV}']}
    ...                                            ELSE IF                                                                                                                                                                                                                                                          '${data_test['InsuredInformation']['Contact']}' == 'register'    WaitAndClick                                                                                                                                                                                                        ${TXT_REGISTER_ADDRESS['${ENV}']}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                     ${TXT_BUSINESS_ADDRESS['${ENV}']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               50                                                               90                                                                                                                                                                                                                  0
    AppiumLibrary.Click Element                    xpath=//android.widget.Button[@resource-id='Insured_Occupation1_Occupation']
    WaitAndInput                                   ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                                                                ${data_test['InsuredInformation']['Occupation']}
    WaitAndClick                                   ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Insured_Occupation1_Income']                                                                                                                                                                                       ${data_test['InsuredInformation']['AnnualIncome']}
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               50                                                               90                                                                                                                                                                                                                  0
    WaitAndClick                                   ${BTN_INSURED_MOTORCYCLE['${ENV}']}
    Execute Adb Shell                              input tap 1200 700

Lessthan
    [Arguments]                                    ${data_test}
    Run Keyword If                                 '${data_test['InsuredInformation']['Education']}' == 'Y'                                                                                                                                                                                                         WaitAndClick                                                     xpath=//android.view.View[@resource-id='Insured_IsStudent']/android.view.View[1]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                     xpath=//android.view.View[@resource-id='Insured_IsStudent']/android.view.View[2]
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      xpath=//android.widget.EditText[@resource-id='Insured_StudyYear']                                                                                                                                                   ${timeout}
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Run Keywords                                                     WaitAndInput                                                                                                                                                                                                        xpath=//android.widget.EditText[@resource-id='Insured_StudyYear']                                1
    ...                                            AND                                                                                                                                                                                                                                                              WaitAndInput                                                     xpath=//android.widget.EditText[@resource-id='Insured_SchoolName']                                                                                                                                                  AutomateSchool
    ...                                            AND                                                                                                                                                                                                                                                              AppiumLibrary.Swipe By Percent                                   90                                                                                                                                                                                                                  50                                                                                               90            0
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
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               80                                                               90                                                                                                                                                                                                                  0
    WaitAndClick                                   xpath=//android.view.View[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']

InformationFatherAppilication
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_INSURED_FATHERNAME_FIRST}                                                                                                                                                                                                                                  ${data_test['InsuredInformation']['FatherName']}
    WaitAndInput                                   ${TXT_INSURED_FATHERNAME_LAST}                                                                                                                                                                                                                                   ${data_test['InsuredInformation']['FatherLastname']}
    sleep                                          2s
    Run Keyword If                                 '${data_test['InsuredInformation']['FatherAlive']}' == 'Y'                                                                                                                                                                                                       WaitAndClick                                                     xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[1]
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                     xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[2]
    WaitAndClick                                   ${DDL_TITLE_FATHER}
    WaitAndClick                                   xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[1]

InformationMotherAppilication
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${DDL_TITLE_MOTHER}
    WaitAndClick                                   ${DDL_TITLE_MISS_MOBILE}
    WaitAndInput                                   ${TXT_INSURED_MOTHERNAME_FIRST}                                                                                                                                                                                                                                  ${data_test['InsuredInformation']['MotherName']}
    WaitAndInput                                   ${TXT_INSURED_MOTHERNAME_LAST}                                                                                                                                                                                                                                   ${data_test['InsuredInformation']['MotherLastname']}
    Run Keyword If                                 '${data_test['InsuredInformation']['MotherAlive']}' == 'Y'                                                                                                                                                                                                       WaitAndClick                                                     ${RDO_MOTHER_ALIVE_MOBILE['${ENV}']}
    ...                                            ELSE                                                                                                                                                                                                                                                             WaitAndClick                                                     ${RDO_MOTHER_NOT_ALIVE_MOBILE['${ENV}']}

InputPayerIdAndLaser
    [Arguments]                                    ${data_test}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      xpath=//android.view.View/android.app.Dialog
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                input tap 1300 700
    WaitAndInput                                   ${TXT_PAYER_IDNO}                                                                                                                                                                                                                                                ${data_test['PayerInformation']['Id']}
    WaitAndInput                                   ${TXT_PAYER_LASERCODE}                                                                                                                                                                                                                                           ${data_test['PayerInformation']['LaserCode']}

InputPayerInfo
    [Arguments]                                    ${data_test}
    ${status}                                      Run Keyword And Return Status                                                                                                                                                                                                                                    AppiumLibrary.Wait Until Element Is Visible                      xpath=//android.view.View/android.app.Dialog
    Run Keyword If                                 '${status}' == 'True'                                                                                                                                                                                                                                            Execute Adb Shell                                                input tap 1300 700
    WaitAndClick                                   ${DDL_PAYER_TITLE_MOBILE['${ENV}']}
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[2]
    WaitAndInput                                   ${TXT_PAYER_THNAME_FIRST}                                                                                                                                                                                                                                        ${data_test['PayerInformation']['Name']}
    WaitAndInput                                   ${TXT_PAYER_THNAME_LAST}                                                                                                                                                                                                                                         ${data_test['PayerInformation']['Lastname']}

SelectPayerBank
    [Arguments]                                    ${data_test}
    WaitAndClick                                   ${Path}/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[1]
    WaitAndClick                                   ${Path}/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[2]/android.widget.ListView/android.view.View[1]
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Dividend_BankAccountNo']                                                                                                                                                                                           0987654321
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Dividend_BankBranch']                                                                                                                                                                                              เอกมัย
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='FirstName']                                                                                                                                                                                                        เอมา
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='LastName']                                                                                                                                                                                                         สวย
    WaitAndInput                                   xpath=//android.widget.EditText[@resource-id='Age']                                                                                                                                                                                                              60
    AppiumLibrary.Swipe By Percent                 90                                                                                                                                                                                                                                                               10                                                               90                                                                                                                                                                                                                  0
    SelectBeneficiariesRelationship