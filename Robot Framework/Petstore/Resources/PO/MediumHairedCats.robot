*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${LAPERM_ADD_TO_SHOPPING_CART_BUTTON} =                 //*[@id="content"]/div[2]/div[4]/div/div[2]/div[2]/button[1]

*** Keywords ***
Click "ADD TO SHOPPING CART" Button at LaPerm
    Click Element                                       ${LAPERM_ADD_TO_SHOPPING_CART_BUTTON}

Verify if LaPerm is added to Shopping Cart   
    Wait Until Page Contains                            Success: You have added LaPerm to your shopping cart!
    Sleep    1s    
