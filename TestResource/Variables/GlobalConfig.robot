*** Variables ***
${URL_UAT}                                                                    https://staging.tokiomarinelife.co.th/oneanddone_uat/Client/index.html
${URL_RV}                                                                     https://staging.tokiomarinelife.co.th/oneanddone_rv/Client/index.html
${timeout}                                                                    30s
${SAFARI}                                                                     safari
${CHROME}                                                                     chrome
${DISCLAIMER}                                                                 Disclaimer
${msg2}                                                                       เลือกหน้าเอกสารที่ต้องการ
${msg_passcode}                                                               รหัสผ่านตัวเลข

#### Locator Web Quotation ####
${BTN_HOMEOK}                                                                 xpath=//a[@class="btn btn-primary"]
${TXT_USERNAME}                                                               xpath=//input[@placeholder="Username"]
${TXT_PASSWORD}                                                               xpath=//input[@placeholder="Password"]
${BTN_LOGIN}                                                                  xpath=//span[contains(text(),'Login')]/../../a
${TXT_DISCLAIMER}                                                             xpath=//h3/b
${BTN_QUOTATION}                                                              xpath=//div[@id="home"]/a[1]
${BTN_APPLICATION}                                                            xpath=//div[@id="home"]/a[2]
${BTN_CREATE_QUOTATION}                                                       xpath=//span[contains(text(),'สร้างใบเสนอขาย')]/../../span
${BTN_POPUPOK}                                                                xpath=//div[@class="btn-group btn-group-justified"]//div[2]/button
${TXT_NAME}                                                                   xpath=//input[@id="name"]
${TXT_LASTNAME}                                                               xpath=//input[@id="lastname"]
${RDO_MALE}                                                                   xpath=//label[@for="InsGender-male"]
${RDO_FEMALE}                                                                 xpath=//label[@for="InsGender-female"]
${TXT_AGE}                                                                    xpath=//div[@class="mt-10 clearfix buttom-xs-inf"]//input
${DDL_OCCUPTION}                                                              xpath=//div[@class="form-group form-group-xs"]//button
${TXT_OCCUPTION}                                                              xpath=//div[@id="information"]//div[5]//input
${DDL_SELCET_OCCUPTION}                                                       xpath=//div[@id="information"]/div/div[5]//ul/div[1]/li/a
${TXT_NAME2}                                                                  xpath=//div[@id="payment"]/div/div[1]//input[@id="name"]
${TXT_LASTNAME2}                                                              xpath=//div[@id="payment"]/div/div[1]//input[@id="lastname"]
${RDO_MALE2}                                                                  xpath=//label[@for="PayGender-male"]
${RDO_FEMALE2}                                                                xpath=//label[@for="PayGender-female"]
${TXT_AGE2}                                                                   xpath=//div[@id="payment"]//input[@class='age']
${DDL_OCCUPTION2}                                                             xpath=//div[@id="payment"]//button
${TXT_OCCUPTION2}                                                             xpath=//div[@id="payment"]//input[@id="occupation"]
${DDL_SELCET_OCCUPTION2}                                                      xpath=//div[@id="payment"]//div[1]/li/a
${BTN_NEXT}                                                                   xpath=//div[@class="row text-center next-button-container"]//a

${DDL_CONTRACT}                                                               xpath=//div[@id="type"]//select
${DDL_BASICLIST}                                                              xpath=//button[@id="basicList"]
${TXT_BASICLIST}                                                              xpath=//div[@id="type"]//input
${DDL_FILTER}                                                                 xpath=//div[@id="headingOne"]/h4/a
${TXT_SUMINSURED}                                                             xpath=//div[@class="form-group-body"]//tr[1]/td[2]/input
${TXT_PREMIUM}                                                                xpath=//div[@class="form-group-body"]//tr[1]/td[3]/input

${TXT_MSG2}                                                                   xpath=//div[@id="dialog-select-preview"]//h3/span
${BTN_SUMMARY}                                                                xpath=//div[@id="agm-summary-menu"]//a
${BTN_OPEN_DOCUMENT}                                                          xpath=//div[@id="dialog-select-preview"]//div[1]/button
${BTN_DOWNLOAD_DOCUMENT}                                                      xpath=//div[@id="dialog-select-preview"]//div[2]/button
${BTN_SEND_EMAIL}                                                             xpath=//div[@id="dialog-select-preview"]//div[3]//div[3]/button

${TXT_SEND_FROM}                                                              xpath=//input[@name="sendFrom"]
${TXT_SEND_TO}                                                                xpath=//input[@name="sendTo"]
${BTN_CONFIRM}                                                                xpath=//div[@id="dialog-send-email"]//div[2]/button

${BTN_SAVE}                                                                   xpath=//div[@id="add"]//a[@class="btn btn-step btn-info"]

${ITEM_SELECT}                                                                xpath=//div[@id="page-quotation"]//div[2]//div[1]/div[2]/a[1]
${BTN_EDIT}                                                                   xpath=//div[3]//div[1]//div[2]//div[3]//li[1]/a
${BTN_DELETE}                                                                 xpath=//div[3]//div[1]//div[2]//div[3]//li[5]/a

