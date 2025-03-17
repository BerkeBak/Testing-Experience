*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Enter Basic Vehicle Data
    [Arguments]    ${Make}  ${Engine Performance}  ${Date of Manufacture}  ${Number of Seats}  ${List Price}  ${Annual Mileage}
    Select Options By    //*[@id="make"]                    text    ${Make}
    Fill Text            //*[@id="engineperformance"]               ${Engine Performance}
    Fill Text            //*[@id="dateofmanufacture"]               ${Date of Manufacture}
    Select Options By    //*[@id="numberofseats"]           text    ${Number of Seats}
    Fill Text            //*[@id="listprice"]                       ${List Price}
    Fill Text            //*[@id="annualmileage"]                   ${Annual Mileage}

Proceed To Next Page After Vehicle Data
    Click                //*[@id="nextenterinsurantdata"]

Enter Additional Data Automobile
    [Arguments]    ${Fuel Type}
    Select Options By    //*[@id="fuel"]                    text    ${Fuel Type}

Enter Additional Data Truck
    [Arguments]    ${Fuel Type}  ${Payload}  ${Total Weight}
    Select Options By    //*[@id="fuel"]                    text    ${Fuel Type}
    Fill Text            //*[@id="payload"]                 ${Payload}
    Fill Text            //*[@id="totalweight"]             ${Total Weight}

Enter Insurant Data
    Fill Text            //*[@id="firstname"]                            Henk
    Fill Text            //*[@id="lastname"]                             Henker
    Fill Text            //*[@id="birthdate"]                            12/12/1980
    Click                //*[text()[contains(.,'Male')]]
    Select Options By    //*[@id="country"]                      text    Netherlands
    Fill Text            //*[@id="zipcode"]                              1234
    Select Options By    //*[@id="occupation"]                   text    Farmer
    Click                //*[text()[contains(.,'Skydiving')]]
    Click                //*[@id="nextenterproductdata"]

Enter Basic Product Data
    Fill Text            //*[@id="startdate"]                                      12/12/2025
    Select Options By    //*[@id="insurancesum"]                           text    10.000.000,00
    Select Options By    //*[@id="damageinsurance"]                        text    Full Coverage
    Click                //*[text()[contains(.,'Euro Protection')]]

Enter Additional Product Data
    Select Options By    //*[@id="meritrating"]                            text    Bonus 1
    Select Options By    //*[@id="courtesycar"]                            text    Yes

Proceed to Next Page After Product Data
    Click                //*[@id="nextselectpriceoption"]

Select Price Option
    [Arguments]    ${Price Ultimate}
    Get Text     //*[@id="selectultimate_price"]        equal    ${Price Ultimate}
    Click        //*[@id="selectultimate"]/parent::*
    Click        //*[@id="nextsendquote"]

Send Quote
    Fill Text    //*[@id="email"]              Henk@Henker.com
    Fill Text    //*[@id="username"]           HenkHenker
    Fill Text    //*[@id="password"]           Henk123
    Fill Text    //*[@id="confirmpassword"]    Henk123
    Click        //*[@id="sendemail"]

Conformation Succes
    Get Text     //*[text()[contains(.,'Sending e-mail success!')]]    equal    Sending e-mail success!
    Click        //*[@class="confirm"]
