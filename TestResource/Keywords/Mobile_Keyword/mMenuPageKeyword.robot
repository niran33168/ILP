*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SelectMenuMobile
    [Arguments]                ${data_test}
    IF                         '${ENV}' == 'android'            Tap With Positions                             100                                          ${123, 205}
    VerifyTextMenu
    ${menu}                    Convert To Lower Case            ${data_test['Menu']}
    IF                         '${menu}' == 'quotation'         MenuQuotation
    ...                        ELSE                             MenuApplication

VerifyTextMenu
    VerifyText                 ${MOBILE_TXT_MENU['${ENV}']}     ประกันชีวิต

MenuQuotation
    ${status}                  Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${TXT_TITLE_QUOTATION_MOBILE['${ENV}']}      ${timeout}
    IF                         '${status}' == 'True'            WaitAndClick                                   ${TXT_TITLE_QUOTATION_MOBILE['${ENV}']}

MenuApplication
    ${status}                  Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}    ${timeout}
    IF                         '${status}' == 'True'            WaitAndClick                                   ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    PopupApplication

PopupApplication
    ${status}                  Run Keyword And Return Status    Wait Until Page Does Not Contain Element       ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If             '${status}' == 'True'            Tap With Positions                             100                                          ${300, 185}
    ${status}                  Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If             '${status}' == 'True'            WaitAndClick                                   ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    ${status}                  Run Keyword And Return Status    Wait Until Page Does Not Contain Element       ${TXT_TITLE_APPLICATION_MOBILE['${ENV}']}
    Run Keyword If             '${status}' == 'True'            Tap With Positions                             100                                          ${1280, 829}
    Run Keyword If             '${ENV}' == 'ios'                Tap With Positions                             100                                          ${513, 392}
    Capture Page Screenshot
