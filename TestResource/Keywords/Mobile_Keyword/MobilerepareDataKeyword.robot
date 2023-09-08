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

    IF                       '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    IF                       '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    IF                       '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    IF                       '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    IF                       '${Test_Data['Menu']}'!='empty'                                   set to dictionary                   ${json}                                     Menu=${Test_Data['Menu']}
    IF                       '${Test_Data['Menu']}'=='missing'                                 Delete Object From Json             ${json}                                     $..Menu

    IF                       '${Test_Data['InsuredInformation.Name']}'!='empty'                set to dictionary                   ${json['InsuredInformation']}               Name=${Test_Data['InsuredInformation.Name']}
    IF                       '${Test_Data['InsuredInformation.Name']}'=='missing'              Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Name

    IF                       '${Test_Data['InsuredInformation.Lastname']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Lastname=${Test_Data['InsuredInformation.Lastname']}
    IF                       '${Test_Data['InsuredInformation.Lastname']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Lastname

    IF                       '${Test_Data['InsuredInformation.Gender']}'!='empty'              set to dictionary                   ${json['InsuredInformation']}               Gender=${Test_Data['InsuredInformation.Gender']}
    IF                       '${Test_Data['InsuredInformation.Gender']}'=='missing'            Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Gender

    IF                       '${Test_Data['InsuredInformation.Age']}'!='empty'                 set to dictionary                   ${json['InsuredInformation']}               Age=${Test_Data['InsuredInformation.Age']}
    IF                       '${Test_Data['InsuredInformation.Age']}'=='missing'               Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Age

    IF                       '${Test_Data['InsuredInformation.Occupation']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               Occupation=${Test_Data['InsuredInformation.Occupation']}
    IF                       '${Test_Data['InsuredInformation.Occupation']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Occupation

    IF                       '${Test_Data['PayerInformation.Name']}'!='empty'                  set to dictionary                   ${json['PayerInformation']}                 Name=${Test_Data['PayerInformation.Name']}
    IF                       '${Test_Data['PayerInformation.Name']}'=='missing'                Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Name

    IF                       '${Test_Data['PayerInformation.Lastname']}'!='empty'              set to dictionary                   ${json['PayerInformation']}                 Lastname=${Test_Data['PayerInformation.Lastname']}
    IF                       '${Test_Data['PayerInformation.Lastname']}'=='missing'            Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Lastname

    IF                       '${Test_Data['PayerInformation.Gender']}'!='empty'                set to dictionary                   ${json['PayerInformation']}                 Gender=${Test_Data['PayerInformation.Gender']}
    IF                       '${Test_Data['PayerInformation.Gender']}'=='missing'              Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Gender

    IF                       '${Test_Data['PayerInformation.Age']}'!='empty'                   set to dictionary                   ${json['PayerInformation']}                 Age=${Test_Data['PayerInformation.Age']}
    IF                       '${Test_Data['PayerInformation.Age']}'=='missing'                 Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Age

    IF                       '${Test_Data['PayerInformation.Occupation']}'!='empty'            set to dictionary                   ${json['PayerInformation']}                 Occupation=${Test_Data['PayerInformation.Occupation']}
    IF                       '${Test_Data['PayerInformation.Occupation']}'=='missing'          Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Occupation

    IF                       '${Test_Data['Insured.SelectBasiclist']}'!='empty'                set to dictionary                   ${json['Insured']}                          SelectBasiclist=${Test_Data['Insured.SelectBasiclist']}
    IF                       '${Test_Data['Insured.SelectBasiclist']}'=='missing'              Delete Object From Json             ${json['Insured']}                          $..Insured.SelectBasiclist

    IF                       '${Test_Data['Insured.Suminsured']}'!='empty'                     set to dictionary                   ${json['Insured']}                          Suminsured=${Test_Data['Insured.Suminsured']}
    IF                       '${Test_Data['Insured.Suminsured']}'=='missing'                   Delete Object From Json             ${json['Insured']}                          $..Insured.Suminsured

    IF                       '${Test_Data['Suitablitytest.Choice']}'!='empty'                  set to dictionary                   ${json['Suitablitytest']}                   Choice=${Test_Data['Suitablitytest.Choice']}
    IF                       '${Test_Data['Suitablitytest.Choice']}'=='missing'                Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Choice

    IF                       '${Test_Data['Suitablitytest.Answer1']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer1=${Test_Data['Suitablitytest.Answer1']}
    IF                       '${Test_Data['Suitablitytest.Answer1']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer1

    IF                       '${Test_Data['Suitablitytest.Answer2']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer2=${Test_Data['Suitablitytest.Answer2']}
    IF                       '${Test_Data['Suitablitytest.Answer2']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer2

    IF                       '${Test_Data['Suitablitytest.Answer3']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer3=${Test_Data['Suitablitytest.Answer3']}
    IF                       '${Test_Data['Suitablitytest.Answer3']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer3

    IF                       '${Test_Data['Suitablitytest.Answer4']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer4=${Test_Data['Suitablitytest.Answer4']}
    IF                       '${Test_Data['Suitablitytest.Answer4']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer4

    IF                       '${Test_Data['Suitablitytest.Answer5']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer5=${Test_Data['Suitablitytest.Answer5']}
    IF                       '${Test_Data['Suitablitytest.Answer5']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer5

    IF                       '${Test_Data['Suitablitytest.Answer6']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer6=${Test_Data['Suitablitytest.Answer6']}
    IF                       '${Test_Data['Suitablitytest.Answer6']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer6

    IF                       '${Test_Data['Suitablitytest.Answer7']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer7=${Test_Data['Suitablitytest.Answer7']}
    IF                       '${Test_Data['Suitablitytest.Answer7']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer7

    IF                       '${Test_Data['Suitablitytest.Answer8']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer8=${Test_Data['Suitablitytest.Answer8']}
    IF                       '${Test_Data['Suitablitytest.Answer8']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer8

    IF                       '${Test_Data['Suitablitytest.Answer9']}'!='empty'                 set to dictionary                   ${json['Suitablitytest']}                   Answer9=${Test_Data['Suitablitytest.Answer9']}
    IF                       '${Test_Data['Suitablitytest.Answer9']}'=='missing'               Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer9

    IF                       '${Test_Data['Suitablitytest.Answer10']}'!='empty'                set to dictionary                   ${json['Suitablitytest']}                   Answer10=${Test_Data['Suitablitytest.Answer10']}
    IF                       '${Test_Data['Suitablitytest.Answer10']}'=='missing'              Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer10

    IF                       '${Test_Data['Suitablitytest.Answer11']}'!='empty'                set to dictionary                   ${json['Suitablitytest']}                   Answer11=${Test_Data['Suitablitytest.Answer11']}
    IF                       '${Test_Data['Suitablitytest.Answer11']}'=='missing'              Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer11

    IF                       '${Test_Data['Suitablitytest.Answer12']}'!='empty'                set to dictionary                   ${json['Suitablitytest']}                   Answer12=${Test_Data['Suitablitytest.Answer12']}
    IF                       '${Test_Data['Suitablitytest.Answer12']}'=='missing'              Delete Object From Json             ${json['Suitablitytest']}                   $..Suitablitytest.Answer12

    IF                       '${Test_Data['Investment.Choice']}'!='empty'                      set to dictionary                   ${json['Investment']}                       Choice=${Test_Data['Investment.Choice']}
    IF                       '${Test_Data['Investment.Choice']}'=='missing'                    Delete Object From Json             ${json['Investment']}                       $..Investment.Choice

    IF                       '${Test_Data['Investment.Fund']}'!='empty'                        set to dictionary                   ${json['Investment']}                       Fund=${Test_Data['Investment.Fund']}
    IF                       '${Test_Data['Investment.Fund']}'=='missing'                      Delete Object From Json             ${json['Investment']}                       $..Investment.Fund


    ${json_string}=          evaluate                                                          json.dumps(${json})                 json
    log many                 ${json_string}
    ${json_object}           Convert String to JSON                                            ${json_string}
    [Return]                 ${json_object}

