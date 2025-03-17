*** Settings ***
Resource    ../Resources/ABN_Tool_APP.robot
Resource    ../Resources/Common.robot
Test Setup       Begin Web Test
Test Teardown    Close Web Test

# robot -d Results Tests/ABN_Tool.robot


# Robot kan uitgebreid worden met 
# - Kiezen uit dropdownmenu bij werksituatie
# - Kijken of er herbruikbare stukken zijn
*** Variables ***
${URL} =                     https://www.abnamro.nl/nl/prive/hypotheken/maximale-hypotheek-berekenen.html
${BROWSER} =                 edge

*** Test Cases ***
Calculate Hypotheek Alleen
    ABN_Tool_APP.Start Calculation Alleen

Calculate Hypotheek Samen
    ABN_Tool_APP.Start Calculation Samen
    
    



