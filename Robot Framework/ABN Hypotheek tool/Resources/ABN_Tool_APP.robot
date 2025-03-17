*** Settings ***
Resource    ./Common.robot
Resource    ./PO/FrontpageHypotheek.robot
Resource    ./PO/HypotheekCalculation.robot


*** Variables ***


*** Keywords ***
Start Calculation Alleen
    FrontpageHypotheek.Is de pagina geladen?
    FrontpageHypotheek.Start hypotheek berekening
    HypotheekCalculation.Start hier uw hypotheek berekening
    HypotheekCalculation.Koopt u alleen of samen?
    Kies Alleen
    HypotheekCalculation.Wat is uw leeftijd?
    HypotheekCalculation.Wat is uw werksituatie?
    HypotheekCalculation.Wat is uw bruto inkomen per jaar?
    HypotheekCalculation.Heeft u een studieschuld?
    HypotheekCalculation.Heeft u leningen?
    HypotheekCalculation.Betaalt u alimentatie?
    HypotheekCalculation.Heeft u al een koopwoning?
    HypotheekCalculation.Hoeveel geld wilt u zelf inbrengen?
    HypotheekCalculation.Uiteindelijke berekening Alleen

Start Calculation Samen
    FrontpageHypotheek.Is de pagina geladen?
    FrontpageHypotheek.Start hypotheek berekening
    HypotheekCalculation.Start hier uw hypotheek berekening
    HypotheekCalculation.Koopt u alleen of samen?
    Kies Samen
    HypotheekCalculation.Wat is uw leeftijd?
    HypotheekCalculation.Wat is de leeftijd van uw partner?
    HypotheekCalculation.Wat is uw werksituatie?
    HypotheekCalculation.Wat is uw bruto inkomen per jaar?
    HypotheekCalculation.Wat is de werksituatie van uw partner?
    HypotheekCalculation.Wat is het bruto inkomen per jaar van uw partner?
    HypotheekCalculation.Heeft u of uw partner een studieschuld?
    HypotheekCalculation.Hebben jullie leningen?
    HypotheekCalculation.Betaalt één van jullie alimentatie?
    HypotheekCalculation.Heeft u al een koopwoning?
    HypotheekCalculation.Hoeveel geld wilt u zelf inbrengen?
    HypotheekCalculation.Uiteindelijke berekening Samen











    