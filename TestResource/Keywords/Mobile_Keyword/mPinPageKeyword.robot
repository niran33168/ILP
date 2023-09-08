*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SetupPin
    FOR                              ${index}                        IN RANGE        2
    Wait until Element Is Visible    ${BTN_OK_PASSCODE['${ENV}']}
    InputPasscode
    WaitAndClick                     ${BTN_OK_PASSCODE['${ENV}']}
    END
    IF                               '${ENV}' == 'android'           WaitAndClick    ${FILE_PERMISSION['${ENV}']}    ${timeout}

InputPasscode
    FOR                              ${index}                        IN RANGE        6
    WaitAndClick                     ${BTN_NUMBER_1['${ENV}']}
    END
