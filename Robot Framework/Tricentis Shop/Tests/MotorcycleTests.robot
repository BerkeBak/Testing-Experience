*** Settings ***
Resource                      ../Resources/Common.robot
Resource                      ../PO/TopNav.robot
Resource                      ../PO/InsurancePage.resource

Library                       DataDriver            file=./Testdata/TestData.xlsx      sheet_name=Motorcycle

Suite Setup                   Open Browser          browser=chromium        headless=False
Suite Teardown                Close Browser
Test Setup                    Begin Web Test
Test Teardown                 Close Web Test
Test Template                 Motorcycle Insurance


*** Test Cases ***
Motorcycle Insurance


*** Keywords ***
Truck Insurance
    [Tags]         Motorcycle
    [Arguments]    ${Make}  ${Engine Performance}  ${Date of Manufacture}  ${Number of Seats}  ${List Price}  ${Annual Mileage}
    ...            ${Fuel Type}  ${Payload}  ${Total Weight}
    ...            ${Price Ultimate}
    TopNav.Navigate To Page    Motorcycle
    InsurancePage.Enter Basic Vehicle Data     ${Make}  {Engine Performance}  ${Date of Manufacture}  ${Number of Seats}  ${List Price}  ${Annual Mileage}
    #InsurancePage.Enter Additional Data Motorcycle    ${Fuel Type}  ${Payload}  ${Total Weight}
    #InsurancePage.Proceed To Next Page After Vehicle Data
    #InsurancePage.Enter Insurant Data
    #InsurancePage.Enter Basic Product Data
    #InsurancePage.Proceed to Next Page After Product Data
    #InsurancePage.Select Price Option    ${Price Ultimate}
    #InsurancePage.Send Quote
    #InsurancePage.Conformation Succes
    Execute Manual Step    Wait