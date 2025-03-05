*** Settings ***
Library    Browser
Library    Dialogs


*** Variables ***


*** Keywords ***
Register User
    [Arguments]    ${Valid Password}    ${Valid Username}
    Click    xpath=//*[@id='id_gender1']
    Fill Text   xpath=//*[@data-qa='password']    ${Valid Password}
    Select Options By    xpath=//*[@id='days']    value    5
    Select Options By    xpath=//*[@id='months']    value    5
    Select Options By    xpath=//*[@id='years']    value    1995
    #Scroll Element Into View    xpath=/*[@name='city']
    Click    xpath=//*[@name='newsletter']
    Click    xpath=//*[@name='optin']
    Fill Text    xpath=//*[@name='first_name']    ${Valid Username}
    Fill Text    xpath=//*[@name='last_name']    Henker
    Fill Text    xpath=//*[@name='company']    CompanyHenk
    Fill Text    xpath=//*[@name='address1']    Teststraat
    Fill Text    xpath=//*[@name='address2']    Teststraat-2
    Select Options By    xpath=//*[@name='country']    value    United States
    Fill Text    xpath=//*[@name='state']    Ohio
    Fill Text    xpath=//*[@name='city']    Ohio
    Fill Text    xpath=//*[@name='zipcode']    1234AB
    Fill Text    xpath=//*[@name='mobile_number']    0612345678
    Click    xpath=//*[@data-qa='create-account']
    Wait For Elements State    xpath=//*[@data-qa="continue-button"]    visible
    Click   xpath=//*[@data-qa="continue-button"]