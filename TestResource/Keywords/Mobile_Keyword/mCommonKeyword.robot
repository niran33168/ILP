*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
WaitAndClick
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${element_visible}' == 'True'                                                                         AppiumLibrary.Click Element                    ${locator}
    Run Keyword If                    '${ENV}' == 'ios'                                                                                      Perform iOS Specific Actions
    Capture Page Screenshot

Perform iOS Specific Actions
    Sleep                             3s
    AppiumLibrary.Hide Keyboard       Done

WaitAndInput
    [Arguments]                       ${locator}                                                                                             ${text}                                        ${timeout}=none
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${element_visible}' == 'True'                                                                         AppiumLibrary.Input Text                       ${locator}                                       ${text}
    Run Keyword If                    '${ENV}' == 'ios'                                                                                      Perform iOS Specific Actions
    Capture Page Screenshot

WaitAndTap
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Tap                              ${locator}
    Run Keyword If                    '${ENV}' == 'ios'                                                                                      Run Keywords                                   sleep                                            3s
    ...                               AND                                                                                                    AppiumLibrary.Hide Keyboard                    Done
    Capture Page Screenshot

VerifyText
    [Arguments]                       ${locator}                                                                                             ${text}
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Element Text Should Be           ${locator}                                       ${text}
    ...                               ELSE                                                                                                   Run Keywords                                   Log                                              False                                  AND                                    AppiumLibrary.Capture Page Screenshot

mGetDevices
    [Arguments]                       ${devicesName}                                                                                         ${configPath}
    [Documentation]                   This Keyword for Get Data From Devices
    ...
    ...                               *Format keyword*
    ...                               mGetDevices | ${devicesName} | ${configPath} | ${appPackage} | ${appActivity}
    ...
    ...                               *Example keyword*
    ...                               mGetDevices | ${DeviceName_Galaxy A8} | ${JsonfilePath} | ${AppNameAisDigi} | ${AppActivityAisDigi}
    ${Devices}                        Get Devices                                                                                            ${devicesName}                                 ${configPath}
    AppiumLibrary.Open Application    http://${Devices['IPAppium']}/wd/hub                                                                   platformName=${Devices['platformName']}        platformVersion=${Devices['platformVersion']}    deviceName=${Devices['deviceName']}    appPackage=${Devices['appPackage']}    appActivity=${Devices['appActivity']}
    ...                               noReset=${Devices['noReset']}                                                                          unicodeKeyboard=true                           automationName=UiAutomator2
    [Return]                          ${Devices['noReset']}


Get Devices
    [Arguments]                       ${SelectDevices}                                                                                       ${ConfigPath}
    [Documentation]                   This Keyword for get Devices Detail From Jsonfile
    ...
    ...                               *Format keyword*
    ...                               Get Devices | ${SelectDevices} | ${ConfigPath}
    ...
    ...                               *Example keyword*
    ...                               Get Devices | ${devicesName} | ${configPath}
    ${Json}                           Get File                                                                                               ${ConfigPath}
    ${Obj}                            Evaluate                                                                                               json.loads("""${Json}""")                      json
    ${Data}                           Set Variable                                                                                           ${Obj['Data']}
    ${Len}                            Get Length                                                                                             ${Data}
    FOR                               ${i}                                                                                                   IN RANGE                                       0                                                ${Len}
    Log                               ${Data[${i}]}
    ${Key}                            Get Dictionary Keys                                                                                    ${Data[${i}]}
    Log                               "${Key[0]}" : "${SelectDevices}"
    ${Devices_Detail}                 Run Keyword And Return If                                                                              "${Key[0]}"=="${SelectDevices}"                mPrint Detail Selected Device                    ${Data[${i}]}                          ${SelectDevices}
    END
    [Return]                          ${Devices_Detail}

mPrint Detail Selected Device
    [Arguments]                       ${i}                                                                                                   ${DeviceName}
    [Documentation]                   This Keyword for Print Detail Devices
    ...
    ...                               *Format keyword*
    ...                               mPrint Detail Selected Device | ${i} | ${DeviceName}
    ...
    ...                               *Example keyword*
    ...                               mPrint Detail Selected Device | ${Data[${i}]} | ${SelectDevices}
    ${Set_New_Var}                    Set Variable                                                                                           ${i}
    ${Set_New_Var}                    Set Variable                                                                                           ${set_New_Var['${DeviceName}']}
    ${Set_New_Var}                    Set Variable                                                                                           ${Set_New_Var[0]}
    [Return]                          ${Set_New_Var}

ScrollDown50Percent
    AppiumLibrary.Swipe By Percent    ${90}                                                                                                  ${50}                                          ${90}                                            ${0}

SwipeUp
    AppiumLibrary.Swipe               1000                                                                                                   600                                            1000                                             150

WaitElement2sec
    BuiltIn.Sleep                     2s

WaitElement5sec
    BuiltIn.Sleep                     5s

SwipeFindLocator
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    FOR                               ${index}                                                                                               IN RANGE                                       5
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${element_visible}' == 'False'                                                                        AppiumLibrary.Swipe                            2000                                             800                                    2000                                   200
    Run Keyword If                    '${element_visible}' == 'True'                                                                         Exit For Loop
    END

SwipeFindLocatorIOS
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    FOR                               ${index}                                                                                               IN RANGE                                       5
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${element_visible}' == 'False'                                                                        AppiumLibrary.Swipe By Percent                 ${90}                                            ${30}                                  ${90}                                  ${0}
    Run Keyword If                    '${element_visible}' == 'True'                                                                         Exit For Loop
    END

SwipeFindText
    [Arguments]                       ${text}                                                                                                ${timeout}=none
    FOR                               ${index}                                                                                               IN RANGE                                       5
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Page Contains         ${text}                                          ${timeout}
    Run Keyword If                    '${element_visible}' == 'False'                                                                        AppiumLibrary.Swipe                            2000                                             800                                    2000                                   200
    Run Keyword If                    '${element_visible}' == 'True'                                                                         Exit For Loop
    END

SwipeFindTextIOS
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    FOR                               ${index}                                                                                               IN RANGE                                       5
    ${element_visible}                Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Page Contains         ${text}                                          ${timeout}
    Run Keyword If                    '${element_visible}' == 'False'                                                                        AppiumLibrary.Swipe By Percent                 ${90}                                            ${30}                                  ${90}                                  ${0}
    Run Keyword If                    '${element_visible}' == 'True'                                                                         Exit For Loop
    END
