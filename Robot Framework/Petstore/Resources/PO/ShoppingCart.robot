*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${DROPDOWN_SHOPPING_CART_ELEMENT} =             //*[@id="cart"]/button
${DROPDOWN_SHOPPING_CART_TABLE} =               //*[@id="cart"]/ul/li[1]/table 


*** Keywords ***
ShoppingCart.Click dropdown menu Shopping Cart
    Click Element                        cart-total    

ShoppingCart.Verify dropdown menu opens
    Get Element Attribute                ${DROPDOWN_SHOPPING_CART_ELEMENT}    aria-expanded="true"

ShoppingCart.Verify dropdown menu isn't open
    Get Element Attribute                ${DROPDOWN_SHOPPING_CART_ELEMENT}    aria-expanded="false"

Navigate to
    Click Element                        //*[@id="top-links"]/ul/li[4]/a/i

Verify Shopping Cart Loaded
    Wait Until Page Contains             Shopping Cart

Verify Shopping Cart contains 0 items
    Wait Until Page Contains             Your shopping cart is empty!    

Verify Shopping Cart contains an item
    Page Should Contain                  935.00€
 
Verify Downdown Menu Shopping Cart contains LaPerm
    Table Cell Should Contain            ${DROPDOWN_SHOPPING_CART_TABLE}   1   2    LaPerm
