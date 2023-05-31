*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
Generate_File_Path_Request
    [Arguments]              ${path_request}
    [Documentation]          - สร้าง path สำหรับไฟล์ request เพื่อให้ใช้ได้ทุกๆเครื่อง
    ${NEWDIR}=               Remove String                                                     ${CURDIR}                           ${/}Keywords${/}Mobile_Keyword
    ${file_path_request}=    Catenate                                                          SEPARATOR=${/}                      ${NEWDIR}${/}DataTest${/}${path_request}
    Set Suite Variable       ${path_request}
    Set Suite Variable       ${file_path_request}

PrepareDataQuotation
    [Arguments]              ${Test_Data}                                                      ${rowNo}                            ${testcaseName}==none
    ${json_string}           Get Binary File                                                   ${file_path_request}.json
    Log                      ${json_string}
    ${json}=                 evaluate                                                          json.loads('''${json_string}''')    json

    Run Keyword If           '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    Run Keyword If           '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    Run Keyword If           '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    Run Keyword If           '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    Run Keyword If           '${Test_Data['Menu']}'!='empty'                                   set to dictionary                   ${json}                                     Menu=${Test_Data['Menu']}
    Run Keyword If           '${Test_Data['Menu']}'=='missing'                                 Delete Object From Json             ${json}                                     $..Menu

    Run Keyword If           '${Test_Data['InsuredInformation.Name']}'!='empty'                set to dictionary                   ${json['InsuredInformation']}               Name=${Test_Data['InsuredInformation.Name']}
    Run Keyword If           '${Test_Data['InsuredInformation.Name']}'=='missing'              Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Name

    Run Keyword If           '${Test_Data['InsuredInformation.Lastname']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Lastname=${Test_Data['InsuredInformation.Lastname']}
    Run Keyword If           '${Test_Data['InsuredInformation.Lastname']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Lastname

    Run Keyword If           '${Test_Data['InsuredInformation.Gender']}'!='empty'              set to dictionary                   ${json['InsuredInformation']}               Gender=${Test_Data['InsuredInformation.Gender']}
    Run Keyword If           '${Test_Data['InsuredInformation.Gender']}'=='missing'            Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Gender

    Run Keyword If           '${Test_Data['InsuredInformation.Age']}'!='empty'                 set to dictionary                   ${json['InsuredInformation']}               Age=${Test_Data['InsuredInformation.Age']}
    Run Keyword If           '${Test_Data['InsuredInformation.Age']}'=='missing'               Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Age

    Run Keyword If           '${Test_Data['InsuredInformation.Occupation']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               Occupation=${Test_Data['InsuredInformation.Occupation']}
    Run Keyword If           '${Test_Data['InsuredInformation.Occupation']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Occupation

    Run Keyword If           '${Test_Data['PayerInformation.Name']}'!='empty'                  set to dictionary                   ${json['PayerInformation']}                 Name=${Test_Data['PayerInformation.Name']}
    Run Keyword If           '${Test_Data['PayerInformation.Name']}'=='missing'                Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Name

    Run Keyword If           '${Test_Data['PayerInformation.Lastname']}'!='empty'              set to dictionary                   ${json['PayerInformation']}                 Lastname=${Test_Data['PayerInformation.Lastname']}
    Run Keyword If           '${Test_Data['PayerInformation.Lastname']}'=='missing'            Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Lastname

    Run Keyword If           '${Test_Data['PayerInformation.Gender']}'!='empty'                set to dictionary                   ${json['PayerInformation']}                 Gender=${Test_Data['PayerInformation.Gender']}
    Run Keyword If           '${Test_Data['PayerInformation.Gender']}'=='missing'              Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Gender

    Run Keyword If           '${Test_Data['PayerInformation.Age']}'!='empty'                   set to dictionary                   ${json['PayerInformation']}                 Age=${Test_Data['PayerInformation.Age']}
    Run Keyword If           '${Test_Data['PayerInformation.Age']}'=='missing'                 Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Age

    Run Keyword If           '${Test_Data['PayerInformation.Occupation']}'!='empty'            set to dictionary                   ${json['PayerInformation']}                 Occupation=${Test_Data['PayerInformation.Occupation']}
    Run Keyword If           '${Test_Data['PayerInformation.Occupation']}'=='missing'          Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Occupation

    ${json_string}=          evaluate                                                          json.dumps(${json})                 json
    log many                 ${json_string}
    ${json_object}           Convert String to JSON                                            ${json_string}
    [Return]                 ${json_object}


