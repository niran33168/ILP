*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SelectMenuWeb
    [Arguments]       ${menu}
    ${menu}           Convert To Lower Case       ${menu}
    Run Keyword If    '${menu}' == 'quotation'    WaitUntilElementAndClick      ${BTN_QUOTATION}            ${timeout}
    ...               ELSE IF                     '${menu}' == 'application'    WaitUntilElementAndClick    ${BTN_APPLICATION}    ${timeout}