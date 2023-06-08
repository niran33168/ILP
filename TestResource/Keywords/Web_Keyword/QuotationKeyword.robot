*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
ClickCreateQuotation
    Selenium2Library.Wait Until Element Is Visible    ${BTN_CREATE_QUOTATION}                                                        ${timeout}
    WaitUntilElementAndClick                          ${BTN_CREATE_QUOTATION}                                                        ${timeout}

QuotationAction
    [Arguments]                                       ${action}                                                                      ${data_test}
    Run Keyword If                                    '${action}' == 'add'                                                           NewQuotation                                      ${data_test}
    ...                                               ELSE IF                                                                        '${action}' == 'edit'                             EditInformationQuotation    ${data_test}
    ...                                               ELSE                                                                           DeleteQuotation

NewQuotation
    [Arguments]                                       ${data_test}
    ClickCreateQuotation
    InputDetailInsurance                              ${data_test}
    SelectGender                                      ${data_test}
    InputAge                                          ${data_test}
    SelectOccupation                                  ${data_test}
    NextStep
    CheckAgeForNextStep                               ${data_test}
    # SendEmail

EditInformationQuotation
    [Arguments]                                       ${data_test}
    SearchAndSelect                                   ${data_test}
    InputDetailInsurance                              ${data_test}
    SelectGender                                      ${data_test}
    FOR                                               ${index}                                                                       IN RANGE                                          3
    Press Keys                                        ${TXT_AGE}                                                                     BACKSPACE
    END
    InputAge                                          ${data_test}
    SelectOccupation                                  ${data_test}
    NextStep
    CheckAgeForNextStep                               ${data_test}

DeleteQuotation
    DeleteAndSelect

InputDetailInsurance
    [Arguments]                                       ${data_test}
    WaitUntilElementAndInput                          ${TXT_NAME}                                                                    ${data_test['Firstname1']}
    WaitUntilElementAndInput                          ${TXT_LASTNAME}                                                                ${data_test['Lastname1']}

SelectGender
    [Arguments]                                       ${data_test}
    Run Keyword If                                    '${data_test['Gender']}' == 'M'                                                Wait Until Keyword Succeeds                       3x                          5s              Selenium2Library.Click Element    ${RDO_MALE}
    ...                                               ELSE                                                                           Wait Until Keyword Succeeds                       3x                          5s              Selenium2Library.Click Element    ${RDO_FEMALE}

InputAge
    [Arguments]                                       ${data_test}
    WaitUntilElementAndInput                          ${TXT_AGE}                                                                     ${data_test['Age']}

SelectOccupation
    [Arguments]                                       ${data_test}
    WaitUntilElementAndClick                          ${DDL_OCCUPTION}
    WaitUntilElementAndInput                          ${TXT_OCCUPTION}                                                               ${data_test['Occupation']}
    WaitUntilElementAndClick                          ${DDL_SELCET_OCCUPTION}

InputDetailInsurance2
    [Arguments]                                       ${data_test}
    WaitUntilElementAndInput                          ${TXT_NAME2}                                                                   ${data_test['Firstname2']}
    WaitUntilElementAndInput                          ${TXT_LASTNAME2}                                                               ${data_test['Lastname2']}

SelectGender2
    [Arguments]                                       ${data_test}
    Run Keyword If                                    '${data_test['Gender2']}' == 'M'                                               Wait Until Keyword Succeeds                       3x                          5s              Selenium2Library.Click Element    ${RDO_MALE2}
    ...                                               ELSE                                                                           Wait Until Keyword Succeeds                       3x                          5s              Selenium2Library.Click Element    ${RDO_FEMALE2}

InputAge2
    [Arguments]                                       ${data_test}
    WaitUntilElementAndInput                          ${TXT_AGE2}                                                                    ${data_test['Age2']}

SelectOccupation2
    [Arguments]                                       ${data_test}
    WaitUntilElementAndClick                          ${DDL_OCCUPTION2}
    WaitUntilElementAndInput                          ${TXT_OCCUPTION2}                                                              ${data_test['Occupation2']}
    WaitUntilElementAndClick                          ${DDL_SELCET_OCCUPTION2}

NextStep
    Run Keyword If                                    '${BROWSER}' == '${SAFARI}'                                                    Execute Javascript                                window.scrollTo(0, 600);
    WaitUntilElementAndClick                          ${BTN_NEXT}

