*** Variables ***
@{devicesName}                        GalaxyTabS6                                                                                                                                                                                                                                                                                                                                                                         GalaxyTabS6Lite                                                                                                                                                                                                                                        Emulator
${JsonfilePath}                       TestResource/DataTest/Data_Json/Mobile.json


#### Locator Android ####
&{PICTURE_PERMISSION}                 android=//android.widget.Button[1]
&{LOCATION_PERMISSION}                android=//android.widget.Button[1]
&{PHOTO_PERMISSION}                   android=//android.widget.Button[1]
&{FILE_PERMISSION}                    android=//android.widget.Button[1]

&{MOBILE_TXT_DISCLAIMER}              android=//android.widget.TextView[@text='Disclaimer']
&{MOBILE_TXT_MENU}                    android=//android.widget.TextView[@text='ประกันชีวิตควบการลงทุน']

&{BTN_OK_MOBILE}                      android=//android.view.View[@content-desc="ตกลง"]
&{TXT_USERNAME_MOBILE}                android=//android.view.View[1]/android.widget.EditText
&{TXT_PASSWORD_MOBILE}                android=//android.view.View[2]/android.widget.EditText
&{BTN_LOGIN_MOBILE}                   android=//android.view.View[@content-desc="Login"]
&{BTN_CONFIRM_MOBILE}                 android=//android.widget.FrameLayout[@resource-id='ilp:id/content']
&{TXT_PASSCODE}                       android=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/passcodelock_title']
&{BTN_NUMBER_1}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button1']
&{BTN_NUMBER_2}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button2']
&{BTN_NUMBER_3}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button3']
&{BTN_NUMBER_4}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button4']
&{BTN_NUMBER_5}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button5']
&{BTN_NUMBER_6}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button6']
&{BTN_NUMBER_7}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button7']
&{BTN_NUMBER_8}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button8']
&{BTN_NUMBER_9}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button9']
&{BTN_NUMBER_0}                       android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/button0']
&{BTN_OK_PASSCODE}                    android=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/passcode_confirm_btn']

&{TXT_POPUP_APPLICATION}              android=//android.webkit.WebView/android.view.View
&{TXT_TITLE_QUOTATION_MOBILE}         android=//android.view.View[@content-desc="ILP E-Quotation สร้างใบเสนอขายแบบประกันชีวิตควบการลงทุน"]
&{TXT_TITLE_APPLICATION_MOBILE}       android=//android.view.View[@content-desc="ILP E-Application สร้างใบคำขอผลิตภัณฑ์ประกันชีวิตควบการลงทุน"]

&{BTN_CREATE_APPLICATION_MOBILE}      android=//android.widget.TextView[@text='สร้างใบคำขอ']
${BTN_CREATE_QUOTATION_MOBILE}        xpath=//android.widget.TextView[@text='สร้างใบเสนอขายใหม่']
${BTN_CONFIRM_INTERESTED_MOBILE}      xpath=//android.app.Dialog[@resource-id='dialog-confirm-interested-product']

${TXT_PATH_MENU}                      //android.view.View[2]/android.view.View[1]/android.view.View[2]
${TXT_PATH_MENU_SIMU}                 //android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]/android.view.View[5]

&{TXT_SECTION1}                       android=${TXT_PATH_MENU}/android.view.View[1]/android.view.View[1]/android.widget.TextView
&{TXT_SECTION2}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View/android.widget.TextView
&{TXT_SECTION3}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[3]/android.view.View/android.widget.TextView
&{TXT_SECTION4}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[4]/android.view.View/android.widget.TextView
&{TXT_SECTION5}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[5]/android.view.View/android.widget.TextView
&{TXT_SECTION6}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[6]/android.view.View/android.widget.TextView
&{TXT_SECTION7}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[7]/android.view.View/android.widget.TextView
&{TXT_SECTION8}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[8]/android.view.View/android.widget.TextView
&{TXT_SECTION9}                       android=//android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[9]/android.view.View/android.widget.TextView


