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
    # PayerInformationMobile                                ${data_test}
    # PolicyMobile                                          ${data_test}
    # QuestionnaireMobile                                   ${data_test}
    # QuestionnaireMobile2                                  ${data_test}
    # QuestionnaireTaxMobile
    # Fatca
    # RetryDopa
    # RetryDopa2

# ApplicationMobileSimulator
#           [Arguments]                                           ${rowNo}                  ${testcaseNo}      ${Desc}
#           MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
#           ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}      ${SHEET_NAME}    ${rowNo}
#           ${data_test}                                          PrepareDataApplication    ${data_test}       ${rowNo}
#           LoginAndSetupPinSimulator                             ${data_test}
#           SelectMenuMobile                                      ${data_test}
#           CreateApplicationMobile                               ${data_test}
#           InsuredInformationMobileSimulator                     ${data_test}              ${rowNo}
#           PayerInformationMobileSimulator                       ${data_test}
#           PolicyMobileSimulator                                 ${data_test}
#           QuestionnaireMobileSimulator                          ${data_test}
#           QuestionnaireMobile2Simulator                         ${data_test}
#           QuestionnaireTaxMobileSimulator

# EditApplicationMobile
#           [Arguments]                                           ${rowNo}                  ${testcaseNo}      ${Desc}
#           MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_APPLICATION}
#           ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}      ${SHEET_NAME}    ${rowNo}
#           ${data_test}                                          PrepareDataApplication    ${data_test}       ${rowNo}
#           mGetDevices                                           ${GalaxyTabS6}            ${JsonfilePath}    ${AppPackage}    ${AppActivity}
#           InputPasscode
#           SelectMenuMobile                                      ${data_test}
#           PopupApplication
#           EditData

# PaymentMethod
#           [Arguments]                                           ${rowNo}                  ${testcaseNo}
#           MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_PAYMENT}
#           ${data_test}                                          Read_Excel_For_Test       ${EXCEL_NAME}      ${SHEET_NAME}    ${rowNo}
#           ${data_test}                                          PrepareDataPayment        ${data_test}       ${rowNo}
#           LoginAndSetupPinSimulator                             ${data_test}
#           Execute Adb Shell                                     input tap 200 200
#           MenuApplication
#           PopupApplication
#           SelectDataPayment
#           SelectPaymentMethod                                   ${data_test}