PrepareDataApplication
    [Arguments]              ${Test_Data}                                                      ${rowNo}                            ${testcaseName}==none
    ${json_string}           Get Binary File                                                   ${file_path_request}.json
    Log                      ${json_string}
    ${json}=                 evaluate                                                          json.loads('''${json_string}''')    json

    Run Keyword If           '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    Run Keyword If           '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    Run Keyword If           '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    Run Keyword If           '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    Run Keyword If           '${Test_Data['Menu']}'!='empty'                                   set to dictionary                   ${json}                                     Menu=${Test_Data['Menu']}
    Run Keyword If           '${Test_Data['Menu']}'=='missing'                                 Delete Object From Json             ${json}                                     $..Menu

    Run Keyword If           '${Test_Data['InsuredInformation.Format']}'!='empty'              set to dictionary                   ${json['InsuredInformation']}               Format=${Test_Data['InsuredInformation.Format']}
    Run Keyword If           '${Test_Data['InsuredInformation.Format']}'=='missing'            Delete Object From Json             ${json['InsuredInformation']}               $..Format

    Run Keyword If           '${Test_Data['InsuredInformation.CardType']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               CardType=${Test_Data['InsuredInformation.CardType']}
    Run Keyword If           '${Test_Data['InsuredInformation.CardType']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $.InsuredInformation.CardType

    Run Keyword If           '${Test_Data['InsuredInformation.Id']}'!='empty'                  set to dictionary                   ${json['InsuredInformation']}               Id=${Test_Data['InsuredInformation.Id']}
    Run Keyword If           '${Test_Data['InsuredInformation.Id']}'=='missing'                Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Id

    Run Keyword If           '${Test_Data['InsuredInformation.LaserCode']}'!='empty'           set to dictionary                   ${json['InsuredInformation']}               LaserCode=${Test_Data['InsuredInformation.LaserCode']}
    Run Keyword If           '${Test_Data['InsuredInformation.LaserCode']}'=='missing'         Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.LsaserCode

    Run Keyword If           '${Test_Data['InsuredInformation.Title']}'!='empty'               set to dictionary                   ${json['InsuredInformation']}               Title=${Test_Data['InsuredInformation.Title']}
    Run Keyword If           '${Test_Data['InsuredInformation.Title']}'=='missing'             Delete Object From Json             ${json['InsuredInformation']}               $..Title

    Run Keyword If           '${Test_Data['InsuredInformation.Name']}'!='empty'                set to dictionary                   ${json['InsuredInformation']}               Name=${Test_Data['InsuredInformation.Name']}
    Run Keyword If           '${Test_Data['InsuredInformation.Name']}'=='missing'              Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Name

    Run Keyword If           '${Test_Data['InsuredInformation.Lastname']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Lastname=${Test_Data['InsuredInformation.Lastname']}
    Run Keyword If           '${Test_Data['InsuredInformation.Lastname']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Lastname

    Run Keyword If           '${Test_Data['InsuredInformation.Age']}'!='empty'                 set to dictionary                   ${json['InsuredInformation']}               Age=${Test_Data['InsuredInformation.Age']}
    Run Keyword If           '${Test_Data['InsuredInformation.Age']}'=='missing'               Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Age

    Run Keyword If           '${Test_Data['InsuredInformation.FatherName']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               FatherName=${Test_Data['InsuredInformation.FatherName']}
    Run Keyword If           '${Test_Data['InsuredInformation.FatherName']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherName

    Run Keyword If           '${Test_Data['InsuredInformation.FatherLastname']}'!='empty'      set to dictionary                   ${json['InsuredInformation']}               FatherLastname=${Test_Data['InsuredInformation.FatherLastname']}
    Run Keyword If           '${Test_Data['InsuredInformation.FatherLastname']}'=='missing'    Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherLastname

    Run Keyword If           '${Test_Data['InsuredInformation.FatherAlive']}'!='empty'         set to dictionary                   ${json['InsuredInformation']}               FatherAlive=${Test_Data['InsuredInformation.FatherAlive']}
    Run Keyword If           '${Test_Data['InsuredInformation.FatherAlive']}'=='missing'       Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherAlive

    Run Keyword If           '${Test_Data['InsuredInformation.MotherName']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               MotherName=${Test_Data['InsuredInformation.MotherName']}
    Run Keyword If           '${Test_Data['InsuredInformation.MotherName']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherName

    Run Keyword If           '${Test_Data['InsuredInformation.MotherLastname']}'!='empty'      set to dictionary                   ${json['InsuredInformation']}               MotherLastname=${Test_Data['InsuredInformation.MotherLastname']}
    Run Keyword If           '${Test_Data['InsuredInformation.MotherLastname']}'=='missing'    Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherLastname

    Run Keyword If           '${Test_Data['InsuredInformation.MotherAlive']}'!='empty'         set to dictionary                   ${json['InsuredInformation']}               MotherAlive=${Test_Data['InsuredInformation.MotherAlive']}
    Run Keyword If           '${Test_Data['InsuredInformation.MotherAlive']}'=='missing'       Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherAlive


    Run Keyword If           '${Test_Data['InsuredInformation.Education']}'!='empty'           set to dictionary                   ${json['InsuredInformation']}               Education=${Test_Data['InsuredInformation.Education']}
    Run Keyword If           '${Test_Data['InsuredInformation.Education']}'=='missing'         Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Education

    Run Keyword If           '${Test_Data['InsuredInformation.Postcode']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Postcode=${Test_Data['InsuredInformation.Postcode']}
    Run Keyword If           '${Test_Data['InsuredInformation.Postcode']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Postcode

    Run Keyword If           '${Test_Data['InsuredInformation.MobileNo']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               MobileNo=${Test_Data['InsuredInformation.MobileNo']}
    Run Keyword If           '${Test_Data['InsuredInformation.MobileNo']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MobileNo

    Run Keyword If           '${Test_Data['InsuredInformation.Email']}'!='empty'               set to dictionary                   ${json['InsuredInformation']}               Email=${Test_Data['InsuredInformation.Email']}
    Run Keyword If           '${Test_Data['InsuredInformation.Email']}'=='missing'             Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Email

    Run Keyword If           '${Test_Data['InsuredInformation.Contact']}'!='empty'             set to dictionary                   ${json['InsuredInformation']}               Contact=${Test_Data['InsuredInformation.Contact']}
    Run Keyword If           '${Test_Data['InsuredInformation.Contact']}'=='missing'           Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Contact

    Run Keyword If           '${Test_Data['InsuredInformation.Occupation']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               Occupation=${Test_Data['InsuredInformation.Occupation']}
    Run Keyword If           '${Test_Data['InsuredInformation.Occupation']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Occupation

    Run Keyword If           '${Test_Data['InsuredInformation.AnnualIncome']}'!='empty'        set to dictionary                   ${json['InsuredInformation']}               AnnualIncome=${Test_Data['InsuredInformation.AnnualIncome']}
    Run Keyword If           '${Test_Data['InsuredInformation.AnnualIncome']}'=='missing'      Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.AnnualIncome

    Run Keyword If           '${Test_Data['PayerInformation.Id']}'!='empty'                    set to dictionary                   ${json['PayerInformation']}                 Id=${Test_Data['PayerInformation.Id']}
    Run Keyword If           '${Test_Data['PayerInformation.Id']}'=='missing'                  Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Id

    Run Keyword If           '${Test_Data['PayerInformation.LaserCode']}'!='empty'             set to dictionary                   ${json['PayerInformation']}                 LaserCode=${Test_Data['PayerInformation.LaserCode']}
    Run Keyword If           '${Test_Data['PayerInformation.LaserCode']}'=='missing'           Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.LaserCode

    Run Keyword If           '${Test_Data['PayerInformation.Name']}'!='empty'                  set to dictionary                   ${json['PayerInformation']}                 Name=${Test_Data['PayerInformation.Name']}
    Run Keyword If           '${Test_Data['PayerInformation.Name']}'=='missing'                Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Name

    Run Keyword If           '${Test_Data['PayerInformation.Lastname']}'!='empty'              set to dictionary                   ${json['PayerInformation']}                 Lastname=${Test_Data['PayerInformation.Lastname']}
    Run Keyword If           '${Test_Data['PayerInformation.Lastname']}'=='missing'            Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Lastname

    Run Keyword If           '${Test_Data['PayerInformation.Occupation']}'!='empty'            set to dictionary                   ${json['PayerInformation']}                 Occupation=${Test_Data['PayerInformation.Occupation']}
    Run Keyword If           '${Test_Data['PayerInformation.Occupation']}'=='missing'          Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Occupation

    Run Keyword If           '${Test_Data['PayerInformation.AnnualIncome']}'!='empty'          set to dictionary                   ${json['PayerInformation']}                 AnnualIncome=${Test_Data['PayerInformation.AnnualIncome']}
    Run Keyword If           '${Test_Data['PayerInformation.AnnualIncome']}'=='missing'        Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.AnnualIncome

    Run Keyword If           '${Test_Data['Hight']}'!='empty'                                  set to dictionary                   ${json}                                     Hight=${Test_Data['Hight']}
    Run Keyword If           '${Test_Data['Hight']}'=='missing'                                Delete Object From Json             ${json}                                     $..Hight

    Run Keyword If           '${Test_Data['Weight']}'!='empty'                                 set to dictionary                   ${json}                                     Weight=${Test_Data['Weight']}
    Run Keyword If           '${Test_Data['Weight']}'=='missing'                               Delete Object From Json             ${json}                                     $..Weight

    Run Keyword If           '${Test_Data['GestationalAging']}'!='empty'                       set to dictionary                   ${json}                                     GestationalAging=${Test_Data['GestationalAging']}
    Run Keyword If           '${Test_Data['GestationalAging']}'=='missing'                     Delete Object From Json             ${json}                                     $..GestationalAging

    Run Keyword If           '${Test_Data['BirthWeight']}'!='empty'                            set to dictionary                   ${json}                                     BirthWeight=${Test_Data['BirthWeight']}
    Run Keyword If           '${Test_Data['BirthWeight']}'=='missing'                          Delete Object From Json             ${json}                                     $..BirthWeight

    Log Dictionary           ${json}
    ${json_string}=          evaluate                                                          json.dumps(${json})                 json
    log many                 ${json_string}
    ${json_object}           Convert String to JSON                                            ${json_string}
    [Return]                 ${json_object}


