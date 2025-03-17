*** Settings ***
Library    SeleniumLibrary    10    10

*** Variables ***
${LANDING_NAVIGATION_ELEMENT} =  //*[@id="mainNav"]

*** Keywords ***
Navigate To
    Go To    ${URL}


Verify Page Loaded
    Wait Until Page Contains element    ${LANDING_NAVIGATION_ELEMENT}