*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${Browser} =    ${BROWSER}
${Url} =    ${URL}
${ACCEPT_COOKIES_BUTTON} =    //*[@id="aab-cookie-consent-agree"]

*** Keywords ***
Begin Web Test
    Open Browser    ${Url}    ${Browser}     options=add_argument("disable-search-engine-choice-screen");
    Maximize Browser Window
    Wait Until Page Contains Element   ${ACCEPT_COOKIES_BUTTON}
     Click Element   ${ACCEPT_COOKIES_BUTTON}

Close Web Test
    Close Browser
     


