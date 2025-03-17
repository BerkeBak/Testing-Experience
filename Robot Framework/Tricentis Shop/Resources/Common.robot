*** Settings ***
Library    Browser
Library    Dialogs

*** Variables ***
${Url} =    https://sampleapp.tricentis.com/101/#

*** Keywords ***
Begin Web test
    New Page    ${Url}

Close Web Test
    Close Page