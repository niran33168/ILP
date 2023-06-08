*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
CreateFrom
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_CREATE_FROM}                                                                                                                                                        ${timeout}
    Run Keyword If                                        '${data_test['From']}' == 'life'                                                                                                                                          WaitUntilElementAndClick                                                                                 ${BTN_LIFE_INSURANCE}                                                                                                                                                      ${timeout}
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 ${BTN_ACCIDENT_INSURANCE}                                                                                                                                                  ${timeout}

EditFrom
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_EDIT_FORM}
    Selenium2Library.Wait Until Element Is Visible        ${TXT_CUSTOMER}                                                                                                                                                           ${timeout}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    Run Keyword If                                        '${BROWSER}' == '${SAFARI}'                                                                                                                                               Execute Javascript                                                                                       document.querySelector("#page-content > div > div:nth-child(2) > div > div.H8C_gFwYx2ge79x7Rzp-t > div.VS_hlczWNLx_z6rRVPrs2 > div > ul.minimap-menu").scrollTo(0,1000)
    FormPolicy                                            ${data_test}
    # Question                                              ${data_test}

InsuredInformation
    [Arguments]                                           ${data_test}
    Selenium2Library.Wait Until Element Is Visible        ${TXT_CUSTOMER}                                                                                                                                                           ${timeout}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    Run Keyword If                                        '${BROWSER}' == '${SAFARI}'                                                                                                                                               Execute Javascript                                                                                       document.querySelector("#page-content > div > div:nth-child(2) > div > div.H8C_gFwYx2ge79x7Rzp-t > div.VS_hlczWNLx_z6rRVPrs2 > div > ul.minimap-menu").scrollTo(0,1000)

    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 1                                                                                                                                                                          27
    WaitUntilElementAndClick                              xpath=//div[@id="react-select-${index}--value"]
    SelectDropDown
    END
    WaitUntilElementAndClick                              xpath=//p//span[text()='ข้อมูลลูกค้า']
    WaitUntilElementAndClick                              ${TXT_CARD_EXPIRED}
    WaitUntilElementAndClick                              xpath=//div[4]//input
    SelectDatePicker                                      2568                                                                                                                                                                      ม.ค.                                                                                                     15
    WaitUntilElementAndClick                              ${TXT_CARD_ID}
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[2]/section/div[2]/div/input                                                                                                             ${data_test['Id']}
    WaitUntilElementAndClick                              ${TXT_ASSURED_NAME}
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[6]//input                                                                                                                               ${data_test['Name']}
    WaitUntilElementAndClick                              ${TXT_ASSURED_LASTNAME}
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[7]//input                                                                                                                               ${data_test['Lastname']}

    WaitUntilElementAndClick                              ${TXT_ASSURED_BIRTHDAY}
    WaitUntilElementAndClick                              xpath=//div[8]//input
    SelectDatePicker                                      ${data_test['Year']}                                                                                                                                                      ${data_test['Month']}                                                                                    ${data_test['Day']}
    Education                                             ${data_test}

    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 12                                                                                                                                                                         14
    ${value}                                              Set Variable If                                                                                                                                                           ${index} == 12                                                                                           บิดา
    ...                                                   ${index} == 13                                                                                                                                                            นามสกุล
    WaitUntilElementAndInput                              xpath=//div[${index}]//input                                                                                                                                              ${value}
    WaitUntilElementAndClick                              xpath=//div[${index}]//button
    END

    WaitUntilElementAndClick                              xpath=//div[14]//li[1]
    WaitUntilElementAndClick                              xpath=//div[14]//button

    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 16                                                                                                                                                                         18
    ${value}                                              Set Variable If                                                                                                                                                           ${index} == 16                                                                                           มารดา
    ...                                                   ${index} == 17                                                                                                                                                            นามสกุล
    WaitUntilElementAndInput                              xpath=//div[${index}]//input                                                                                                                                              ${value}
    WaitUntilElementAndClick                              xpath=//div[${index}]//button
    END

    WaitUntilElementAndClick                              xpath=//div[18]//li[1]
    WaitUntilElementAndClick                              xpath=//div[18]//button

