*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
MobileQuotation
    [Arguments]                                           ${rowNo}                                                                                                                                                                                                               ${testcaseNo}                                       ${Desc}
    MobilerepareDataKeyword.Generate_File_Path_Request    ${JSON_QUOTATION}
    ${data_test}                                          Read_Excel_For_Test                                                                                                                                                                                                    ${EXCEL_NAME}                                       ${SHEET_NAME}                                                                                                                                                                                                          ${rowNo}
    ${data_test}                                          PrepareDataQuotation                                                                                                                                                                                                   ${data_test}                                        ${rowNo}
    LoginAndSetupPin                                      ${data_test}
    SelectMenuMobile                                      ${data_test}
    CreateQuotationMobile
    InputInformation                                      ${data_test}

CreateQuotationMobile
    AppiumLibrary.Wait Until Element Is Visible           ${BTN_CREATE_QUOTATION_MOBILE}    ${timeout}
    WaitAndClick                                          ${BTN_CREATE_QUOTATION_MOBILE}
    ${status}                                             Run Keyword And Return Status                                                                                                                                                                                          AppiumLibrary.Wait Until Element Is Visible         ${BTN_CREATE_QUOTATION_MOBILE}                                                                                                                                                                                         ${timeout}
    Run Keyword If                                        '${status}' == 'True'                                                                                                                                                                                                  WaitAndClick                                        ${BTN_CREATE_QUOTATION_MOBILE}
    CloseFrom

InputInformation
    [Arguments]                                           ${data_test}
    WaitAndInput                                          ${TXT_NAME_MOBILE}                                                                                                                                                                                                     ${data_test['InsuredInformation']['Name']}
    WaitAndInput                                          ${TXT_LASTNAME_MOBILE}                                                                                                                                                                                                 ${data_test['InsuredInformation']['Lastname']}
    Run Keyword If                                        '${data_test['InsuredInformation']['Gender']}' == 'M'                                                                                                                                                                  ClickRadioMale
    ...                                                   ELSE                                                                                                                                                                                                                   ClickRadioFemale
    Run Keyword If                                        ${data_test['InsuredInformation']['Age']} > 0                                                                                                                                                                          SelectDateMobile                                    ${data_test}
    ...                                                   ELSE                                                                                                                                                                                                                   SelectMonthMobile
    AppiumLibrary.Tap                                     ${None}                                                                                                                                                                                                                500                                                 500
    SeleteOccuption                                       ${data_test}
    Run Keyword If                                        ${data_test['InsuredInformation']['Age']} > 0                                                                                                                                                                          FlowAgeMore16                                       ${data_test}
    ...                                                   ELSE                                                                                                                                                                                                                   FlowAgeless16                                       ${data_test}

ClickRadioMale
    Execute Adb Shell                                     input tap 1000 800

ClickRadioFemale
    Execute Adb Shell                                     input tap 1200 800

FlowAgeMore16
    [Arguments]                                           ${data_test}
    QuotationTab3
    QuotationTab4                                         ${data_test}

QuotationTab3
    WaitAndTap                                            xpath=//android.view.View[@resource-id='add-tab-3']
    WaitAndTap                                            xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[6]/android.view.View
    WaitAndTap                                            xpath=//android.widget.TextView[@text='URP1']
    Execute Adb Shell                                     input tap 1800 1000
    Execute Adb Shell                                     input text 30000
    Execute Adb Shell                                     input tap 1000 450

QuotationTab4
    [Arguments]                                           ${data_test}
    AppiumLibrary.Wait Until Element Is Visible           xpath=//android.view.View[@resource-id='add-tab-4']                                                                                                                                                                    ${timeout}
    WaitAndTap                                            xpath=//android.view.View[@resource-id='add-tab-4']
    AppiumLibrary.Wait Until Element Is Visible           xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View    ${timeout}
    Run Keyword If                                        '${data_test['Quiz']['QuizFromNo']}' == 'Y'    RiskForm     ${data_test}                                                                                                                                                                              
    ...                                                   ELSE                                                                                                                                                                                                                   WaitAndTap                                          xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View
    WaitAndTap                                            xpath=//android.widget.Button[@text='หน้าถัดไป']

RiskForm
    [Arguments]                                           ${data_test}
    WaitAndTap                                          xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View
    AppiumLibrary.Wait Until Element Is Visible           xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView[1]    
    FOR   ${i}    IN RANGE    4
        IF    ${i} == 1
            Run Keyword If                                        '${data_test['Quiz']['QuizFromNo1']}' == 1    Log To Console    1
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo1']}' == 2    Log To Console    2
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo1']}' == 3    Log To Console    3
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo1']}' == 4    Log To Console    4
        ELSE IF    ${i} == 2
            Run Keyword If                                        '${data_test['Quiz']['QuizFromNo2']}' == 1    Log To Console    2.1
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo2']}' == 2    Log To Console    2.2
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo2']}' == 3    Log To Console    2.3
            ...    ELSE If    '${data_test['Quiz']['QuizFromNo2']}' == 4    Log To Console    2.4
        ELSE
            Log To Console    High ${i}
        END
    END


