*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    XML
Library    String


*** Variables ***  


*** Keywords ***
Verify Product Is In Cart
    [Arguments]    @{Price_Of_Products}
    FOR    ${Item}    IN    @{Price_Of_Products}
        ${Product_Number}  Fetch From Left    ${Item}    :
        ${Price}  Fetch From Right    ${Item}    :
        Log  {Product_Number} has ${Price} as Price labeled 
        Page Should Contain Element           //*[@id="product-${Product_Number}"]
        Element Should Contain                //*[@id="product-${Product_Number}"]/*[@class="cart_quantity"]/*[@class="disabled"]    1
        Element Should Contain                //*[@id="product-${Product_Number}"]/*[@class="cart_price"]/p    Rs. ${Price}
        Element Should Contain                //*[@id="product-${Product_Number}"]/*[@class="cart_total"]/p    Rs. ${Price}
    END


Verify Quantity Of Product Is In Cart
    [Arguments]    ${Product_Number}    ${Quantity}
    Page Should Contain Element           //*[@id="product-${Product_Number}"]
    Element Should Contain                //*[@id="product-${Product_Number}"]/*[@class="cart_quantity"]/*[@class="disabled"]    ${Quantity}


Click on Checkout Button
    Click Element    //*[@class="btn btn-default check_out"]


Checkout Popup - Register/Login
    Wait Until Element Is Visible    //*[@class="modal-title w-100"]
    Click Element    //*[@href="/login"]/u
    Wait Until Page Contains    New User Signup!


Verify Searched Products Are In Cart
    FOR    ${Product_ID}    IN    @{Product_IDs}
        Page Should Contain Element           //*[@id="product-${Product_ID}"]
    END

Verify ProductId Is In Cart
    [Arguments]    ${Product_ID}
    Page Should Contain Element           //*[@id="product-${Product_ID}"]