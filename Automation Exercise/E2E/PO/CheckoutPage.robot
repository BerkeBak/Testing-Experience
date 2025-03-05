*** Settings ***
Library    SeleniumLibrary
Library    XML


*** Variables ***

*** Keywords ***
Verify Address Details
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[2]    Mr. Henk Henker
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[3]    CompanyHenk
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[4]    Teststraat
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[5]    Teststraat-2
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[6]    Ohio Ohio 1234AB
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[7]    United States
    SeleniumLibrary.Element Text Should Be    //*[@id="address_delivery"]/li[8]    0612345678
    

Verify Billing Address
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[2]    Mr. Henk Henker
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[3]    CompanyHenk
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[4]    Teststraat
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[5]    Teststraat-2
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[6]    Ohio Ohio 1234AB
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[7]    United States
    SeleniumLibrary.Element Text Should Be    //*[@id="address_invoice"]/li[8]    0612345678


Enter Description In Comment Area
    Input Text    //*[@name="message"]    Summer White Top


Click Place Order Button
    Click Element    //*[@class="btn btn-default check_out"]
    Wait Until Page Contains    Payment