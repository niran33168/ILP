*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
Quotation
    [Arguments]                                  ${rowNo}                         ${testcaseName}                                   ${desc}
    ${data_test}                                 Read_Excel_For_Test              ${EXCEL_NAME}                                     ${SHEET_NAME}      ${rowNo}
    ${URL}                                       Set Variable If                  '${ENV}' == 'uat'                                 ${URL_UAT}
    ...                                          ${URL_RV}
    OpenAndLogin                                 ${URL}                           ${Browser}                                        ${data_test}
    SelectMenuWeb                                quotation
    QuotationAction                              addd                             ${data_test}
    Close All Browsers

QuotationEdit
    [Arguments]                                  ${rowNo}                         ${testcaseName}                                   ${desc}
    ${data_test}                                 Read_Excel_For_Test              ${EXCEL_NAME}                                     ${SHEET_NAME}      ${rowNo}
    ${URL}                                       Set Variable If                  '${ENV}' == 'uat'                                 ${URL_UAT}
    ...                                          ${URL_RV}
    OpenAndLogin                                 ${URL}                           ${Browser}                                        ${data_test}
    SelectMenuWeb                                quotation
    QuotationAction                              edit                             ${data_test}
    Close All Browsers

QuotationDelete
    [Arguments]                                  ${rowNo}                         ${testcaseName}                                   ${desc}
    ${data_test}                                 Read_Excel_For_Test              ${EXCEL_NAME}                                     ${SHEET_NAME}      ${rowNo}
    ${URL}                                       Set Variable If                  '${ENV}' == 'uat'                                 ${URL_UAT}
    ...                                          ${URL_RV}
    OpenAndLogin                                 ${URL}                           ${Browser}                                        ${data_test}
    SelectMenuWeb                                quotation
    QuotationAction                              delete                           ${data_test}
    Close All Browsers

WaitUntilElementAndClick
    [Arguments]                                  ${locator}                       ${timeout}=none
    ${status}                                    Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${locator}         ${timeout}
    Run Keyword If                               '${status}' == 'True'            Wait Until Keyword Succeeds                       3x                 5s            Selenium2Library.Click Element    ${locator}

WaitUntilElementAndInput
    [Arguments]                                  ${locator}                       ${text}                                           ${timeout}=none
    ${status}                                    Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${locator}         ${timeout}
    Run Keyword If                               '${status}' == 'True'            Selenium2Library.Input Text                       ${locator}         ${text}

Application
    [Arguments]                                  ${rowNo}                         ${testcaseName}
    ${data_test}                                 Read_Excel_For_Test              ${EXCEL_NAME}                                     ${SHEET_NAME}      ${rowNo}
    ${URL}                                       Set Variable If                  '${ENV}' == 'uat'                                 ${URL_UAT}
    ...                                          ${URL_RV}
    OpenAndLogin                                 ${URL}                           ${Browser}                                        ${data_test}
    SelectMenuWeb                                application
    ConfirmDialog
    CreateFrom                                   ${data_test}
    InsuredInformation                           ${data_test}
    PayerInformation                             ${data_test}
    Product                                      ${data_test}
    InsuredHealthQuestion                        ${data_test}
    QuestionnaireForHealthAssessmentOfNewborn    ${data_test}
    TaxRequirement

Application1
    [Arguments]                                  ${rowNo}                         ${testcaseName}
    ${data_test}                                 Read_Excel_For_Test              ${EXCEL_NAME}                                     ${SHEET_NAME}      ${rowNo}
    ${URL}                                       Set Variable If                  '${ENV}' == 'uat'                                 ${URL_UAT}
    ...                                          ${URL_RV}
    OpenAndLogin                                 ${URL}                           ${Browser}                                        ${data_test}
    SelectMenuWeb                                application
    ConfirmDialog
    CreateFrom                                   ${data_test}
    InsuredHealthQuestion                        ${data_test}
    QuestionnaireForHealthAssessmentOfNewborn    ${data_test}
    TaxRequirement