&{TXT_SUBSECTION2}                    android=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1]/android.view.View[2]/android.view.View[2]/android.view.View[2]/android.widget.TextView[1]                                                                                                                                                                                 memo=${TXT_PATH_MENU_SIMU}/android.view.View[2]/android.view.View[2]/android.view.View

${TXT_LIFEMOBILE}                     xpath=//android.view.View[@resource-id='quotation-info']/android.view.View[2]/android.view.View[2]
${TXT_ACCIDENTMOBILE}                 xpath=//android.view.View[@resource-id='quotation-info']/android.view.View[2]/android.view.View[3]
&{TXT_IMPORTANTMOBILE}                android=//android.widget.TextView[@text='ที่ต้องตอบ']                                                                                                                                                                                                                                                                                                                               memo=//android.view.View[@text='ที่ต้องตอบ']
${BTN_F2FMOBILE}                      xpath=//android.view.View/android.widget.Button[@text='ขายแบบพบหน้า']
${BTN_NONF2FMOBILE}                   xpath=//android.view.View/android.widget.Button[@text='ขายแบบไม่พบหน้า']
&{DDL_DOCMOBILE}                      android=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView                                                                                                                                                                                          memo=//android.view.View[@resource-id='react-select-2--value']

${TXT_MOBILE}                         //android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/
${TXT_NAME_MOBILE}                    xpath=${TXT_MOBILE}/android.widget.EditText[1]
${TXT_LASTNAME_MOBILE}                xpath=${TXT_MOBILE}/android.widget.EditText[2]

${RDO_MALE_MOBILE}                    xpath=${TXT_MOBILE}/android.widget.TextView[5]
${RDO_FEMALE_MOBILE}                  xpath=${TXT_MOBILE}/android.widget.TextView[6]
${BTN_BIRTHDAY_MOBILE}                xpath=//android.widget.EditText[@resource-id='insBirthdate']
${BTN_PAYBIRTHDAY_MOBILE}             xpath=//android.widget.EditText[@resource-id='payBirthdate']

${DDL_BIRTHDAY_MOBILE_MONTH_First}    xpath=//android.widget.NumberPicker[2]/android.widget.Button
${DDL_BIRTHDAY_MOBILE_PRR_First}      xpath=//android.widget.NumberPicker[3]/android.widget.Button
${DDL_BIRTHDAY_MOBILE_PRR}            xpath=//android.widget.NumberPicker[3]/android.widget.Button[1]
${TXT_AGE_MOBILE}                     xpath=${TXT_MOBILE}/android.widget.EditText[3]
${BTN_OCCUPTION_MOBILE}               xpath=${TXT_MOBILE}/android.widget.TextView[14]
${BTN_OCCUPTION2_MOBILE}              xpath=${TXT_MOBILE}/android.widget.TextView[15]
&{TXT_OCCUPTION_MOBILE}               android=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.ilp:id/occ_edittext_search']
&{TXT_SELECTOCCUPTION_MOBILE}         android=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/agm_list_item_code']

${BTN_NEXT_MOBILE}                    xpath=${TXT_MOBILE}android.view.View[6]/android.widget.Image

${MENU_PAYERINSURANCE}                xpath=//android.view.View[2]/android.view.View/android.view.View/android.widget.TabWidget/android.view.View[@resource-id='add-tab-2']
${MENU_INSURANCE}                     xpath=//android.view.View[2]/android.view.View/android.view.View/android.widget.TabWidget/android.view.View[@resource-id='add-tab-3']
${BTN_ADD_INSURANCE}                  xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View

&{TXT_SEARCHINSURANCE}                android=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.ilp:id/prod_edittext_search']                                                                                                                                                                                                                                                                             memo=//android.widget.EditText[@resource-id='com.tokiomarine.fasttrack.memo:id/prod_edittext_search']
&{TXT_GROUPSAVING}                    android=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/prod_group_saving_text']                                                                                                                                                                                                                                                                           memo=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.memo:id/prod_group_saving_text']
&{TXT_ITEMCODE}                       android=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.ilp:id/product_item_code']                                                                                                                                                                                                                                                                                memo=//android.widget.TextView[@resource-id='com.tokiomarine.fasttrack.memo:id/product_item_code']

