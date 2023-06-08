*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
OpenBrowserWeb
    [Arguments]                 ${URL}                         ${Browser}
    Set Selenium Speed          0.5 seconds
    Open Browser                ${URL}                         ${Browser}
    Maximize Browser Window

LandingPage
    VerifyTextDisclaimer
    WaitUntilElementAndClick    ${BTN_HOMEOK}

LoginSystem
    [Arguments]                 ${data_test}
    WaitUntilElementAndInput    ${TXT_USERNAME}                ${data_test['Username']}
    WaitUntilElementAndInput    ${TXT_PASSWORD}                ${data_test['Password']}
    WaitUntilElementAndClick    ${BTN_LOGIN}
    Run Keyword If              '${BROWSER}' == '${SAFARI}'    WaitUntilElementPopupAndClick    ${BTN_POPUPOK}
    ...                         ELSE                           WaitUntilElementPopupAndClick    ${BTN_ALERT}

VerifyTextDisclaimer
    ${value1}                   Selenium2Library.Get Text      ${TXT_DISCLAIMER}
    Should Be Equal             ${DISCLAIMER}                  ${value1}

OpenAndLogin
    [Arguments]                 ${URL}                         ${Browser}                       ${data_test}
    OpenBrowserWeb              ${URL}                         ${Browser}
    LandingPage
    LoginSystem                 ${data_test}