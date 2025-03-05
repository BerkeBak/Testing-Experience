*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Verify Account Created Page Loaded
    Wait Until Page Contains    Account Created!
    
Click Button Continue
    Click Element    //*[@data-qa='continue-button']
