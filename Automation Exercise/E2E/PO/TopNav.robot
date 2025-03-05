*** Settings ***
Library    Browser


*** Variables ***
${BUTTON_SIGNUP/LOGIN} =                 xpath=//*[contains(@href, 'login')]
${ACCOUNT_NAME} =                        Henk
${BUTTON_LOGOUT} =                       xpath=//*[contains(@href, 'logout')]
${BUTTON_CONTACTUS} =                    xpath=//*[contains(@href, 'contact')]
${BUTTON_TEST_CASES} =                   xpath=//*[contains(@href, 'test_cases')]
${BUTTON_PRODUCTS} =                     xpath=//*[contains(@href, 'products')]
${BUTTON_CART} =                         xpath=//*[contains(@href, 'view_cart')]//parent::li

*** Keywords ***
Navigate To Login Page
    Click                        ${BUTTON_SIGNUP/LOGIN}
    Verify Login Page Loaded


Verify Login Page Loaded    
    Wait For Elements State    text="Login to your account"    visible


Verify If Logged In With User
    [Arguments]    ${Username}
    Wait For Elements State             text="${Username}"    visible


Delete Account
    Click                        xpath=//*[contains(@href, 'delete_account')]


Logout
    Click                        ${BUTTON_LOGOUT}      
    Verify Login Page Loaded          


Navigate To Contact Us Page
    Click                        ${BUTTON_CONTACTUS}
    Verify Contact Us Page Loaded


Verify Contact Us Page Loaded
    Wait For Elements State             text="Get In Touch"    visible


Navigate To Test Cases Page
    Click                        ${BUTTON_TEST_CASES}
    Verify Test Cases Page Loaded


Verify Test Cases Page Loaded
    Wait For Elements State             text="Test Cases"    visible


Navigate To Product Page
    Click                        ${BUTTON_PRODUCTS}
    Verify Product Page Loaded


Verify Product Page Loaded
    Wait For Elements State           text="All Products"    visible


Navigate To Cart Page
    Click                        ${BUTTON_CART}