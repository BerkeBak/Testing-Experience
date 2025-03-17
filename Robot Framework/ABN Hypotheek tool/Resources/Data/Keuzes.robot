*** Settings ***
Library             SeleniumLibrary


*** Variables ***



*** Keywords ***
Kies Alleen
    Click Element    //*[contains(text(),"Alleen")]

Kies Samen
    Click Element    //*[contains(text(),"Samen")]