FlowAgeless16
    [Arguments]                                           ${data_test}
    WaitAndTap                                            xpath=//android.view.View[@resource-id='add-tab-2']

    MobilePayerInformation                                ${data_test}
    MobileInsuredInformation                              ${data_test}
    MobileSummaryInsured

SelectDateMobile
    [Arguments]                                           ${data_test}
    WaitAndClick                                          ${BTN_BIRTHDAY_MOBILE}
    AppiumLibrary.Wait Until Element Is Visible           ${DDL_BIRTHDAY_MOBILE_PRR_First}                                                                                                                                                                                       ${timeout}
    AppiumLibrary.Click Element                           ${DDL_BIRTHDAY_MOBILE_PRR_First}
    FOR                                                   ${index}                                                                                                                                                                                                               IN RANGE                                            ${data_test['InsuredInformation']['Age']}
    AppiumLibrary.Wait Until Element Is Visible           ${DDL_BIRTHDAY_MOBILE_PRR}                                                                                                                                                                                             ${timeout}
    AppiumLibrary.Click Element                           ${DDL_BIRTHDAY_MOBILE_PRR}
    END
    AppiumLibrary.Tap                                     ${DDL_BIRTHDAY_MOBILE_PRR}

SelectDateMobile2
    [Arguments]                                           ${data_test}
    WaitAndClick                                          ${BTN_BIRTHDAY_MOBILE}
    WaitAndClick                                          ${DDL_BIRTHDAY_MOBILE_PRR_First}                                                                                                                                                                                       ${timeout}
    FOR                                                   ${index}                                                                                                                                                                                                               IN RANGE                                            ${data_test['PayerInformation']['Age']}
    WaitAndClick                                          ${DDL_BIRTHDAY_MOBILE_PRR}                                                                                                                                                                                             ${timeout}
    END
    AppiumLibrary.Tap                                     ${DDL_BIRTHDAY_MOBILE_PRR}

SelectMonthMobile
    WaitAndClick                                          ${BTN_BIRTHDAY_MOBILE}
    WaitAndClick                                          ${DDL_BIRTHDAY_MOBILE_MONTH_First}                                                                                                                                                                                     ${timeout}

SelectMonthMobile2
    WaitAndClick                                          ${BTN_BIRTHDAY_MOBILE}
    AppiumLibrary.Wait Until Element Is Visible           ${DDL_BIRTHDAY_MOBILE_MONTH_First}                                                                                                                                                                                     ${timeout}
    AppiumLibrary.Click Element                           ${DDL_BIRTHDAY_MOBILE_MONTH_First}

SeleteOccuption
    [Arguments]                                           ${data_test}
    AppiumLibrary.Click Element                           ${BTN_OCCUPTION_MOBILE}
    WaitAndInput                                          ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                      ${data_test['InsuredInformation']['Occupation']}
    AppiumLibrary.Click Element                           ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}

SeleteOccuption2
    [Arguments]                                           ${data_test}
    AppiumLibrary.Click Element                           ${BTN_OCCUPTION2_MOBILE}
    WaitAndInput                                          ${TXT_OCCUPTION_MOBILE['${ENV}']}                                                                                                                                                                                      ${data_test['PayerInformation']['Occupation']}
    AppiumLibrary.Click Element                           ${TXT_SELECTOCCUPTION_MOBILE['${ENV}']}

MobilePayerInformation
    [Arguments]                                           ${data_test}
    WaitAndTap                                            ${MENU_PAYERINSURANCE}
    Execute Adb Shell                                     input tap 1000 500
    Execute Adb Shell                                     input text QA
    Execute Adb Shell                                     input tap 1800 500
    Execute Adb Shell                                     input text Auto

    # WaitAndInput                                          ${TXT_NAME_MOBILE}                                            ${data_test['PayerInformation']['Name']}
    # WaitAndInput                                          ${TXT_LASTNAME_MOBILE}                                        ${data_test['PayerInformation']['Lastname']}
    Run Keyword If                                        '${data_test['PayerInformation']['Gender']}' == 'M'                                                                                                                                                                    AppiumLibrary.Click Element                         ${RDO_MALE_MOBILE}
    ...                                                   ELSE                                                                                                                                                                                                                   AppiumLibrary.Click Element                         ${RDO_FEMALE_MOBILE}
    WaitAndClick                                          ${BTN_PAYBIRTHDAY_MOBILE}
    Run Keyword If                                        ${data_test['PayerInformation']['Age']} > 0                                                                                                                                                                            SelectDateMobile2                                   ${data_test}
    ...                                                   ELSE                                                                                                                                                                                                                   SelectMonthMobile2
    AppiumLibrary.Tap                                     ${None}                                                                                                                                                                                                                500                                                 500
    SeleteOccuption2                                      ${data_test}