CheckAgeForNextStep
    [Arguments]                                       ${data_test}
    Run Keyword If                                    ${data_test['Age']} >= 16                                                      Standard                                          ${data_test}
    ...                                               ELSE                                                                           NoneStandard                                      ${data_test}

Standard
    [Arguments]                                       ${data_test}
    SelectContact                                     ${data_test}
    SelectBasicList                                   ${data_test}
    NextStep
    SummaryDocument
    DownloadDocument
    OpenDocument
    Close Browser

NoneStandard
    [Arguments]                                       ${data_test}
    InputDetailInsurance2                             ${data_test}
    SelectGender2                                     ${data_test}
    InputAge2                                         ${data_test}
    SelectOccupation2                                 ${data_test}
    NextStep
    SelectContact                                     ${data_test}
    SelectBasicList                                   ${data_test}
    NextStep
    SummaryDocument
    DownloadDocument
    OpenDocument
    Close Browser

SelectContact
    [Arguments]                                       ${data_test}
    WaitUntilElementAndClick                          ${DDL_CONTRACT}
    Select From List By Label                         ${DDL_CONTRACT}                                                                ${data_test['Contract']}

SelectBasicList
    [Arguments]                                       ${data_test}
    WaitUntilElementAndClick                          ${DDL_BASICLIST}
    WaitUntilElementAndInput                          ${TXT_BASICLIST}                                                               ${data_test['Basiclist']}
    WaitUntilElementAndClick                          ${DDL_FILTER}
    WaitUntilElementAndClick                          xpath=//div[contains(text(),'${data_test['SelectBasiclist']}')]/../../..//a
    WaitUntilElementAndInput                          ${TXT_SUMINSURED}                                                              ${data_test['Suminsured']}
    Press Keys                                        NONE                                                                           TAB

SummaryDocument
    WaitUntilElementAndClick                          ${BTN_SUMMARY}
    VerifyTextSelectDocument

OpenDocument
    WaitUntilElementAndClick                          ${BTN_OPEN_DOCUMENT}                                                           ${timeout}
    sleep                                             30s
    Close Window

DownloadDocument
    WaitUntilElementAndClick                          ${BTN_DOWNLOAD_DOCUMENT}                                                       ${timeout}
    sleep                                             30s

SendEmail
    WaitUntilElementAndClick                          ${BTN_SEND_EMAIL}
    WaitUntilElementAndInput                          ${TXT_SEND_FROM}                                                               nirun.ler@tokiomarinelife.co.th
    WaitUntilElementAndInput                          ${TXT_SEND_TO}                                                                 nirun.ler@tokiomarinelife.co.th
    WaitUntilElementAndClick                          ${BTN_CONFIRM}
    Selenium2Library.Wait Until Element Is Visible    ${BTN_SAVE}

SaveQuotation
    Execute Javascript                                window.scrollTo(0, 600);
    WaitUntilElementAndClick                          ${BTN_SAVE}

ConfirmDialog
    WaitUntilElementAndClick                          ${BTN_DIALOG_OK}                                                               ${timeout}

VerifyTextSelectDocument
    ${value2}                                         Selenium2Library.Get Text                                                      ${TXT_MSG2}
    Should Be Equal                                   ${msg2}                                                                        ${value2}

WaitUntilElementPopupAndClick
    [Arguments]                                       ${locator}                                                                     ${timeout}=none
    ${status}                                         Run Keyword And Return Status                                                  Selenium2Library.Wait Until Element Is Visible    ${locator}                  ${timeout}
    Run Keyword If                                    '${status}' == 'True'                                                          Wait Until Keyword Succeeds                       3x                          5s              Selenium2Library.Click Element    ${locator}

SearchAndSelect
    [Arguments]                                       ${data_test}
    # WaitUntilElementAndInput                          xpath=//div[@id="agm-list-navbar"]//div[2]/div/input                           ${data_test['Search']}
    # WaitUntilElementAndClick                          xpath=//div[@id="agm-list-navbar"]//div[2]/div/span/button
    WaitUntilElementAndClick                          ${ITEM_SELECT}
    WaitUntilElementAndClick                          ${BTN_EDIT}

DeleteAndSelect
    WaitUntilElementAndClick                          ${ITEM_SELECT}
    WaitUntilElementAndClick                          ${BTN_DELETE}
    WaitUntilElementAndClick                          xpath=//div[@id="modal-alert"]/div/div/div[2]/div/div[2]/button