*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${DROPDOWN_MY_ACCOUNT_ELEMENT} =                     //*[@id="top-links"]/ul/li[2]/a 
${DROPDOWN_MY_ACCOUNT_LOGOUT_ELEMENT} =              //*[@id="top-links"]/ul/li[2]/ul/li[5]/a


*** Keywords ***
Click "My Account" button
    Click Element                        ${DROPDOWN_MY_ACCOUNT_ELEMENT}

Click "Logout" button
    Click Element                        ${DROPDOWN_MY_ACCOUNT_LOGOUT_ELEMENT}

Verify Logout Page Loaded
    Wait Until Page Contains             You have been logged off your account.    