MobileInsuredInformation
    [Arguments]                                           ${data_test}
    WaitAndTap                                            ${MENU_INSURANCE}
    AppiumLibrary.Wait Until Element Is Visible           ${TXT_SELECT}                                                                                                                                                                                                          ${timeout}
    WaitAndTap                                            ${BTN_ADD_INSURANCE}
    WaitAndTap                                            ${TXT_GROUPSAVING['${ENV}']}
    WaitAndTap                                            ${TXT_ITEMCODE['${ENV}']}
    Execute Adb Shell                                     input tap 1300 1050
    AppiumLibrary.Clear Text                              ${TXT_SUMINSURED_MOBILE}
    Execute Adb Shell                                     input text 500000
    Execute Adb Shell                                     input tap 1300 1300
    WaitAndTap                                            ${TXT_MONTH3_MOBILE}

MobileSummaryInsured
    WaitAndTap                                            ${MENU_SUMMARY}
    AppiumLibrary.Swipe By Percent                        50                                                                                                                                                                                                                     90                                                  50                                                                                                                                                                                                                     0
    WaitAndTap                                            ${BTN_DOCUMENT}
    AppiumLibrary.Tap                                     ${None}                                                                                                                                                                                                                1300                                                1200
    AppiumLibrary.Tap                                     ${None}                                                                                                                                                                                                                90                                                  300
    WaitAndTap                                            ${BTN_BACKHOME_MOBILE}

Education
    [Arguments]                                           ${data_test}
    Run Keyword If                                        '${data_test['Education']}' == 'Y'                                                                                                                                                                                     WaitAndClick                                        ${RDO_ISSTUDENT_MOOBILE}
    ...                                                   ELSE                                                                                                                                                                                                                   WaitAndClick                                        ${RDO_NOTISSTUDENT_MOOBILE}

InputInsureName
    [Arguments]                                           ${data_test}
    WaitAndClick                                          ${DDL_TITLE_MOBILE['${ENV}']}
    WaitAndClick                                          ${DDL_TITLE_MR_MOBILE['${ENV}']}
    WaitAndInput                                          ${TXT_INSURED_THNAME_FIRST}                                                                                                                                                                                            ${data_test['InsuredInformation']['Name']}
    WaitAndInput                                          ${TXT_INSURED_THNAME_LAST}                                                                                                                                                                                             ${data_test['InsuredInformation']['Lastname']}

InformationFather
    [Arguments]                                           ${data_test}
    WaitAndClick                                          ${DDL_TITLE_FATHER}
    WaitAndClick                                          ${DDL_TITLE_FATHER_MR_MOBILE}
    WaitAndInput                                          ${TXT_INSURED_FATHERNAME_FIRST}                                                                                                                                                                                        ${data_test['FatherName']}
    WaitAndInput                                          ${TXT_INSURED_FATHERNAME_LAST}                                                                                                                                                                                         ${data_test['FatherLastname']}
    ${status}                                             Run Keyword And Return Status                                                                                                                                                                                          AppiumLibrary.Wait Until Element Is Visible         ${RDO_FATHER_ALIVE_MOBILE}                                                                                                                                                                                             ${timeout}
    Run Keyword If                                        '${status}' == 'True'                                                                                                                                                                                                  AppiumLibrary.Click Element                         ${RDO_FATHER_ALIVE_MOBILE}
    Run Keyword If                                        '${data_test['InsuredInformation']['FatherAlive']}' == 'Y'                                                                                                                                                             WaitAndClick                                        xpath=/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[1]
    ...                                                   ELSE                                                                                                                                                                                                                   WaitAndClick                                        xpath=/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View[2]

InformationMother
    [Arguments]                                           ${data_test}
    WaitAndClick                                          ${DDL_TITLE_MOTHER}
    WaitAndClick                                          ${DDL_TITLE_MISS_MOBILE}
    WaitAndInput                                          ${TXT_INSURED_MOTHERNAME_FIRST}                                                                                                                                                                                        ${data_test['MotherName']}
    WaitAndInput                                          ${TXT_INSURED_MOTHERNAME_LAST}                                                                                                                                                                                         ${data_test['MotherLastname']}
    ${status}                                             Run Keyword And Return Status                                                                                                                                                                                          AppiumLibrary.Wait Until Element Is Visible         ${RDO_MOTHER_ALIVE_MOBILE}                                                                                                                                                                                             ${timeout}
    Run Keyword If                                        '${status}' == 'True'                                                                                                                                                                                                  AppiumLibrary.Click Element                         ${RDO_MOTHER_ALIVE_MOBILE}
    Run Keyword If                                        '${data_test['InsuredInformation']['MotherAlive']}' == 'Y'                                                                                                                                                             WaitAndClick                                        ${RDO_MOTHER_ALIVE_MOBILE}
    ...                                                   ELSE                                                                                                                                                                                                                   WaitAndClick                                        ${RDO_MOTHER_NOT_ALIVE_MOBILE}

InformationAddress
    [Arguments]                                           ${data_test}
    WaitAndInput                                          ${TXT_POSTCODE_MOBILE}                                                                                                                                                                                                 ${data_test['Postcode']}
    WaitAndTap                                            ${TXT_SELECTPOSTCODE_MOBILE}
    AppiumLibrary.Swipe By Percent                        90                                                                                                                                                                                                                     90                                                  90                                                                                                                                                                                                                     0
    WaitAndClick                                          ${BTN_COPYADDRESS}