Education
    [Arguments]                                           ${data_test}
    Run Keyword If                                        '${data_test['Education']}' == 'Y'                                                                                                                                        WaitUntilElementAndClick                                                                                 xpath=//div[10]//ul/li[1]
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 xpath=//div[10]//ul/li[2]

PayerInformation
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    WaitUntilElementAndClick                              ${TXT_MENU_PAYER_INFORMATION}
    Execute Javascript                                    document.querySelector("#page-content > div > div:nth-child(2) > div > div.H8C_gFwYx2ge79x7Rzp-t > div.VS_hlczWNLx_z6rRVPrs2 > div > ul.minimap-menu").scrollTo(0,0)

    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'หมายเลขประชาชน']
    WaitUntilElementAndInput                              xpath=//div[45]//input                                                                                                                                                    ${data_test['IdPay']}
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'วันหมดอายุบัตร']
    WaitUntilElementAndClick                              xpath=//div[46]//input
    SelectDatePicker                                      2568                                                                                                                                                                      ม.ค.                                                                                                     25
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'ชื่อ']
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[48]//input                                                                                                                              ${data_test['NamePay']}
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'นามสกุล']
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[49]//input                                                                                                                              ${data_test['LastnamePay']}
    Execute Javascript                                    document.querySelector("#page-content > div > div:nth-child(2) > div > div.H8C_gFwYx2ge79x7Rzp-t > div.VS_hlczWNLx_z6rRVPrs2 > div > ul.minimap-menu").scrollTo(0,300)
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'วันเกิด']
    WaitUntilElementAndClick                              xpath=//div[50]//input
    SelectDatePicker                                      ${data_test['PayYear']}                                                                                                                                                   ${data_test['PayMonth']}                                                                                 ${data_test['PayDay']}
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'โทรศัพท์มือถือ']
    WaitUntilElementAndInput                              xpath=//div[66]//input                                                                                                                                                    ${data_test['Mobile']}
    WaitUntilElementAndClick                              xpath=//div[66]//button
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'อีเมล์']
    WaitUntilElementAndInput                              xpath=//div[67]//input                                                                                                                                                    ${data_test['Email']}
    WaitUntilElementAndClick                              xpath=//div[67]//button

    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'รายได้ต่อปี']
    WaitUntilElementAndInput                              xpath=//div[@id="slide-view"]/div[94]//input                                                                                                                              ${data_test['AnnualIncome']}
    WaitUntilElementAndClick                              xpath=//div[94]//button
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'สถานที่สะดวกในการติดต่อ']
    WaitUntilElementAndClick                              xpath=//div[89]//li[1]
    WaitUntilElementAndClick                              xpath=//li[2]//span[text() = 'อาชีพประจำ']
    WaitUntilElementAndClick                              xpath=//button[@id="occupationList"]
    WaitUntilElementAndInput                              xpath=//div[90]//input                                                                                                                                                    ${data_test['Occupation']}
    WaitUntilElementAndClick                              xpath=//div[90]//div/span[text() = '${data_test['Occupation']}']
    WaitUntilElementAndClick                              xpath=//div[90]//button

SelectDropDown
    Press Keys                                            ${None}                                                                                                                                                                   ARROW_DOWN
    Press Keys                                            ${None}                                                                                                                                                                   TAB

SelectDatePicker
    [Arguments]                                           ${Year}                                                                                                                                                                   ${Month}                                                                                                 ${Day}
    WaitUntilElementAndClick                              ${DATE_YEAR}
    WaitUntilElementAndClick                              ${DATE_MONTH}
    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 5
    ${status}                                             Run Keyword And Return Status                                                                                                                                             Selenium2Library.Wait Until Element Is Not Visible                                                       xpath=//span[text() = '${Year}']
    Run Keyword If                                        '${status}' == 'True'                                                                                                                                                     Selenium2Library.Click Element                                                                           xpath=//div[@class="datepicker-years"]//th[@class="prev"]
    END
    WaitUntilElementAndClick                              xpath=//span[text() = '${Year}']
    WaitUntilElementAndClick                              xpath=//span[text() = '${Month}']                                                                                                                                         ${timeout}
    WaitUntilElementAndClick                              xpath=//td[@class='day' and text() = '${Day}']

