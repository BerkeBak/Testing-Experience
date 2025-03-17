*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DROPDOWN_MY_ACCOUNT_ELEMENT} =             //*[@id="top-links"]/ul/li[2]/a  
${DROPDOWN_MY_ACCOUNT_lOGIN_ELEMENT} =       //*[@id="top-links"]/ul/li[2]/ul/li[2]/a
${Valid Email} =                             Henk.Henker@Henk.Henker
${Valid Password} =                          HenkHenker
${Invalid Email} =                           Ditwerkt@Niet.waaromniet
${Invalid Password} =                        ABC123
${DROPDOWN_MY_ACCOUNT_VALIDATION} =          //*[@id="top-links"]/ul/li[2]/ul/li[3]/a


*** Keywords ***
Click My Account
    Click Element    ${DROPDOWN_MY_ACCOUNT_ELEMENT}


Click Login
    Click Element    ${DROPDOWN_MY_ACCOUNT_lOGIN_ELEMENT}


Verify Page Loaded
    Wait Until Page Contains      E-Mail Address


Log in with valid credentials
    Input Text                    email        ${Valid Email}
    Input Password                password     ${Valid Password}


Verify Login Page loaded
    Wait Until Page Contains element      ${DROPDOWN_MY_ACCOUNT_VALIDATION}

Click "Login" Button
    Click Button                  Login        

Log in with invalid credentials
    Input Text                    email        ${Invalid Email}
    Input Password                password     ${Invalid Password}

Log in with missing credentials
    Click Button                  Login
    Wait Until Page Contains      Warning: No match for E-Mail Address and/or Password.
