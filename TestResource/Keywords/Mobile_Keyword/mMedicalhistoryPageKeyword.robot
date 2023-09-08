*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SelectDiseaseIOS
    [Arguments]                 ${text1}
    WaitAndClick                xpath=//XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[11]/XCUIElementTypeOther[3]/XCUIElementTypeOther[1]
    WaitAndClick                xpath=//XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeWebView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[79]/XCUIElementTypeOther
    SelectCase                  ${text1}                                                                                                                                                                                                                                                                                                                             21082023                                Heal                 มหิดล

SelectCase
    [Arguments]                 ${text}                                                                                                                                                                                                                                                                                                                              ${textdate}                             ${text_treatment}    ${text_hospital}
    FOR                         ${i}                                                                                                                                                                                                                                                                                                                                 IN RANGE                                5
    ScrollDown50Percent
    ${element_visible}          Run Keyword And Return Status                                                                                                                                                                                                                                                                                                        AppiumLibrary.Text Should Be Visible    ${text}              ${timeout}
    Run Keyword If              '${element_visible}' == 'True'                                                                                                                                                                                                                                                                                                       AppiumLibrary.Click Text                ${text}
    Inputcheckwhen              ${textdate}
    InputTreatment              ${text_treatment}
    InputHospital               ${text_hospital}
    ClickButtonSave
    Run Keyword If              '${element_visible}' == 'True'                                                                                                                                                                                                                                                                                                       Exit For Loop
    Capture Page Screenshot
    END

InputCheckwhen
    [Arguments]                 ${text_date}
    Tap With Positions          100                                                                                                                                                                                                                                                                                                                                  ${150, 326}
    AppiumLibrary.Input Text    xpath=//XCUIElementTypeWindow[3]                                                                                                                                                                                                                                                                                                     ${text_date}
    Run Keyword If              '${ENV}' == 'ios'                                                                                                                                                                                                                                                                                                                    Perform iOS Specific Actions
    Capture Page Screenshot

InputTreatment
    [Arguments]                 ${text_treatment}
    Tap With Positions          100                                                                                                                                                                                                                                                                                                                                  ${580, 326}
    AppiumLibrary.Input Text    xpath=//XCUIElementTypeWindow[3]                                                                                                                                                                                                                                                                                                     ${text_treatment}
    Run Keyword If              '${ENV}' == 'ios'                                                                                                                                                                                                                                                                                                                    Perform iOS Specific Actions
    Capture Page Screenshot

InputHospital
    [Arguments]                 ${text_hospital}
    Tap With Positions          100                                                                                                                                                                                                                                                                                                                                  ${580, 326}
    AppiumLibrary.Input Text    xpath=//XCUIElementTypeWindow[3]                                                                                                                                                                                                                                                                                                     ${text_hospital}
    Run Keyword If              '${ENV}' == 'ios'                                                                                                                                                                                                                                                                                                                    Perform iOS Specific Actions
    Capture Page Screenshot

ClickButtonSave
    Tap With Positions          100                                                                                                                                                                                                                                                                                                                                  ${519, 515}
    WaitElement2sec
    Capture Page Screenshot