*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    String
Library    OperatingSystem
Library    Collections
Library    Process

*** Variables ***   
${SEARCH_BAR} =             //*[@id='search_product']
${SEARCH_BAR_BUTTON} =      //*[@id='submit_search']
${Related_Products} =          1
${counter_start} =             1
${counter_end} =               50
${i} =                         1
${Total_Related_Products}
${Overlay_Added!} =            //*[@class="modal-content"]
${Product_Price}
@{Product_Numbers} =    1  2
@{Product_IDs}

*** Keywords *** 
Navigate To Product Detail Page
    #The module will focus on the 'View Product' of the product. Which product is supplied through a number. 
    #The first product on the page is the number 1. The module will put the name of the product in a variable.
    #Then go to the product page and verify if the page contains the name of the product.
    [Arguments]    ${Product_Number}
    Set Focus To Element                                 //*[@href='/product_details/${Product_Number}']
    ${productblock} =           get webelement           //*[@data-product-id='${Product_Number}']//parent::div/p
    ${name_of_product} =        set variable             ${productblock.text}
    Click Element                                        //*[@href='/product_details/${Product_Number}']
    Wait Until Page Contains                             ${name_of_product}

Search Product
    [Arguments]                   ${Searched_Product}
    Input Text                    ${SEARCH_BAR}            ${Searched_Product}
    Click Button                  ${SEARCH_BAR_BUTTON}

Verify Amount of Searched Products Are On The Page 
    [Arguments]                   ${Searched_Product}
    Wait Until Page Contains                        Searched Products                                          
    ${amount_of_view_products_on_page}=             SeleniumLibrary.Get Element Count             //*[contains(@href,'product_details')]
    Log To Console                                  There are ${amount_of_view_products_on_page} products on the page

Add Product To Cart
    [Arguments]                         ${Product_Number}
    Scroll Element Into View                            //*[@class='productinfo text-center']/*[@data-product-id='${Product_Number}']
    Click Element                                       //*[@class='overlay-content']/*[@data-product-id='${Product_Number}']


Continue Shopping
    Wait Until Element Is Visible                        ${Overlay_Added!}
    Click Element                                        //*[@class="btn btn-success close-modal btn-block"]
    Wait Until Element Is Not Visible                    ${Overlay_Added!}


View Cart
    Wait Until Element Is Visible                        ${Overlay_Added!}
    Click Element                                        ${Overlay_Added!}//*[@href="/view_cart"]
    Wait Until Page Contains                             Shopping Cart


Get Product Prices
    ${Price_Of_Products} =  Create List
    FOR    ${Product_Number}    IN    @{Product_Numbers}
        Scroll Element Into View                            //*[@class='productinfo text-center']/*[@data-product-id='${Product_Number}']
        ${Price} =     Set Product Price To Product Number    ${Product_Number}
        Append To List    ${Price_Of_Products}    ${Product_Number}:${Price}
        Set Global Variable   ${Price_Of_Products}
    END


Set Product Price To Product Number
    [Arguments]    ${Product_Number}
    ${Text_Price}    Get Text            //a[@data-product-id='${Product_Number}']/ancestor::*[@class='overlay-content']/h2
    ${NonStrippedPrice}    Fetch From Right    ${Text_Price}    .
    ${Price}    Strip String    ${NonStrippedPrice}    both
    RETURN    ${Price}


Add Quantity To Cart
    [Arguments]    ${Quantity}
    Input Text                   //*[@id="quantity"]    ${Quantity}    True
    Click Element                //*[@class="btn btn-default cart"]


Add Searched Products To Cart
    ${Found_Products} =    Get WebElements    //*[@class='productinfo text-center']/*[@data-product-id]
    ${Product_IDs} =    Create List
    FOR    ${Found_Product}    IN    @{Found_Products}
        ${Product_ID} =     SeleniumLibrary.Get Element Attribute    ${Found_Product}    data-product-id
        Append To List    ${Product_IDs}    ${Product_ID}
    END
    Set Suite Variable    @{Product_IDs}    children=True
    FOR    ${Product_ID}    IN    @{Product_IDs}
        Scroll Element Into View                            //*[@class='productinfo text-center']/*[@data-product-id='${Product_ID}']
        Click Element                                       //*[@class='overlay-content']/*[@data-product-id='${Product_ID}']
        Continue Shopping        
    END


Click On View Product
    [Arguments]    ${Product_ID}
    Click Element    //*[@href="/product_details/${Product_ID}"]


Write Review On ProductPage
    Input Text    //*[@id="name"]        Henk Henk
    Input Text    //*[@id="email"]       Henk@Henk.com
    Input Text    //*[@id="review"]      This is my review


Click Submit Button On Review
    Click Element    //*[@id="button-review"]
    Wait Until Page Contains    Thank you for your review