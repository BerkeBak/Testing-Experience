*** Settings ***
Library    Browser


*** Variables ***
${REGISTER_INPUT_FIELD_NAME} =                     xpath=//*[@data-qa='signup-name']
${REGISTER_INPUT_FIELD_EMAILADDRESS} =             xpath=//*[@data-qa='signup-email']
${Email Adress} =                                  Henk@Henk.com
${Name} =                                          Henk
${Password} =                                      HenkHenk
${lOGIN_INPUT_FIELD_EMAILADDRESS} =                xpath=//*[@data-qa='login-email']
${LOGIN_INPUT_FIELD_PASSWORD} =                    xpath=//*[@data-qa='login-password']




*** Keywords ***
New User Signup
    [Arguments]    ${Name}    ${Email Adress}
    Input New User Name                  ${Name}
    Input New User Email Address         ${Email Adress}
    Submit Signup


Input New User Name
    [Arguments]    ${Name}
    Type Text          ${REGISTER_INPUT_FIELD_NAME}                    ${Name}


Input New User Email Address
    [Arguments]    ${Email Adress}
    Type Text          ${REGISTER_INPUT_FIELD_EMAILADDRESS}    ${Email Adress}
    

Submit Signup
    Click         xpath=//*[@data-qa='signup-button']    


Verify Signup Page Loaded
    Wait For Elements State                text="Enter Account Information"    visible


Login User
    [Arguments]    ${Email Adress}    ${Password}
    Type Text    ${lOGIN_INPUT_FIELD_EMAILADDRESS}    ${Email Adress}
    Type Text    ${LOGIN_INPUT_FIELD_PASSWORD}        ${Password}
    Click            xpath=//*[@data-qa='login-button']


Verify Invalid Credentials Error
    ${page_text} =    Browser.Get Text    xpath=//*[text()[contains(., "Your email or password is incorrect!")]]
    Should Contain    ${page_text}    Your email or password is incorrect!


Verify Existing Credentials Error
    ${page_text} =    Browser.Get Text    xpath=//*[text()[contains(., "Email Address already exist!")]]
    Should Contain    ${page_text}    Email Address already exist!
    