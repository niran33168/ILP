*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
OpenTestApplication
    AppiumLibrary.Open Application                 http://localhost:4723/wd/hub          platformName=${ANDROID_PLATFORMNAME}           platformVersion=${ANDROID_PLATFORMVERSION}      deviceName=${deviceName}[0]    app=/Users/niran.ler/Desktop/FastTrack/app/V4_02_002.apk    appPackage=${AppPackage['ENV']}    appActivity=${AppActivity}
    ...                                            noReset=false                         unicodeKeyboard=true                           automationName=UiAutomator2

CheckPermission
    WaitAndClick                                   ${PICTURE_PERMISSION['${ENV}']}       ${timeout}
    WaitAndClick                                   ${LOCATION_PERMISSION['${ENV}']}      ${timeout}
    WaitAndClick                                   ${PHOTO_PERMISSION['${ENV}']}         ${timeout}

VerifyLandingpage
    AppiumLibrary.Wait Until Element Is Visible    ${MOBILE_TXT_DISCLAIMER['${ENV}']}    60s
    VerifyText                                     ${MOBILE_TXT_DISCLAIMER['${ENV}']}    Disclaimer
    WaitAndClick                                   ${BTN_OK_MOBILE['${ENV}']}

LoginSystemMobile
    [Arguments]                                    ${data_test}
    WaitAndInput                                   ${TXT_USERNAME_MOBILE['${ENV}']}      ${data_test['Login']['Username']}
    WaitAndInput                                   ${TXT_PASSWORD_MOBILE['${ENV}']}      ${data_test['Login']['Password']}
    WaitAndClick                                   ${BTN_LOGIN_MOBILE['${ENV}']}

SetupPin
    FOR                                            ${index}                              IN RANGE                                       2
    InputPasscode
    ClickButtonOK
    END
    WaitAndClick                                   ${FILE_PERMISSION['${ENV}']}          ${timeout}

ConfirmLoginSimulator
    ${status}                                      Run Keyword And Return Status         AppiumLibrary.Wait Until Element Is Visible    xpath=//android.view.View/android.app.Dialog
    Execute Adb Shell                              input tap 1400 750

ConfirmLogin
    WaitAndClick                                   ${BTN_CONFIRM_MOBILE['${ENV}']}
    ${status}                                      Run Keyword And Return Status         AppiumLibrary.Wait Until Element Is Visible    ${BTN_NUMBER_1['${ENV}']}
    Run Keyword If                                 '${status}' == 'False'                WaitAndClick                                   ${BTN_CONFIRM_MOBILE['${ENV}']}
    Execute Adb Shell                              input tap 1400 750
    WaitAndClick                                   ${FILE_PERMISSION['${ENV}']}          ${timeout}

InputPasscode
    FOR                                            ${index}                              IN RANGE                                       6
    WaitAndClick                                   ${BTN_NUMBER_1['${ENV}']}
    END

ClickButtonOK
    WaitAndClick                                   ${BTN_OK_PASSCODE['${ENV}']}

OpenAppFasttrack
    OpenTestApplication
    CheckPermission

VerifyAndLogin
    [Arguments]                                    ${data_test}
    VerifyLandingpage
    LoginSystemMobile                              ${data_test}
    ConfirmLogin

SelectMenuMobile
    [Arguments]                                    ${data_test}
    Execute Adb Shell                              input tap 200 200
    ${menu}                                        Convert To Lower Case                 ${data_test['Menu']}
    Run Keyword If                                 '${menu}' == 'quotation'              MenuQuotation
    ...                                            ELSE                                  MenuApplication

MenuQuotation
    ${status}                                      Run Keyword And Return Status         AppiumLibrary.Wait Until Element Is Visible    ${TXT_TITLE_QUOTATION_MOBILE['${ENV}']}         ${timeout}
    Run Keyword If                                 '${status}' == 'True'                 WaitAndClick                                   ${TXT_TITLE_QUOTATION_MOBILE['${ENV}']}

MenuApplication
    ${status}                                      Run Keyword And Return Status         AppiumLibrary.Wait Until Element Is Visible    ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}       ${timeout}
    Run Keyword If                                 '${status}' == 'True'                 WaitAndClick                                   ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}