PrepareDataPayment
    [Arguments]              ${Test_Data}                                                      ${rowNo}                            ${testcaseName}==none
    ${json_string}           Get Binary File                                                   ${file_path_request}.json
    Log                      ${json_string}
    ${json}=                 evaluate                                                          json.loads('''${json_string}''')    json

    Run Keyword If           '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    Run Keyword If           '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    Run Keyword If           '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    Run Keyword If           '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    Run Keyword If           '${Test_Data['Payment.PaymentMethod']}'!='empty'                  set to dictionary                   ${json['Payment']}                          PaymentMethod=${Test_Data['Payment.PaymentMethod']}
    Run Keyword If           '${Test_Data['Payment.PaymentMethod']}'=='missing'                Delete Object From Json             ${json['Payment']}                          $..PaymentMethod

    Run Keyword If           '${Test_Data['Credit.BankName']}'!='empty'                        set to dictionary                   ${json['Credit']}                           BankName=${Test_Data['Credit.BankName']}
    Run Keyword If           '${Test_Data['Credit.BankName']}'=='missing'                      Delete Object From Json             ${json['Credit']}                           $..BankName

    Run Keyword If           '${Test_Data['Credit.CreditNo']}'!='empty'                        set to dictionary                   ${json['Credit']}                           CreditNo=${Test_Data['Credit.CreditNo']}
    Run Keyword If           '${Test_Data['Credit.CreditNo']}'=='missing'                      Delete Object From Json             ${json['Credit']}                           $..CreditNo

    Run Keyword If           '${Test_Data['Credit.ExpiryDateMonth']}'!='empty'                 set to dictionary                   ${json['Credit']}                           ExpiryDateMonth=${Test_Data['Credit.ExpiryDateMonth']}
    Run Keyword If           '${Test_Data['Credit.ExpiryDateMonth']}'=='missing'               Delete Object From Json             ${json['Credit']}                           $..ExpiryDateMonth

    Run Keyword If           '${Test_Data['Credit.ExpiryDateYear']}'!='empty'                  set to dictionary                   ${json['Credit']}                           ExpiryDateYear=${Test_Data['Credit.ExpiryDateYear']}
    Run Keyword If           '${Test_Data['Credit.ExpiryDateYear']}'=='missing'                Delete Object From Json             ${json['Credit']}                           $..ExpiryDateYear

    Run Keyword If           '${Test_Data['Credit.CardHolderName']}'!='empty'                  set to dictionary                   ${json['Credit']}                           CardHolderName=${Test_Data['Credit.CardHolderName']}
    Run Keyword If           '${Test_Data['Credit.CardHolderName']}'=='missing'                Delete Object From Json             ${json['Credit']}                           $..CardHolderName

    Run Keyword If           '${Test_Data['Credit.CardHolderSurName']}'!='empty'               set to dictionary                   ${json['Credit']}                           CardHolderSurName=${Test_Data['Credit.CardHolderSurName']}
    Run Keyword If           '${Test_Data['Credit.CardHolderSurName']}'=='missing'             Delete Object From Json             ${json['Credit']}                           $..CardHolderSurName

    Run Keyword If           '${Test_Data['Credit.Relationship']}'!='empty'                    set to dictionary                   ${json['Credit']}                           Relationship=${Test_Data['Credit.Relationship']}
    Run Keyword If           '${Test_Data['Credit.Relationship']}'=='missing'                  Delete Object From Json             ${json['Credit']}                           $..Relationship

    Run Keyword If           '${Test_Data['Credit.FormatPay']}'!='empty'                       set to dictionary                   ${json['Credit']}                           FormatPay=${Test_Data['Credit.FormatPay']}
    Run Keyword If           '${Test_Data['Credit.FormatPay']}'=='missing'                     Delete Object From Json             ${json['Credit']}                           $..FormatPay

    Run Keyword If           '${Test_Data['MobileBank.BankName']}'!='empty'                    set to dictionary                   ${json['MobileBank']}                       BankName=${Test_Data['MobileBank.BankName']}
    Run Keyword If           '${Test_Data['MobileBank.BankName']}'=='missing'                  Delete Object From Json             ${json['MobileBank']}                       $..BankName

    Run Keyword If           '${Test_Data['MobileBank.Name']}'!='empty'                        set to dictionary                   ${json['MobileBank']}                       Name=${Test_Data['MobileBank.Name']}
    Run Keyword If           '${Test_Data['MobileBank.Name']}'=='missing'                      Delete Object From Json             ${json['MobileBank']}                       $..Name

    Run Keyword If           '${Test_Data['MobileBank.Surname']}'!='empty'                     set to dictionary                   ${json['MobileBank']}                       Surname=${Test_Data['MobileBank.Surname']}
    Run Keyword If           '${Test_Data['MobileBank.Surname']}'=='missing'                   Delete Object From Json             ${json['MobileBank']}                       $..Surname

    Run Keyword If           '${Test_Data['MobileBank.BankIdNo']}'!='empty'                    set to dictionary                   ${json['MobileBank']}                       BankIdNo=${Test_Data['MobileBank.BankIdNo']}
    Run Keyword If           '${Test_Data['MobileBank.BankIdNo']}'=='missing'                  Delete Object From Json             ${json['MobileBank']}                       $..BankIdNo

    Run Keyword If           '${Test_Data['MobileBank.BankPhone']}'!='empty'                   set to dictionary                   ${json['MobileBank']}                       BankPhone=${Test_Data['MobileBank.BankPhone']}
    Run Keyword If           '${Test_Data['MobileBank.BankPhone']}'=='missing'                 Delete Object From Json             ${json['MobileBank']}                       $..BankPhone

    Run Keyword If           '${Test_Data['MobileBank.BankRelationship']}'!='empty'            set to dictionary                   ${json['MobileBank']}                       BankRelationship=${Test_Data['MobileBank.BankRelationship']}
    Run Keyword If           '${Test_Data['MobileBank.BankRelationship']}'=='missing'          Delete Object From Json             ${json['MobileBank']}                       $..BankRelationship


    Log Dictionary           ${json}
    ${json_string}=          evaluate                                                          json.dumps(${json})                 json
    log many                 ${json_string}
    ${json_object}           Convert String to JSON                                            ${json_string}
    [Return]                 ${json_object}
