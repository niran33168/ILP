*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
LoginAppFastTrack
    [Arguments]                                    ${devicesName}
    ${Devices}                                     Get Devices                                       ${devicesName}                   ${JsonfilePath}
    IF                                             '${Devices['platformName']}' == 'iOS'             OpenAppiOS                       ${Devices}
    ...                                            ELSE                                              OpenAppAndroid                   ${Devices}
    VerifyLandingPage

OpenAppAndroid
    [Arguments]                                    ${Devices}
    Open Application                               http://${Devices['IPAppium']}/wd/hub              platformName=android             platformVersion=${Devices['platformVersion']}
    ...                                            deviceName=${Devices['deviceName']}               automationName=UiAutomator2      appPackage=${Devices['appPackage']}              appActivity=${Devices['appActivity']}
    ...                                            noReset=${Devices['noReset']}                     unicodeKeyboard=true
    CheckPermissionAndroid

OpenAppiOS
    [Arguments]                                    ${Devices}
    Open Application                               http://${Devices['IPAppium']}/wd/hub              platformName=iOS                 platformVersion=${Devices['platformVersion']}
    ...                                            deviceName=${Devices['deviceName']}               automationName=XCUITest          UDID=${Devices['UDID']}
    ...                                            app=${Devices['app']}                             noReset=${Devices['noReset']}
    CheckPermissionIOS

CheckPermissionAndroid
    WaitAndClick                                   ${PICTURE_PERMISSION['${ENV}']}                   ${timeout}
    WaitAndClick                                   ${LOCATION_PERMISSION['${ENV}']}                  ${timeout}
    WaitAndClick                                   ${PHOTO_PERMISSION['${ENV}']}                     ${timeout}

CheckPermissionIOS
    WaitAndClick                                   ${LOCATION_PERMISSION['${ENV}']}                  ${timeout}
    Wait Until Element Is Visible                  xpath=//XCUIElementTypeButton[@name="Confirm"]         10s
    Click Element                                   xpath=//XCUIElementTypeButton[@name="Confirm"]

VerifyLandingPage
    AppiumLibrary.Wait Until Element Is Visible    ${MOBILE_TXT_DISCLAIMER['${ENV}']}                120s
    IF                                             '${ENV}' == 'android'                             VerifyText                       ${MOBILE_TXT_DISCLAIMER['${ENV}']}               Disclaimer
    WaitAndClick                                   ${BTN_OK_MOBILE['${ENV}']}
