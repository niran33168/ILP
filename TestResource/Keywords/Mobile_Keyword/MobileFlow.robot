*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
ApplicationMobile
    [Arguments]                                           ${rowNo}                  ${testcaseNo}    ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}    ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}     ${rowNo}
    LoginAndSetupPin                                      ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateApplicationMobile                               ${data_test}
    InsuredInformationMobile                              ${data_test}
    PayerInformationMobile                                ${data_test}
    PolicyMobile                                          ${data_test}
    QuestionnaireMobile                                   ${data_test}
    QuestionnaireMobile2                                  ${data_test}
    QuestionnaireTaxMobile
    UnitHolder
    SuitabilityTest
    Fund