${LOCATOR_INSURANCE}                  //android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View
${TXT_SELECT}                         xpath=//android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View
${TXT_SUMINSURED_MOBILE}              xpath=${LOCATOR_INSURANCE}/android.view.View[3]/android.widget.EditText
${TXT_SUMINSURED1_MOBILE}             xpath=${LOCATOR_INSURANCE}/android.view.View[4]/android.widget.EditText

${TXT_MONTH_MOBILE}                   xpath=${LOCATOR_INSURANCE}/android.widget.TextView[2]
${TXT_MONTH3_MOBILE}                  xpath=${LOCATOR_INSURANCE}/android.widget.TextView[3]
${TXT_MONTH6_MOBILE}                  xpath=${LOCATOR_INSURANCE}/android.widget.TextView[4]

${MENU_SUMMARY}                       xpath=//android.view.View[2]/android.view.View/android.view.View/android.widget.TabWidget/android.view.View[@resource-id='add-tab-4']
${BTN_DOCUMENT}                       xpath=//android.view.View[@content-desc="ดู/แชร์ใบเสนอขาย"]

${BTN_OPENDOCUMENT}                   xpath=//android.webkit.WebView/android.view.View/android.widget.Button
&{BTN_SAVEDOCUMENT}                   android=//android.widget.LinearLayout[@resource-id='com.tokiomarine.fasttrack.ilp:id/btn_save']
${BTN_SAVE_MOBILE}                    xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[5]
${BTN_BACKHOME_MOBILE}                xpath=//android.view.View[2]/android.view.View/android.view.View/android.widget.TabWidget/android.view.View[1]

&{TXT_ID_MOBILE}                      android=//android.view.View[2]/android.widget.ListView/android.view.View[1]
&{TXT_ID1_MOBILE}                     android=//android.view.View[2]/android.widget.ListView/android.view.View[2]
${TXT_INSURED_IDNO}                   xpath=//android.widget.EditText[@resource-id='Insured_IdNo']
${TXT_INSURED_LASERCODE}              xpath=//android.widget.EditText[@resource-id='Insured_LaserCode']
&{DDL_TITLE_MOBILE}                   android=//android.view.View[@resource-id='react-select-3--value']
&{DDL_TITLE_MR_MOBILE}                android=//android.widget.ListView[@resource-id='react-select-3--list']/android.view.View[1]
${TXT_INSURED_THNAME_FIRST}           xpath=//android.widget.EditText[@resource-id='Insured_ThName_First']
${TXT_INSURED_THNAME_LAST}            xpath=//android.widget.EditText[@resource-id='Insured_ThName_Last']


${TXT_MAIN_SECTION1}                  //android.view.View[@resource-id='EAppFormList']

&{DDL_NATION}                         android=//android.view.View[@resource-id='react-select-4--value']/android.widget.TextView
&{DDL_NATION_THAI}                    android=//android.widget.ListView[@resource-id='react-select-4--list']/android.view.View[1]
&{DDL_STATUS}                         android=//android.view.View[@resource-id='react-select-12--value']/android.widget.TextView
&{DDL_STATUS_SINGLE}                  android=//android.widget.ListView[@resource-id='react-select-12--list']/android.view.View[1]
&{TXT_INSURED_POSTCODE_MOBILE}        android=//android.view.View[3]/android.view.View/android.view.View/android.widget.EditText                                                                                                                                                                                                                                                                                          memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.view.View[2]/android.widget.EditText
&{TXT_INSURED_MOBILENO_MOBILE}        android=//android.widget.EditText[@resource-id='Insured_MobileNo']                                                                                                                                                                                                                                                                                                                  memo=//android.widget.EditText[@resource-id='Insured_MobileNo']
&{TXT_INSURED_EMAIL_MOBILE}           android=//android.widget.EditText[@resource-id='Insured_Email']                                                                                                                                                                                                                                                                                                                     memo=//android.widget.EditText[@resource-id='Insured_Email']
&{TXT_SELECT_POSTCODE}                android=//android.view.View[3]/android.view.View/android.widget.ListView/android.view.View[1]                                                                                                                                                                                                                                                                                       memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[3]/android.view.View/android.widget.ListView/android.view.View[1]
&{BTN_CURRENT_ADDRESS}                android=//android.widget.TextView[@text='คัดลอกจากที่อยู่ปัจจุบันผู้ขอเอาประกัน']                                                                                                                                                                                                                                                                                                   memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[1]
&{BTN_WORK_ADDRESS}                   android=//android.widget.TextView[@text='คัดลอกจากที่อยู่ตามทะเบียนบ้านผู้ขอเอาประกัน']                                                                                                                                                                                                                                                                                             memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[5]/android.view.View/android.view.View[1]

