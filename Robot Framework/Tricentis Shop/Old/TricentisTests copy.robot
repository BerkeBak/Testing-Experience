*** Settings ***
Resource                      ../Resources/Common.robot
Resource                      ../Resources/TricentisApp.robot
Resource                      ../PO/InsurancePage.robot

Library                    DataDriver    file=./resource/Testdata.csv    sheet_name=Testdata
...    #file=${None}    file_search_strategy=None

Suite Setup                    Open Browser    browser=chromium    headless=False
Suite Teardown                Close Browser
Test Setup                    Begin Web Test
Test Teardown                 Close Web Test
Test Template                Automobile Insurance

*** Variables ***


*** Test Cases ***    Make    Engine Performance    Date of Manufacture    Number of Seats    Fuel Type    List Price    License Plate Number    Annual Mileage    First Name        Last Name    Date of Birth    Gender    County        Zipcode    Occupation    Hobbies    Start Data    Insurancxe Sum    Merit rating    Damage Insurance    Optional Products    Courtesy Car    Price Ultimate    Email            Username    Password
Audi                  Audi    1500                  06/12/2007             4                  Diesel       25000         AB-12-CD                2000              Henk              Henker       01/01/1999       Male      Netherlands   1234       Employee      Speeding   05/03/2025    5.000.000,00      Bonus 1         No Coverage         Euro Protection      Yes             2,676.00          Henk@Henk.com    Henk        Henker123
#Volvo                 Volvo   1750                  02/08/2013             5                  Petrol       35000         CD-34-EF                3333              Pieter        Pietering    08/08/1988       Female    Netherlands   5678       Farmer        Skydiving

*** Keywords ***
Automobile Insurance
    [Arguments]    ${Make}  ${Engine Performance}  ${Date of Manufacture}  ${Number of Seats}  ${Fuel Type}  ${List Price}  ${License Plate Number}  ${Annual Mileage}
    ...            ${First Name}  ${Last Name}  ${Date of Birth}  ${Gender}  ${Country}  ${Zipcode}  ${Occupation}  ${Hobbies}
    ...            ${Start Date}  ${Insurance Sum}  ${Merit Rating}  ${Damage Insurance}  ${Optional Products}  ${Courtesy Car}
    ...            ${Price Ultimate}
    ...            ${Email}    ${Username}    ${Password}
    TopNav.Navigate To Page    Automobile
    InsurancePage.Enter Vehicle Data     ${Make}  ${Engine Performance}  ${Date of Manufacture}  ${Number of Seats}  ${Fuel Type}  ${List Price}  ${License Plate Number}  ${Annual Mileage}
    InsurancePage.Enter Insurant Data    ${First Name}  ${Last Name}  ${Date of Birth}  ${Gender}  ${Country}  ${Zipcode}  ${Occupation}  ${Hobbies}
    InsurancePage.Enter Product Data    ${Start Date}  ${Insurance Sum}  ${Merit Rating}  ${Damage Insurance}  ${Optional Products}  ${Courtesy Car}
    InsurancePage.Select Price Option    ${Price Ultimate}
    InsurancePage.Send Quote    ${Email}    ${Username}    ${Password}
    InsurancePage.Conformation Succes
    Execute Manual Step    Wait