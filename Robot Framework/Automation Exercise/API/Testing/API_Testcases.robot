*** Settings ***
Resource          ../Resources/Allresources.resource


*** Variables ***
${BaseURL} =    https://automationexercise.com/api
${BODY} =    ${EMPTY}

*** Test Cases ***
GET All Products List
    Create A "GET" Request To "Products List"
    Verify If The Request Is Not Empty    ${BODY}

Post To All Products List
    Create A "POST" Request To "Products List"
    Verify If The Request Contains Response Code 405 and Message "This request method is not supported."    ${BODY}

Get All Brands List
    Create A "GET" Request To "Brands List"
    Verify If The Request Is Not Empty    ${BODY}

PUT To All Brands List
    Create A "PUT" Request To "Brands List"
    Verify If The Request Contains Response Code 405 and Message "This request method is not supported."    ${BODY}

Post To Search Product
    Create Session    Search Product   ${BaseURL}
    &{Data}=    Create Dictionary    search_product=jeans
    ${response}=    POST On Session   Search Product    /searchProduct    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200

Post To Search Product Without search_product Parameter
    Create Session    Search Product   ${BaseURL}
    ${response}=    POST On Session   Search Product    /searchProduct    data=&{EMPTY}    expected_status=200
    Log To Console    ${response.content}
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 400
    Should Contain    ${BODY}    "message": "Bad request, search_product parameter is missing in POST request."

Post To Verify Login With Valid Details
    Create Session    Login   ${BaseURL}
    &{Data}=    Create Dictionary    email=Henk@Henk.com    password=HenkHenk
    ${response}=    POST On Session   Login    /verifyLogin    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 200
    Should Contain    ${BODY}    "message": "User exists!"

Post To Verify Login Without Email Parameter
    Create Session    Login   ${BaseURL}
    &{Data}=    Create Dictionary    password=HenkHenk
    ${response}=    POST On Session   Login    /verifyLogin    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 400
    Should Contain    ${BODY}    "message": "Bad request, email or password parameter is missing in POST request."

Delete To Verify Login
    Create Session    Login   ${BaseURL}
    ${response}=    DELETE On Session   Login    /verifyLogin    expected_status=200
    Log To Console    ${response.content}
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 405
    Should Contain    ${BODY}    "message": "This request method is not supported."

Post To Verify Login With Invalid Details
    Create Session    Login   ${BaseURL}
    &{Data}=    Create Dictionary    email=Piet@Henk.com    password=PietHenk
    ${response}=    POST On Session   Login    /verifyLogin    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 404
    Should Contain    ${BODY}    "message": "User not found!"

Post To Create/Register User Account
    Create Session    Create   ${BaseURL}
    &{Data}=    Create Dictionary    name=Flip    email=Flip@Flip.com    password=FlipFlip    title=Mr    birth_data=05    birth_month=05    birth_year=1995    firstname=Flip    lastname=Flipper    company=None    address1=Flipstraat 5    address2=None    country=Netherlands    zipcode=9876EA    state=Drenthe    city=Assen    mobile_number=0612345678
    ${response}=    POST On Session   Create    /createAccount    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 201
    Should Contain    ${BODY}    "message": "User created!"

Delete Method To Delete User Account
    Create Session    Delete   ${BaseURL}
    &{Data}=    Create Dictionary    email=Flip@Flip.com    password=FlipFlip
    ${response}=    DELETE On Session   Delete    /deleteAccount    data=&{Data}    expected_status=200
    Log To Console    ${response.content}
    ${statuscode}=    Convert To String   ${response.status_code}
    Should Be Equal    ${statuscode}    200
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${BODY}    "responseCode": 200
    Should Contain    ${BODY}    "message": "Account deleted!"

*** Keywords ***
Create A "${TypeOfRequest}" Request To "${Alias}"
    IF    "${Alias}" == "Products List"
        ${Resource}=    Set Variable    /productsList
    ELSE IF    "${Alias}" == "Brands List"
        ${Resource}=    Set Variable    /brandsList
    ELSE IF    "${Alias}" == "Search Product"
        ${Resource}=    Set Variable    /searchProduct
    ELSE
        Log    Invalid Resource
    END

    IF    "${TypeOfRequest}" == "GET"
        Create Session    ${Alias}   ${BaseURL}
        ${response}=    GET On Session   ${Alias}    ${Resource}    expected_status=200
    ELSE IF    "${TypeOfRequest}" == "POST"
        Create Session    ${Alias}   ${BaseURL}
        ${response}=    POST On Session   ${Alias}    ${Resource}    expected_status=200
    ELSE IF    "${TypeOfRequest}" == "PUT"
        Create Session    ${Alias}   ${BaseURL}
        ${response}=    PUT On Session   ${Alias}    ${Resource}    expected_status=200
    ELSE IF    ${TypeOfRequest} == "DELETE"
        Log    DELETE Request
    ELSE
        Log    Invalid Request
    END
    ${response.body}=    Convert To String    ${response.content}
    Set Task Variable    ${BODY}    ${response.body}

Verify If The Request Is Not Empty
    [Arguments]    ${BODY}
    Should Not Be Empty    ${BODY}
    Should Contain    ${body}    "responseCode": 200

Verify If The Request Contains Response Code 405 and Message "This request method is not supported."
    [Arguments]    ${BODY}
    Log To Console    ${BODY}
    Should Contain    ${BODY}    "responseCode": 405, "message": "This request method is not supported."
