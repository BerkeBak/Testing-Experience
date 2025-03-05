*** Settings ***
Resource          ../Resources/Allresources.resource


*** Variables ***
${BaseURL} =    https://automationexercise.com/api

*** Test Cases ***
Get All Products List
    Create Session    ProductList   ${BaseURL}
    ${response}=    GET On Session   ProductList    /productsList    expected_status=200
    ${body}=    Convert To String    ${response.content}
    Should Not Be Empty    ${body}

Post To All Products List
    Create Session    ProductList   ${BaseURL}
    ${response}=    POST On Session   ProductList    /productsList    expected_status=200
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "responseCode": 405, "message": "This request method is not supported."

Get All Brands List
    Create Session    BrandList   ${BaseURL}
    ${response}=    GET On Session   BrandList    /brandsList    expected_status=200
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "responseCode": 200

PUT To All Brands List
    Create Session    BrandList   ${BaseURL}
    ${response}=    PUT On Session   BrandList    /brandsList    expected_status=200
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    "responseCode": 405, "message": "This request method is not supported."

*** Keywords ***

    Create Session    "NameOfSession"   ${BaseURL}
    ${response}=    "TypeOfRequest" On Session   "NameOfSession"    "Resource"    expected_status=200
    ${body}=    Convert To String    ${response.content}