*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}
${HOMEPAGE_LOGO_ELEMENT} =  logo

*** Keywords ***
Navigate to
    Go To  ${URL}
    
Verify Page Loaded
    Wait Until Page Contains Element             ${HOMEPAGE_LOGO_ELEMENT}

