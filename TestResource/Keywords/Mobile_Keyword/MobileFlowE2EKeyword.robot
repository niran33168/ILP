*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
FlowE2E
    [Arguments]                                           ${rowNo}                  ${testcaseNo}           ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_QUOTATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}           ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataQuotation      ${data_test}            ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateQuotationMobile                                 ${data_test}
    HomeQuotation
    Capture Page Screenshot
    Set Test Variable                                     ${SHEET_NAME}             ${SHEET_APPLICATION}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}           ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}            ${rowNo}
    CreateApplicationMobile                               ${data_test}
    InsuredInformationMobile                              ${data_test}              ${rowNo}
    PayerInformationMobile                                ${data_test}
    PolicyMobile                                          ${data_test}
    QuestionnaireMobile                                   ${data_test}
    QuestionnaireMobile2                                  ${data_test}
    QuestionnaireTaxMobile
    Fatca
    RetryDopa
    RetryDopa2