&{TXT_CURRENT_ADDRESS}                android=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[1]                                                                                                                                                                                                                                                                                     memo=//android.view.View[@resource-id='Insured_ContactAddressId']/android.view.View[1]
&{TXT_REGISTER_ADDRESS}               android=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[2]                                                                                                                                                                                                                                                                                     memo=//android.view.View[@resource-id='Insured_ContactAddressId']/android.view.View[2]
&{TXT_BUSINESS_ADDRESS}               android=//android.view.View[@resource-id='Insured_ContactAddressId']/android.widget.TextView[3]                                                                                                                                                                                                                                                                                     memo=//android.view.View[@resource-id='Insured_ContactAddressId']/android.view.View[3]

&{BTN_INSURED_MOTORCYCLE}             android=//android.view.View[@resource-id='Insured_MotorcycleFlag']/android.widget.TextView[2]                                                                                                                                                                                                                                                                                       memo=/android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[6]/android.view.View/android.view.View[2]/android.view.View[2]

${TXT_INSURED_EXPIRYDATE}             xpath=//android.widget.EditText[@resource-id='Insured_IdExpiryDate']
${TXT_INSURED_BIRTHDAY}               xpath=//android.widget.EditText[@resource-id='Insured_BirthDate']

${TXT_EXPIREDATE1_MOBILE}             xpath=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[4]/android.view.View/android.view.View[2]/android.widget.EditText
${BTN_EXPIREDATEOK_MOBILE}            xpath=//android.widget.Button[3]
${TXT_BIRTHDATE_MOBILE}               xpath=//android.widget.EditText[@resource-id='Insured_BirthDate']
${BTN_BIRTHDATEOK_MOBILE}             xpath=//android.widget.Button[3]

${BTN_PAYER_EXPIREDATEOK_MOBILE}      xpath=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/agm_th_datepicker_ok_btn']
${BTN_PAYER_BIRTHDATEOK_MOBILE}       xpath=//android.widget.Button[@resource-id='com.tokiomarine.fasttrack.ilp:id/agm_th_datepicker_ok_btn']

${RDO_ISSTUDENT_MOOBILE}              xpath=//android.view.View[8]/android.view.View/android.view.View/android.widget.TextView[1]
${RDO_NOTISSTUDENT_MOOBILE}           xpath=//android.view.View[8]/android.view.View/android.view.View/android.widget.TextView[2]

${DDL_TITLE_FATHER}                   xpath=//android.view.View[@resource-id='react-select-5--value']
${DDL_TITLE_FATHER_MR_MOBILE}         xpath=//android.widget.ListView/android.view.View[1]
${TXT_INSURED_FATHERNAME_FIRST}       xpath=//android.widget.EditText[@resource-id='Insured_FatherName_First']
${TXT_INSURED_FATHERNAME_LAST}        xpath=//android.widget.EditText[@resource-id='Insured_FatherName_Last']
&{RDO_FATHER_ALIVE_MOBILE}            android=//android.view.View[@resource-id='Insured_IsFatherAlive']/android.widget.TextView[1]                                                                                                                                                                                                                                                                                        memo=//android.view.View[@resource-id='Insured_IsFatherAlive']/android.view.View[1]
&{RDO_FATHER_NOT_ALIVE_MOBILE}        android=//android.view.View[@resource-id='Insured_IsFatherAlive']/android.widget.TextView[2]                                                                                                                                                                                                                                                                                        memo=//android.view.View[@resource-id='Insured_IsFatherAlive']/android.view.View[2]