Product
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    WaitUntilElementAndClick                              ${TXT_MENU_PRODUCT}
    WaitUntilElementAndClick                              ${TXT_MENU_PRODUCT_SUB1}
    WaitUntilElementAndClick                              ${DDL_BASIC_PLAN}
    WaitUntilElementAndClick                              xpath=//div[@id="accordion"]/div[2]//h4/a
    WaitUntilElementAndClick                              xpath=//li[@id="10EN10"]/a
    WaitUntilElementAndInput                              ${TXT_SUM_INSURE}                                                                                                                                                         ${data_test['SumInsure']}
    Press Keys                                            ${None}                                                                                                                                                                   TAB
    DividendCondition                                     ${data_test}
    Beneficiary                                           ${data_test}

DividendCondition
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${TXT_MENU_DIVIDEND}
    Run Keyword If                                        '${data_test['Condittion']}' == 'Transfer'                                                                                                                                WaitUntilElementAndClick                                                                                 ${CHANEL_TRANSFER}
    ...                                                   ELSE IF                                                                                                                                                                   '${data_test['Condittion']}' == 'Cheque'                                                                 WaitUntilElementAndClick                                                                                                                                                   ${CHANEL_CHEQUE}
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 ${CHANEL_PAYOFF}

Beneficiary
    [Arguments]                                           ${data_test}
    ${loop}                                               Set Variable                                                                                                                                                              ${data_test['Num_Person']}+1
    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 ${loop}
    Log                                                   ${index}
    Run Keyword If	'${index}' == '0'	Continue For Loop
    WaitUntilElementAndClick                              ${BTN_BENEFICIARY_ADD}
    WaitUntilElementAndInput                              ${TXT_BENEFICIARY_NAME}                                                                                                                                                   ${data_test['Beneficiary_Name${index}']}
    WaitUntilElementAndInput                              ${TXT_BENEFICIARY_LASTNAME}                                                                                                                                               ${data_test['Beneficiary_Lastname${index}']}
    WaitUntilElementAndClick                              xpath=//form[@id="1234"]/div/div/div[4]/div/div[2]/div/div
    Run Keyword If	'${index}' == '1'                      WaitUntilElementAndClick                                                                                                                                                  xpath=//div[@id="react-select-28--option-${data_test['Beneficiary_Relationship1']}"]
    ...                                                   ELSE IF	'${index}' == '2'                                                                                                                                                 SelectDropDown

    WaitUntilElementAndInput                              ${TXT_BENEFICIARY_AGE}                                                                                                                                                    ${data_test['Beneficiary_Age${index}']}
    WaitUntilElementAndInput                              ${TXT_BENEFICIARY_PERCENTAGE}                                                                                                                                             ${data_test['Beneficiary_Percent${index}']}
    WaitUntilElementAndClick                              ${BTN_BENEFICIARY_OK}
    Selenium2Library.Wait Until Element Is Visible        xpath=//div[99]//div[${index}]/div/div/div[1]/div[1]/span/span[text() ='ผู้รับผลประโยชน์']                                                                                ${timeout}
    END
    WaitUntilElementAndClick                              xpath=//div[@id="page-content"]/div/div[2]/div/div[2]/div/div/div/div[2]/div/div[2]
    sleep                                                 5s