PrepareDataApplication
    [Arguments]              ${Test_Data}                                                      ${rowNo}                            ${testcaseName}==none
    ${json_string}           Get Binary File                                                   ${file_path_request}.json
    Log                      ${json_string}
    ${json}=                 evaluate                                                          json.loads('''${json_string}''')    json

    IF                       '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    IF                       '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    IF                       '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    IF                       '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    IF                       '${Test_Data['Menu']}'!='empty'                                   set to dictionary                   ${json}                                     Menu=${Test_Data['Menu']}
    IF                       '${Test_Data['Menu']}'=='missing'                                 Delete Object From Json             ${json}                                     $..Menu

    IF                       '${Test_Data['InsuredInformation.Format']}'!='empty'              set to dictionary                   ${json['InsuredInformation']}               Format=${Test_Data['InsuredInformation.Format']}
    IF                       '${Test_Data['InsuredInformation.Format']}'=='missing'            Delete Object From Json             ${json['InsuredInformation']}               $..Format

    IF                       '${Test_Data['InsuredInformation.CardType']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               CardType=${Test_Data['InsuredInformation.CardType']}
    IF                       '${Test_Data['InsuredInformation.CardType']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $.InsuredInformation.CardType

    IF                       '${Test_Data['InsuredInformation.Id']}'!='empty'                  set to dictionary                   ${json['InsuredInformation']}               Id=${Test_Data['InsuredInformation.Id']}
    IF                       '${Test_Data['InsuredInformation.Id']}'=='missing'                Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Id

    IF                       '${Test_Data['InsuredInformation.LaserCode']}'!='empty'           set to dictionary                   ${json['InsuredInformation']}               LaserCode=${Test_Data['InsuredInformation.LaserCode']}
    IF                       '${Test_Data['InsuredInformation.LaserCode']}'=='missing'         Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.LsaserCode

    IF                       '${Test_Data['InsuredInformation.Title']}'!='empty'               set to dictionary                   ${json['InsuredInformation']}               Title=${Test_Data['InsuredInformation.Title']}
    IF                       '${Test_Data['InsuredInformation.Title']}'=='missing'             Delete Object From Json             ${json['InsuredInformation']}               $..Title

    IF                       '${Test_Data['InsuredInformation.Name']}'!='empty'                set to dictionary                   ${json['InsuredInformation']}               Name=${Test_Data['InsuredInformation.Name']}
    IF                       '${Test_Data['InsuredInformation.Name']}'=='missing'              Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Name

    IF                       '${Test_Data['InsuredInformation.Lastname']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Lastname=${Test_Data['InsuredInformation.Lastname']}
    IF                       '${Test_Data['InsuredInformation.Lastname']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Lastname

    IF                       '${Test_Data['InsuredInformation.Age']}'!='empty'                 set to dictionary                   ${json['InsuredInformation']}               Age=${Test_Data['InsuredInformation.Age']}
    IF                       '${Test_Data['InsuredInformation.Age']}'=='missing'               Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Age

    IF                       '${Test_Data['InsuredInformation.FatherName']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               FatherName=${Test_Data['InsuredInformation.FatherName']}
    IF                       '${Test_Data['InsuredInformation.FatherName']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherName

    IF                       '${Test_Data['InsuredInformation.FatherLastname']}'!='empty'      set to dictionary                   ${json['InsuredInformation']}               FatherLastname=${Test_Data['InsuredInformation.FatherLastname']}
    IF                       '${Test_Data['InsuredInformation.FatherLastname']}'=='missing'    Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherLastname

    IF                       '${Test_Data['InsuredInformation.FatherAlive']}'!='empty'         set to dictionary                   ${json['InsuredInformation']}               FatherAlive=${Test_Data['InsuredInformation.FatherAlive']}
    IF                       '${Test_Data['InsuredInformation.FatherAlive']}'=='missing'       Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.FatherAlive

    IF                       '${Test_Data['InsuredInformation.MotherName']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               MotherName=${Test_Data['InsuredInformation.MotherName']}
    IF                       '${Test_Data['InsuredInformation.MotherName']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherName

    IF                       '${Test_Data['InsuredInformation.MotherLastname']}'!='empty'      set to dictionary                   ${json['InsuredInformation']}               MotherLastname=${Test_Data['InsuredInformation.MotherLastname']}
    IF                       '${Test_Data['InsuredInformation.MotherLastname']}'=='missing'    Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherLastname

    IF                       '${Test_Data['InsuredInformation.MotherAlive']}'!='empty'         set to dictionary                   ${json['InsuredInformation']}               MotherAlive=${Test_Data['InsuredInformation.MotherAlive']}
    IF                       '${Test_Data['InsuredInformation.MotherAlive']}'=='missing'       Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MotherAlive


    IF                       '${Test_Data['InsuredInformation.Education']}'!='empty'           set to dictionary                   ${json['InsuredInformation']}               Education=${Test_Data['InsuredInformation.Education']}
    IF                       '${Test_Data['InsuredInformation.Education']}'=='missing'         Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Education

    IF                       '${Test_Data['InsuredInformation.Postcode']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               Postcode=${Test_Data['InsuredInformation.Postcode']}
    IF                       '${Test_Data['InsuredInformation.Postcode']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Postcode

    IF                       '${Test_Data['InsuredInformation.MobileNo']}'!='empty'            set to dictionary                   ${json['InsuredInformation']}               MobileNo=${Test_Data['InsuredInformation.MobileNo']}
    IF                       '${Test_Data['InsuredInformation.MobileNo']}'=='missing'          Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.MobileNo

    IF                       '${Test_Data['InsuredInformation.Email']}'!='empty'               set to dictionary                   ${json['InsuredInformation']}               Email=${Test_Data['InsuredInformation.Email']}
    IF                       '${Test_Data['InsuredInformation.Email']}'=='missing'             Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Email

    IF                       '${Test_Data['InsuredInformation.Contact']}'!='empty'             set to dictionary                   ${json['InsuredInformation']}               Contact=${Test_Data['InsuredInformation.Contact']}
    IF                       '${Test_Data['InsuredInformation.Contact']}'=='missing'           Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Contact

    IF                       '${Test_Data['InsuredInformation.Occupation']}'!='empty'          set to dictionary                   ${json['InsuredInformation']}               Occupation=${Test_Data['InsuredInformation.Occupation']}
    IF                       '${Test_Data['InsuredInformation.Occupation']}'=='missing'        Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.Occupation

    IF                       '${Test_Data['InsuredInformation.AnnualIncome']}'!='empty'        set to dictionary                   ${json['InsuredInformation']}               AnnualIncome=${Test_Data['InsuredInformation.AnnualIncome']}
    IF                       '${Test_Data['InsuredInformation.AnnualIncome']}'=='missing'      Delete Object From Json             ${json['InsuredInformation']}               $..InsuredInformation.AnnualIncome

    IF                       '${Test_Data['PayerInformation.Id']}'!='empty'                    set to dictionary                   ${json['PayerInformation']}                 Id=${Test_Data['PayerInformation.Id']}
    IF                       '${Test_Data['PayerInformation.Id']}'=='missing'                  Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Id

    IF                       '${Test_Data['PayerInformation.LaserCode']}'!='empty'             set to dictionary                   ${json['PayerInformation']}                 LaserCode=${Test_Data['PayerInformation.LaserCode']}
    IF                       '${Test_Data['PayerInformation.LaserCode']}'=='missing'           Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.LaserCode

    IF                       '${Test_Data['PayerInformation.Name']}'!='empty'                  set to dictionary                   ${json['PayerInformation']}                 Name=${Test_Data['PayerInformation.Name']}
    IF                       '${Test_Data['PayerInformation.Name']}'=='missing'                Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Name

    IF                       '${Test_Data['PayerInformation.Lastname']}'!='empty'              set to dictionary                   ${json['PayerInformation']}                 Lastname=${Test_Data['PayerInformation.Lastname']}
    IF                       '${Test_Data['PayerInformation.Lastname']}'=='missing'            Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Lastname

    IF                       '${Test_Data['PayerInformation.Occupation']}'!='empty'            set to dictionary                   ${json['PayerInformation']}                 Occupation=${Test_Data['PayerInformation.Occupation']}
    IF                       '${Test_Data['PayerInformation.Occupation']}'=='missing'          Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.Occupation

    IF                       '${Test_Data['PayerInformation.AnnualIncome']}'!='empty'          set to dictionary                   ${json['PayerInformation']}                 AnnualIncome=${Test_Data['PayerInformation.AnnualIncome']}
    IF                       '${Test_Data['PayerInformation.AnnualIncome']}'=='missing'        Delete Object From Json             ${json['PayerInformation']}                 $..PayerInformation.AnnualIncome

    IF                       '${Test_Data['Hight']}'!='empty'                                  set to dictionary                   ${json}                                     Hight=${Test_Data['Hight']}
    IF                       '${Test_Data['Hight']}'=='missing'                                Delete Object From Json             ${json}                                     $..Hight

    IF                       '${Test_Data['Weight']}'!='empty'                                 set to dictionary                   ${json}                                     Weight=${Test_Data['Weight']}
    IF                       '${Test_Data['Weight']}'=='missing'                               Delete Object From Json             ${json}                                     $..Weight

    IF                       '${Test_Data['GestationalAging']}'!='empty'                       set to dictionary                   ${json}                                     GestationalAging=${Test_Data['GestationalAging']}
    IF                       '${Test_Data['GestationalAging']}'=='missing'                     Delete Object From Json             ${json}                                     $..GestationalAging

    IF                       '${Test_Data['BirthWeight']}'!='empty'                            set to dictionary                   ${json}                                     BirthWeight=${Test_Data['BirthWeight']}
    IF                       '${Test_Data['BirthWeight']}'=='missing'                          Delete Object From Json             ${json}                                     $..BirthWeight

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

    IF                       '${Test_Data['Login.Username']}'!='empty'                         set to dictionary                   ${json['Login']}                            Username=${Test_Data['Login.Username']}
    IF                       '${Test_Data['Login.Username']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Username

    IF                       '${Test_Data['Login.Password']}'!='empty'                         set to dictionary                   ${json['Login']}                            Password=${Test_Data['Login.Password']}
    IF                       '${Test_Data['Login.Password']}'=='missing'                       Delete Object From Json             ${json['Login']}                            $..Password

    IF                       '${Test_Data['Payment.PaymentMethod']}'!='empty'                  set to dictionary                   ${json['Payment']}                          PaymentMethod=${Test_Data['Payment.PaymentMethod']}
    IF                       '${Test_Data['Payment.PaymentMethod']}'=='missing'                Delete Object From Json             ${json['Payment']}                          $..PaymentMethod

    IF                       '${Test_Data['Credit.BankName']}'!='empty'                        set to dictionary                   ${json['Credit']}                           BankName=${Test_Data['Credit.BankName']}
    IF                       '${Test_Data['Credit.BankName']}'=='missing'                      Delete Object From Json             ${json['Credit']}                           $..BankName

    IF                       '${Test_Data['Credit.CreditNo']}'!='empty'                        set to dictionary                   ${json['Credit']}                           CreditNo=${Test_Data['Credit.CreditNo']}
    IF                       '${Test_Data['Credit.CreditNo']}'=='missing'                      Delete Object From Json             ${json['Credit']}                           $..CreditNo

    IF                       '${Test_Data['Credit.ExpiryDateMonth']}'!='empty'                 set to dictionary                   ${json['Credit']}                           ExpiryDateMonth=${Test_Data['Credit.ExpiryDateMonth']}
    IF                       '${Test_Data['Credit.ExpiryDateMonth']}'=='missing'               Delete Object From Json             ${json['Credit']}                           $..ExpiryDateMonth

    IF                       '${Test_Data['Credit.ExpiryDateYear']}'!='empty'                  set to dictionary                   ${json['Credit']}                           ExpiryDateYear=${Test_Data['Credit.ExpiryDateYear']}
    IF                       '${Test_Data['Credit.ExpiryDateYear']}'=='missing'                Delete Object From Json             ${json['Credit']}                           $..ExpiryDateYear

    IF                       '${Test_Data['Credit.CardHolderName']}'!='empty'                  set to dictionary                   ${json['Credit']}                           CardHolderName=${Test_Data['Credit.CardHolderName']}
    IF                       '${Test_Data['Credit.CardHolderName']}'=='missing'                Delete Object From Json             ${json['Credit']}                           $..CardHolderName

    IF                       '${Test_Data['Credit.CardHolderSurName']}'!='empty'               set to dictionary                   ${json['Credit']}                           CardHolderSurName=${Test_Data['Credit.CardHolderSurName']}
    IF                       '${Test_Data['Credit.CardHolderSurName']}'=='missing'             Delete Object From Json             ${json['Credit']}                           $..CardHolderSurName

    IF                       '${Test_Data['Credit.Relationship']}'!='empty'                    set to dictionary                   ${json['Credit']}                           Relationship=${Test_Data['Credit.Relationship']}
    IF                       '${Test_Data['Credit.Relationship']}'=='missing'                  Delete Object From Json             ${json['Credit']}                           $..Relationship

    IF                       '${Test_Data['Credit.FormatPay']}'!='empty'                       set to dictionary                   ${json['Credit']}                           FormatPay=${Test_Data['Credit.FormatPay']}
    IF                       '${Test_Data['Credit.FormatPay']}'=='missing'                     Delete Object From Json             ${json['Credit']}                           $..FormatPay

    IF                       '${Test_Data['MobileBank.BankName']}'!='empty'                    set to dictionary                   ${json['MobileBank']}                       BankName=${Test_Data['MobileBank.BankName']}
    IF                       '${Test_Data['MobileBank.BankName']}'=='missing'                  Delete Object From Json             ${json['MobileBank']}                       $..BankName

    IF                       '${Test_Data['MobileBank.Name']}'!='empty'                        set to dictionary                   ${json['MobileBank']}                       Name=${Test_Data['MobileBank.Name']}
    IF                       '${Test_Data['MobileBank.Name']}'=='missing'                      Delete Object From Json             ${json['MobileBank']}                       $..Name

    IF                       '${Test_Data['MobileBank.Surname']}'!='empty'                     set to dictionary                   ${json['MobileBank']}                       Surname=${Test_Data['MobileBank.Surname']}
    IF                       '${Test_Data['MobileBank.Surname']}'=='missing'                   Delete Object From Json             ${json['MobileBank']}                       $..Surname

    IF                       '${Test_Data['MobileBank.BankIdNo']}'!='empty'                    set to dictionary                   ${json['MobileBank']}                       BankIdNo=${Test_Data['MobileBank.BankIdNo']}
    IF                       '${Test_Data['MobileBank.BankIdNo']}'=='missing'                  Delete Object From Json             ${json['MobileBank']}                       $..BankIdNo

    IF                       '${Test_Data['MobileBank.BankPhone']}'!='empty'                   set to dictionary                   ${json['MobileBank']}                       BankPhone=${Test_Data['MobileBank.BankPhone']}
    IF                       '${Test_Data['MobileBank.BankPhone']}'=='missing'                 Delete Object From Json             ${json['MobileBank']}                       $..BankPhone

    IF                       '${Test_Data['MobileBank.BankRelationship']}'!='empty'            set to dictionary                   ${json['MobileBank']}                       BankRelationship=${Test_Data['MobileBank.BankRelationship']}
    IF                       '${Test_Data['MobileBank.BankRelationship']}'=='missing'          Delete Object From Json             ${json['MobileBank']}                       $..BankRelationship

    Log Dictionary           ${json}
    ${json_string}=          evaluate                                                          json.dumps(${json})                 json
    log many                 ${json_string}
    ${json_object}           Convert String to JSON                                            ${json_string}
    [Return]                 ${json_object}
