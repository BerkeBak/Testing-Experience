*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${Browser} =              ${BROWSER}


*** Keywords ***
Begin Web Test
    Open Browser                http://testobjectv1.westeurope.cloudapp.azure.com/index.php?route=common/home       ${Browser}
    Maximize Browser Window
    
End Web Test
    Close All Browsers


