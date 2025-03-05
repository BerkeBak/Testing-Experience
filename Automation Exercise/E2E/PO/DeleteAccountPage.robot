*** Settings ***
Library    Browser

*** Variables ***


*** Keywords ***
Verify Page Loaded
    Wait For Elements State    text="Account Deleted!"    visible

Click Continue Button
    Click    //*[@data-qa='continue-button']