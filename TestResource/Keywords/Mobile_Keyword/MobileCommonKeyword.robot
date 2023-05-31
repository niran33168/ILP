*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
WaitAndClick
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Click Element                    ${locator}
    ...                               ELSE                                                                                                   Run Keywords                                   Log                                              False                                  AND                                    AppiumLibrary.Capture Page Screenshot

WaitAndInput
    [Arguments]                       ${locator}                                                                                             ${text}                                        ${timeout}=none
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Input Text                       ${locator}                                       ${text}
    ...                               ELSE                                                                                                   Run Keywords                                   Log                                              False                                  AND                                    AppiumLibrary.Capture Page Screenshot

WaitAndTap
    [Arguments]                       ${locator}                                                                                             ${timeout}=none
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Tap                              ${locator}
    ...                               ELSE                                                                                                   Run Keywords                                   Log                                              False                                  AND                                    AppiumLibrary.Capture Page Screenshot

VerifyText
    [Arguments]                       ${locator}                                                                                             ${text}
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  AppiumLibrary.Element Text Should Be           ${locator}                                       ${text}
    ...                               ELSE                                                                                                   Run Keywords                                   Log                                              False                                  AND                                    AppiumLibrary.Capture Page Screenshot

ScrollElement
    [Arguments]                       ${locator}
    ${width}                          Get Window Width
    ${height}                         Get Window Height
    FOR                               ${index}                                                                                               IN RANGE                                       5
    ${start_x}                        Evaluate                                                                                               ${width} * 0.5
    ${start_y}                        Evaluate                                                                                               ${height} * 1
    ${end_x}                          Evaluate                                                                                               ${width} * 0.5
    ${end_y}                          Evaluate                                                                                               ${height} * 0.5
    AppiumLibrary.Swipe               ${start_x}                                                                                             ${start_y}                                     ${end_x}                                         ${end_y}                               500
    ${status}                         Run Keyword And Return Status                                                                          AppiumLibrary.Wait Until Element Is Visible    ${locator}                                       ${timeout}
    Run Keyword If                    '${status}' == 'True'                                                                                  Run Keywords                                   AppiumLibrary.Click Element                      ${locator}                             AND                                    Exit For Loop
    ...                               ELSE                                                                                                   Wait Until Keyword Succeeds                    5x                                               15s                                    WaitAndClick                           xpath=//android.widget.TextView
    END

mGetDevices
    [Arguments]                       ${devicesName}                                                                                         ${configPath}                                  ${appPackage}                                    ${appActivity}                         ${Reset}
    [Documentation]                   This Keyword for Get Data From Devices
    ...
    ...                               *Format keyword*
    ...                               mGetDevices | ${devicesName} | ${configPath} | ${appPackage} | ${appActivity}
    ...
    ...                               *Example keyword*
    ...                               mGetDevices | ${DeviceName_Galaxy A8} | ${JsonfilePath} | ${AppNameAisDigi} | ${AppActivityAisDigi}
    ${Devices}                        Get Devices                                                                                            ${devicesName}                                 ${configPath}
    AppiumLibrary.Open Application    http://${Devices['IPAppium']}/wd/hub                                                                   platformName=${Devices['platformName']}        platformVersion=${Devices['platformVersion']}    deviceName=${Devices['deviceName']}    appPackage=${Devices['appPackage']}    appActivity=${Devices['appActivity']}
    ...                               noReset=${Reset}                                                                                       unicodeKeyboard=true                           automationName=UiAutomator2
    [Return]                          ${Reset}

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

TapPoint
    [Arguments]                                    ${x}    ${y}
    Execute Adb Shell                              input tap ${x} ${y}