InsuredHealthQuestion
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    WaitUntilElementAndClick                              ${TXT_MENU_INSURED_HEALTH_QUESTIONNAIRE}
    WaitUntilElementAndClick                              ${TXT_MENU_INSURED_HEALTH_QUESTIONNAIRE_SUB1}
    FOR                                                   ${index}                                                                                                                                                                  IN RANGE                                                                                                 98                                                                                                                                                                         109
    Run Keyword If                                        '${index}' == '98' and '${data_test['PhysicalCheckup_Or_OthersInvestigation']}' == 'N'                                                                                    WaitUntilElementAndClick                                                                                 xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '99' or '${index}' == '101' and '${data_test['AnyMedicalTreatmentForAccident']}' == 'N'    WaitUntilElementAndClick                                                                                                                                                   xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '100' and '${data_test['DisabilityOrSuffered']}' == 'N'                                    WaitUntilElementAndClick                                                                                                                                                   xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '103'                                                                                      WaitUntilElementAndInput                                                                                                                                                   xpath=//div[${index}]//input                     -
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '102' or '${index}' == '104' and '${data_test['DeclinedOrPostponed']}' == 'N'              WaitUntilElementAndClick                                                                                                                                                   xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '105'                                                                                      WaitUntilElementAndInput                                                                                                                                                   xpath=//div[${index}]//input                     ${data_test['Weight']}
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '106'                                                                                      WaitUntilElementAndInput                                                                                                                                                   xpath=//div[${index}]//input                     ${data_test['Hight']}
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '107' and '${data_test['ChangeWeight']}' == 'N'                                            WaitUntilElementAndClick                                                                                                                                                   xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE IF                                                                                                                                                                   '${index}' == '108' and '${data_test['ParentsHeartdiseases']}' == 'N'                                    WaitUntilElementAndClick                                                                                                                                                   xpath=//div[${index}]/section/div[2]/ul/li[2]
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 xpath=//div[${index}]/section/div[2]/ul/li[1]
    WaitUntilElementAndClick                              xpath=//div[${index}]//button
    END

QuestionnaireForHealthAssessmentOfNewborn
    [Arguments]                                           ${data_test}
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    WaitUntilElementAndClick                              ${TXT_MENU_ADDITIONAL_QUESTIONNAIRE_FOR_HEALTH ASSESSMENT_OF_NEWBORN}
    WaitUntilElementAndClick                              ${TXT_MENU_ADDITIONAL_QUESTIONNAIRE_FOR_HEALTH ASSESSMENT_OF_NEWBORN_SUB1}
    WaitUntilElementAndInput                              xpath=//div[109]//input                                                                                                                                                   ${data_test['GestationalAging']}
    WaitUntilElementAndClick                              xpath=//div[109]//button
    WaitUntilElementAndInput                              xpath=//div[110]//input                                                                                                                                                   ${data_test['BirthWeight']}
    WaitUntilElementAndClick                              xpath=//div[110]//button
    Run Keyword If                                        '${data_test['Complication']}' == 'N'                                                                                                                                     WaitUntilElementAndClick                                                                                 xpath=//div[114]/section/div[2]/ul/li[2]
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 xpath=//div[114]/section/div[2]/ul/li[1]
    WaitUntilElementAndClick                              xpath=//div[114]//button
    Run Keyword If                                        '${data_test['Abnormalities']}' == 'N'                                                                                                                                    WaitUntilElementAndClick                                                                                 xpath=//div[115]/section/div[2]/ul/li[2]
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 xpath=//div[115]/section/div[2]/ul/li[1]
    WaitUntilElementAndClick                              xpath=//div[115]//button
    WaitUntilElementAndInput                              xpath=//div[116]//input                                                                                                                                                   ${data_test['LengthOfStay']}
    WaitUntilElementAndClick                              xpath=//div[116]//button
    Run Keyword If                                        '${data_test['Anemia']}' == 'N'                                                                                                                                           WaitUntilElementAndClick                                                                                 xpath=//div[117]/section/div[2]/ul/li[2]
    ...                                                   ELSE                                                                                                                                                                      WaitUntilElementAndClick                                                                                 xpath=//div[117]/section/div[2]/ul/li[1]
    WaitUntilElementAndClick                              xpath=//div[117]//button

TaxRequirement
    WaitUntilElementAndClick                              ${BTN_IMPORTANT}
    WaitUntilElementAndClick                              ${TXT_MENU_TAX}
    WaitUntilElementAndClick                              ${TXT_MENU_TAX_SUB1}
    WaitUntilElementAndClick                              xpath=//div[118]/section/div[2]/ul/li[1]
    WaitUntilElementAndClick                              xpath=//div[118]//button
    sleep                                                 5s
