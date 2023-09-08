*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
InputUsernameAndPassword
    [Arguments]         ${data_test}
    InputUsername       ${data_test}
    InputPassword       ${data_test}
    ClickButtonLogin
    ConfirmLogin
    SetupPin

InputUsername
    [Arguments]         ${data_test}
    WaitAndInput        ${TXT_USERNAME_MOBILE['${ENV}']}    ${data_test['Login']['Username']}

InputPassword
    [Arguments]         ${data_test}
    WaitAndInput        ${TXT_PASSWORD_MOBILE['${ENV}']}    ${data_test['Login']['Password']}

ClickButtonLogin
    WaitAndClick        ${BTN_LOGIN_MOBILE['${ENV}']}

ConfirmLogin
    WaitAndClick        ${BTN_CONFIRM_MOBILE['${ENV}']}
    ${status}           Run Keyword And Return Status       AppiumLibrary.Wait Until Element Is Visible    ${BTN_NUMBER_1['${ENV}']}
    IF                  '${status}' == 'False'              WaitAndClick                                   ${BTN_CONFIRM_MOBILE['${ENV}']}
#Dialog Confirrm
    IF                  '${ENV}' == 'android'               Execute Adb Shell                              input tap 1400 750
    ...                 ELSE                                Tap With Positions                             100                                ${585, 375}
    IF                  '${ENV}' == 'android'               WaitAndClick                                   ${FILE_PERMISSION['${ENV}']}       ${timeout}
