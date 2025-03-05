*** Settings ***
Library    SeleniumLibrary
Library    XML


*** Variables ***


*** Keywords ***
Enter Payment Details
    Input Text    //*[@name="name_on_card"]    H. Henk
    Input Text    //*[@data-qa="card-number"]    0123456789
    Input Text    //*[@data-qa="cvc"]    989
    Input Text    //*[@name="expiry_month"]    12
    Input Text    //*[@data-qa="expiry-year"]    2030
    Click Element    //*[@data-qa="pay-button"]


Wait For Succes message
    Wait Until Page Contains    Congratulations! Your order has been confirmed!