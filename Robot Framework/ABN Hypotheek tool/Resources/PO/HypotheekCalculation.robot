*** Settings ***
Library           SeleniumLibrary
Library           Dialogs
Resource          ../Data/Keuzes.robot

*** Variables ***
${Uw_Leeftijd} =                        35
${Uw_Bruto_Inkomen_Per_Jaar} =          50000
${Uw_Eigen_Inleg} =                     20000
${Uw_Uiteindelijke_Hypotheek} =         223.440

${Partner_Leeftijd} =                   30
${Partner_Bruto_Inkomen_Per_Jaar} =     60000
${Samen_Uiteindelijke_Hypotheek} =      536.794

*** Keywords ***
Start hier uw hypotheek berekening
    #Controleer of de pagina laadt en daarna selecteer de frame waarin de Hypotheek-berekening-app zich bevindt en controleer of deze laadt.
    Wait Until Page Contains            maximale hypotheek berekenen verder
    Select Frame                        //iframe[@id='212927']
    Wait Until Page Contains            Start hier uw hypotheek berekening
    Click Button                        //button[@data-element-label="Ik heb nog geen hypotheek bij ABN AMRO"]

Koopt u alleen of samen?
    Wait Until Page Contains            Koopt u alleen of samen?

Wat is uw leeftijd?
    Wait Until Element Is Visible       //input[@id='age']
    Input Text                          //input[@id='age']    ${Uw_Leeftijd}
    Wait Until Element Is Enabled       //button[@class="base-btn__inner-button"]
    Click Button                        //button[@class="base-btn__inner-button"]

Wat is uw werksituatie?
    Wait Until Page Contains            Wat is uw werksituatie?
    Click Button                        //button[@class="base-btn__inner-button"]

Wat is uw bruto inkomen per jaar?
    sleep                               1s
    Wait Until Element Is Visible       dom:document.querySelector("#currency-input-income").shadowRoot.querySelector("#inputId")
    Input Text                          dom:document.querySelector("#currency-input-income").shadowRoot.querySelector("#inputId")    ${Uw_Bruto_Inkomen_Per_Jaar}
    Wait Until Element Is Enabled       dom:document.querySelector("#app > div.orientation > div > div > div > div.wizard-components-resolver-components > div > div.currency-input.wizard-components-resolver-components__user-input > div.base-button-wrapper > aab-button > button")
    Click Button                        //button[@class="base-btn__inner-button"]
    
Heeft u een studieschuld?
    Wait Until Page Contains            Heeft u een studieschuld?
    Click Element                       //*[contains(text(),"Nee")]

Heeft u leningen?
    Wait Until Page Contains            Heeft u leningen?
    Click Element                       //*[contains(text(),"Nee")]

Betaalt u alimentatie?
    Wait Until Page Contains            Betaalt u alimentatie?
    Click Element                       //*[contains(text(),"Nee")]

Heeft u al een koopwoning?
    Wait Until Page Contains            heeft u al een koopwoning?
    Click Element                       //*[contains(text(),"Nee")]

Hoeveel geld wilt u zelf inbrengen?
    Wait Until Page Contains            Hoeveel geld wilt u zelf inbrengen?
    Wait Until Element Is Visible       dom:document.querySelector("#currency-input-ownFunds").shadowRoot.querySelector("#inputId")
    Input Text                          dom:document.querySelector("#currency-input-ownFunds").shadowRoot.querySelector("#inputId")    ${Uw_Eigen_Inleg}
    Wait Until Element Is Enabled       //*[@id="app"]/div[3]/div/div/div/div[3]/div/div[1]/div[3]/aab-button/button
    Click Button                        //*[@id="app"]/div[3]/div/div/div/div[3]/div/div[1]/div[3]/aab-button/button

Uiteindelijke berekening Alleen
    Wait Until Page Contains            Woonbudget
    Wait Until Page Contains            ${Uw_Uiteindelijke_Hypotheek}


Wat is de leeftijd van uw partner?
    Wait Until Element Is Visible       //input[@id='agePartner']
    Input Text                          //input[@id='agePartner']    ${Partner_Leeftijd}
    Wait Until Element Is Enabled       //button[@class="base-btn__inner-button"]
    Click Button                        //button[@class="base-btn__inner-button"]

Wat is de werksituatie van uw partner?
    Wait Until Page Contains            Wat is de werksituatie van uw partner?
    Click Button                        //button[@class="base-btn__inner-button"]

Wat is het bruto inkomen per jaar van uw partner?
    sleep                               1s
    Wait Until Element Is Visible       dom:document.querySelector("#currency-input-incomePartner").shadowRoot.querySelector("#inputId")
    Input Text                          dom:document.querySelector("#currency-input-incomePartner").shadowRoot.querySelector("#inputId")    ${Partner_Bruto_Inkomen_Per_Jaar}
    Wait Until Element Is Enabled       dom:document.querySelector("#app > div.orientation > div > div > div > div.wizard-components-resolver-components > div > div.currency-input.wizard-components-resolver-components__user-input > div.base-button-wrapper > aab-button > button")
    Click Button                        //button[@class="base-btn__inner-button"]


Heeft u of uw partner een studieschuld?
    Wait Until Page Contains            Heeft u of uw partner een studieschuld?
    Click Element                       //*[contains(text(),"Nee")]

Hebben jullie leningen?
    Wait Until Page Contains            Hebben jullie leningen?
    Click Element                       //*[contains(text(),"Nee")]


Betaalt één van jullie alimentatie?
    Wait Until Page Contains            Betaalt één van jullie alimentatie?
    Click Element                       //*[contains(text(),"Nee")]

Uiteindelijke berekening Samen
    Wait Until Page Contains            Woonbudget
    Wait Until Page Contains            ${Samen_Uiteindelijke_Hypotheek}
    