${DDL_TITLE_MOTHER}                   xpath=//android.view.View[@resource-id='react-select-6--value']
${DDL_TITLE_MISS_MOBILE}              xpath=//android.widget.ListView/android.view.View[2]
${TXT_INSURED_MOTHERNAME_FIRST}       xpath=//android.widget.EditText[@resource-id='Insured_MotherName_First']
${TXT_INSURED_MOTHERNAME_LAST}        xpath=//android.widget.EditText[@resource-id='Insured_MotherName_Last']
&{RDO_MOTHER_ALIVE_MOBILE}            android=//android.view.View[@resource-id='Insured_IsMotherAlive']/android.widget.TextView[1]                                                                                                                                                                                                                                                                                        memo=//android.view.View[@resource-id='Insured_IsMotherAlive']/android.view.View[1]
&{RDO_MOTHER_NOT_ALIVE_MOBILE}        android=//android.view.View[@resource-id='Insured_IsMotherAlive']/android.widget.TextView[2]                                                                                                                                                                                                                                                                                        memo=//android.view.View[@resource-id='Insured_IsMotherAlive']/android.view.View[2]

${TXT_POSTCODE_MOBILE}                xpath=//android.view.View[13]/android.view.View/android.view.View/android.widget.EditText
${TXT_SELECTPOSTCODE_MOBILE}          xpath=//android.view.View[13]/android.view.View/android.widget.ListView/android.view.View[1]
${BTN_COPYADDRESS}                    xpath=//android.view.View[19]/android.view.View/android.widget.TextView[2]

&{DDL_PAYER_TITLE_MOBILE}             android=//android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.TextView                                                                                                                                                                                                               memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[4]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[1]

&{DDL_RELATION_MOBILE}                android=//android.view.View[2]/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]                                                                                                                                                                                             memo=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View/android.view.View[1]
${DDL_RELATIONFIRST_MOBILE}           xpath=//android.view.View/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[1]
${DDL_DOC_MOBILE}                     xpath=//android.view.View[@resource-id='react-select-8--value']/android.widget.TextView
${TXT_PAYER_IDNO}                     xpath=//android.widget.EditText[@resource-id='Payer_IdNo']
${TXT_PAYER_LASERCODE}                xpath=//android.widget.EditText[@resource-id='Payer_LaserCode']
${TXT_PAYER_THNAME_FIRST}             xpath=//android.widget.EditText[@resource-id='Payer_ThName_First']
${TXT_PAYER_THNAME_LAST}              xpath=//android.widget.EditText[@resource-id='Payer_ThName_Last']
${TXT_PAYER_MOBILENO}                 xpath=//android.widget.EditText[@resource-id='Payer_MobileNo']
${TXT_PAYER_EMAIL}                    xpath=//android.widget.EditText[@resource-id='Payer_Email']

&{DDL_PAYER_NATION}                   android=//android.widget.TextView[@text='กรุณาเลือก']                                                                                                                                                                                                                                                                                                                               memo=//android.view.View[@text='กรุณาเลือก']

&{DDL_YEAR_PRE_MOBILE}                android=//android.widget.DatePicker/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.Button[2]

${TXT_INSURED_HASEXISTINGPOLICIES}    xpath=//android.view.View[@resource-id='Insured_HasExistingPolicies']/android.widget.TextView[2]
${TXT_INSURED_HASBEENREJECTED}        xpath=//android.view.View[@resource-id='Insured_HasBeenRejected']/android.widget.TextView[2]
${TXT_INSURED_INVOLVEDINNARCOTICS}    xpath=//android.view.View[@resource-id='Insured_InvolvedInNarcotics']/android.widget.TextView[2]
${TXT_INSURED_DRUGFLAG}               xpath=//android.view.View[@resource-id='Insured_DrugFlag']/android.widget.TextView[2]
${TXT_INSURED_ALCOHOLFLAG}            xpath=//android.view.View[@resource-id='Insured_AlcoholFlag']/android.widget.TextView[2]
${TXT_INSURED_SMOKEFLAG}              xpath=//android.view.View[@resource-id='Insured_SmokeFlag']/android.widget.TextView[2]
${TXT_INSURED_HASWEIGHTCHANGE}        xpath=//android.view.View[@resource-id='Insured_HasWeightChange']/android.widget.TextView[2]
${TXT_INSURED_HASFAMILYHISTORY}       xpath=//android.view.View[@resource-id='Insured_HasFamilyHistory']/android.widget.TextView[2]
${TXT_INSURED_HASSPOUSELIVERHIV}      xpath=//android.view.View[@resource-id='Insured_HasSpouseLiverHiv']/android.widget.TextView[2]

