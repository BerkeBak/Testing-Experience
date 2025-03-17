*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NAV_CATs_ELEMENT} =                                //*[@id="menu"]/div[2]/ul/li[1]/a
${NAV_CATs_MEDIUM_HAIRED_CATS_ELEMENT} =             //*[@id="menu"]/div[2]/ul/li[1]/div/div/ul/li[2]/a


*** Keywords ***
Navigate to Medium Haired Cat Page
    Click Element                                    ${NAV_CATs_ELEMENT} 
    Click Element                                    ${NAV_CATs_MEDIUM_HAIRED_CATS_ELEMENT}

Verify Medium Haired Cat Page Loaded
    Wait Until Page Contains                         Medium Haired Cats