#### Locator Chrome ####
${BTN_ALERT}                                                                  xpath=//div[@id="modal-alert"]//button[@class="btn btn-primary"]

#### Locator Web Application ####
${BTN_EDIT_FORM}                                                              xpath=//span/span[text() = 'แก้ไข']
${BTN_DIALOG_OK}                                                              xpath=//div[@id="modal-alert"]//button
${BTN_CREATE_FROM}                                                            xpath=//div[@id="page-content"]/div/div[2]/div/div[2]/div/div/div[1]/div/button
${BTN_LIFE_INSURANCE}                                                         xpath=//span[contains(text(),'ประกันชีวิต')]/../../../button[1]
${BTN_ACCIDENT_INSURANCE}                                                     xpath=//span[contains(text(),'ประกันอุบัติเหตุ')]/../../../button[1]
${TXT_CUSTOMER}                                                               xpath=//span[contains(text(),'ข้อมูลลูกค้า')]
${BTN_IMPORTANT}                                                              xpath=//button/span[text() = 'คำถามที่จำเป็นต้องตอบ']

${TXT_MENU_INSURED_INFORMATION}                                               xpath=//div[@id="page-content"]//ul[2]/li[1]/div
${TXT_MENU_PAYER_INFORMATION}                                                 xpath=//div[@id="page-content"]//ul[2]/li[2]/div
${TXT_MENU_PRODUCT}                                                           xpath=//div[@id="page-content"]//ul[2]/li[3]/div
${TXT_MENU_PRODUCT_SUB1}                                                      xpath=//div[@id="page-content"]//ul[2]/li[3]/ul/li[1]/div
${TXT_MENU_INSURED_HEALTH_QUESTIONNAIRE}                                      xpath=//div[@id="page-content"]//ul[2]/li[4]/div
${TXT_MENU_INSURED_HEALTH_QUESTIONNAIRE_SUB1}                                 xpath=//div[@id="page-content"]//ul[2]/li[4]/ul/li[1]/div
${TXT_MENU_ADDITIONAL_QUESTIONNAIRE_FOR_HEALTH ASSESSMENT_OF_NEWBORN}         xpath=//div[@id="page-content"]//ul[2]/li[5]/div
${TXT_MENU_ADDITIONAL_QUESTIONNAIRE_FOR_HEALTH ASSESSMENT_OF_NEWBORN_SUB1}    xpath=//div[@id="page-content"]//ul[2]/li[5]/ul/li[1]/div
${TXT_MENU_TAX}                                                               xpath=//div[@id="page-content"]//ul[2]/li[6]/div
${TXT_MENU_TAX_SUB1}                                                          xpath=//div[@id="page-content"]//ul[2]/li[6]/div

${DDL_BASIC_PLAN}                                                             xpath=//button[@id="basicList"]
${DDL_CARD_TYPE}                                                              xpath=//div[@id="react-select-2--value"]//div[@class="Select-placeholder"]

${TXT_CARD_EXPIRED}                                                           xpath=//ul/li[3]//span[text() = 'วันหมดอายุบัตร']
${TXT_CARD_ID}                                                                xpath=//li[1]//span[text() = 'หมายเลขประชาชน']
${TXT_ASSURED_NAME}                                                           xpath=//li[1]//span[text() = 'ชื่อ']
${TXT_ASSURED_LASTNAME}                                                       xpath=//li[1]//span[text() = 'นามสกุล']
${TXT_ASSURED_BIRTHDAY}                                                       xpath=//li[1]//span[text() = 'วันเกิด']

${DDL_BIRTHDAY}                                                               xapth=//ul[2]/li[1]/ul/li[8]/div
${Select_DATE}                                                                xpath=//div[8]/section/div[2]/div/div[1]/input
${DATE_YEAR}                                                                  xpath=//div[@class="datepicker-days"]//th[2]
${DATE_MONTH}                                                                 xpath=//div[@class="datepicker-months"]//th[2]

${TXT_SUM_INSURE}                                                             xpath=//div[@id="product"]//td[2]/input
${TXT_MENU_DIVIDEND}                                                          xpath=//span[text() = 'วิธีขอรับเงินปันผล / เงินคืนตามสัญญา']
${CHANEL_TRANSFER}                                                            xpath=//div[97]//ul/li[1]
${CHANEL_CHEQUE}                                                              xpath=//div[97]//ul/li[2]
${CHANEL_PAYOFF}                                                              xpath=//div[97]//ul/li[3]

${BTN_BENEFICIARY_ADD}                                                        xpath=//div[@id="slide-view"]/div[99]/div/div/button
${TXT_BENEFICIARY_NAME}                                                       xpath=//form[@id="1234"]//div[2]/div/div[2]/div/input
${TXT_BENEFICIARY_LASTNAME}                                                   xpath=//form[@id="1234"]//div[3]/div/div[2]/div/input
${TXT_BENEFICIARY_AGE}                                                        xpath=//form[@id="1234"]//div[5]/div/div[2]/div/input
${TXT_BENEFICIARY_PERCENTAGE}                                                 xpath=//form[@id="1234"]//div[6]/div/div[2]/div/input
${BTN_BENEFICIARY_OK}                                                         xpath=//form[@id="1234"]//div[7]/div[1]/button