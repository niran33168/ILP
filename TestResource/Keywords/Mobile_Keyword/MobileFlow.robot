*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
MobileQuotation
    [Arguments]                                           ${rowNo}                  ${testcaseNo}                                ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_QUOTATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataQuotation      ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateQuotationMobile                                 ${data_test}
    SuitablityTest                                        ${data_test}
    MobileSummaryInsured

MobileQuotationFundSelect
    [Arguments]                                           ${rowNo}                  ${testcaseNo}                                ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_QUOTATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataQuotation      ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateQuotationMobile                                 ${data_test}
    SuitablityTest                                        ${data_test}

ApplicationMobile
    [Arguments]                                           ${rowNo}                  ${testcaseNo}                                ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}                                 ${rowNo}
    ${age}                                                Set Variable              ${data_test['InsuredInformation']['Age']}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateApplicationMobile                               ${data_test}
    InsuredInformationMobile                              ${data_test}              ${rowNo}
    IF                                                    ${age} <= 16              PayerInformationMobile                       ${data_test}
    ...                                                   ELSE                      PayerInformationMobile 1
    PolicyMobile Z                                        ${data_test}
   # QuestionnaireMobile H
    QuestionnaireMobile 
    QuestionnaireMobile2
    QuestionnaireTaxMobile Z
    InvesterInfo
    RiskForm
    mApplicationPageKeyword.SelectFund
    RetryDopa ILP
    Capture Page Screenshot
    Sleep                                                 5


VerifyEKYC
    [Arguments]                                           ${rowNo}                  ${testcaseNo}                                ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}                                 ${rowNo}
    ${age}                                                Set Variable              ${data_test['InsuredInformation']['Age']}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateApplicationMobile                               ${data_test}
    InsuredInformationMobile EKYC                         ${data_test}              ${rowNo}
    PayerInformationMobile 1
    PolicyMobile Z                                        ${data_test}
    QuestionnaireMobile                                   ${data_test}
    QuestionnaireMobile2                                  ${data_test}
    QuestionnaireTaxMobile Z
    InvesterInfo
    RiskForm
    mApplicationPageKeyword.SelectFund
    RetryDopa ILP
    Capture Page Screenshot

PreviewApplication
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    PreviewApplicationform                                TA2308299037

PreviewSaleIllustration
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    PreviewSale                                           TA2308299037

PreviewSIQuotation
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_QUOTATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataQuotation      ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    PreviewSI                                             6606260009

PaymentMethod
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_PAYMENT}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataPayment        ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    MenuApplication
    FillterApplication                                    TA2308299034
    SelectCreditCard
    AppiumLibrary.Swipe                                   965                       175                                          965              615
    SelectMPOS
    SelectMobileBanking

InstalmentMethod
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_PAYMENT}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataPayment        ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    MenuApplication
    Instalment                                            TA2308072015
    SelectPaymentMethod                                   ${data_test}

SignEApp
    [Arguments]                                           ${rowNo}                  ${testcaseNo}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
    ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}                                ${SHEET_NAME}    ${rowNo}
    ${data_test}                                          PrepareDataApplication    ${data_test}                                 ${rowNo}
    LoginAppFastTrack                                     ${devicesName}
    InputUsernameAndPassword                              ${data_test}
    SelectMenuMobile                                      ${data_test}
    SignDocument                                          TA2309069001