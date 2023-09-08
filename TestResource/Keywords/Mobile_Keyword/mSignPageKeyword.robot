*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
SignDocument
    [Arguments]                 ${insured_id}
    SearchFillterApplication    ${insured_id}
    SelectFirstItem
    TabProgressSign

TabProgressSign
    Run Keyword If              '${ENV}' == 'android'                                                                      TabProgressAndroid
    ...                         ELSE                                                                                       TabProgressIOS

TabProgressAndroid
    WaitAndClick                xpath=//android.view.View[@content-desc="ความสมบูรณ์ของใบคำขอ"]/android.widget.TextView
    ScrollDown50Percent
    ScrollDown50Percent
    Capture Page Screenshot
    Tap With Positions          100                                                                                        ${2306, 1293}
    Sleep                       30s
    Capture Page Screenshot
    Tap With Positions          100                                                                                        ${2289, 660}
    Capture Page Screenshot

TabProgressIOS
    WaitAndClick                xpath=//XCUIElementTypeStaticText[@name="ความสมบูรณ์ของใบคำขอ"]
    ScrollDown50Percent
    ScrollDown50Percent
    Capture Page Screenshot
    Tap With Positions          100                                                                                        ${968, 668}
    Sleep                       30s
    Capture Page Screenshot
    Tap With Positions          100                                                                                        ${940, 292}
    Capture Page Screenshot
