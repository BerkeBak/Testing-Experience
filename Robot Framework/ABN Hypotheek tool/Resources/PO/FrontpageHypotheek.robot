*** Settings ***
Library             SeleniumLibrary


*** Variables ***
${iframe} =     //iframe[@id='215993']


*** Keywords ***
Is de pagina geladen?
    #Selecteer de frame waarin Hypotheek-berekening-app zich bevindt.
    Select Frame    ${iframe}
    Wait Until Page Contains    Bereken uw hypotheek
    
Start hypotheek berekening
    Click Button    //button[contains(text(),"Reken verder")]
    #Deselecteer de frame, zodat RF de webpagina kan zien.
    Unselect Frame
    
    