${TXT_INSURED_HASDIAGNOSIS}           xpath=//android.view.View[@resource-id='Insured_HasDiagnosis']/android.widget.TextView[2]
${TXT_INSURED_HASTREATMENT}           xpath=//android.view.View[@resource-id='Insured_HasTreatment']/android.widget.TextView[2]

${Path}                               xpath=//android.view.View[2]/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[3]

### Payment ###
${TXT_PROGRESS}                       xpath=//android.view.View[@content-desc="ความสมบูรณ์ของใบคำขอ"]
${TXT_INPUT_PAYMENT}                  xpath=//android.view.View[@text='กรอกข้อมูล' and @index='19']

${TXT_ALERT_PAYMENT}                  xpath=//android.view.View[@resource-id='EAppFormList']/android.view.View[1]/android.view.View/android.view.View/android.widget.TextView
${TXT_PAYMENT}                        งวดการชำระเบี้ยที่ท่านระบุเป็นรายเดือน ดังนั้นการชำระเบี้ยงวดถัดไปต้องสมัครเป็นวิธีหักบัตรเครดิตอัตโนมัติ หรือหักผ่านบัญชีธนาคารเท่านั้น กรุณาเตรียมข้อมูลบัตรเครดิต/บัญชีธนาคารเพื่อสมัครบริการดังกล่าว มิฉะนั้นท่านจะไม่สามารถนำส่งใบคำขอได้ กรณีที่ท่านไม่มีบัตรเครดิตหรือบัญชีธนาคาร ท่านสามารถเปลี่ยนงวดการชำระเบี้ยเป็นราย 3 เดือน ราย 6 เดือน หรือรายปีและดำเนินการต่อได้

${BTN_METHOD_CREDITCARD}              xpath=//android.view.View[@resource-id='EAppFormList']/android.view.View[1]/android.view.View/android.view.View[3]
${BTN_METHOD_BANK}                    xpath=//android.view.View[@resource-id='EAppFormList']/android.view.View[1]/android.view.View/android.view.View[4]
${BTN_METHOD_OTHER}                   xpath=//android.view.View[@resource-id='EAppFormList']/android.view.View[1]/android.view.View/android.view.View[5]

&{DDL_BANK_NAME}                      android=//android.view.View[@index=7]/android.view.View/android.view.View/android.view.View[1]                                                                                                                                                                                                                                                                                      memo=//android.view.View[@resource-id='react-select-11--value']

&{DDL_EXPIRY_MONTH}                   android=//android.view.View[@index=11]/android.view.View/android.view.View/android.view.View[1]                                                                                                                                                                                                                                                                                     memo=//android.view.View/android.view.View[10]/android.view.View/android.view.View/android.view.View[1]
&{DDL_EXPIRY_YEAR}                    android=//android.view.View[@index=12]/android.view.View/android.view.View/android.view.View[1]                                                                                                                                                                                                                                                                                     memo=//android.view.View/android.view.View[11]/android.view.View/android.view.View/android.view.View[1]
&{DDL_RELATION_CARD}                  android=//android.view.View[14]/android.view.View/android.view.View                                                                                                                                                                                                                                                                                                                 memo=//android.view.View[14]/android.view.View/android.view.View/android.view.View[1]
${DDL_PAY_DATE}                       xpath=//android.view.View[@resource-id='react-select-15--value']