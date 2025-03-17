*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Verify Homepage Loaded
    Browser.Get Text  xpath=//*[@class="features_items"]/h2    should be    'Features Items'


Verify Recommended Items Are Visible
    Wait For Elements State    //*[contains(text(),"recommended items")]    visible
    Should Contain   xpath=xpath=//*[@class="recommended_items"]/h2    recommended items


Add Recommended Item
    [Arguments]    ${Product_ID}
    #Product_ID 1-3 are not working.
    Click    //*[@class="carousel-inner"]//child::*[@data-product-id="${Product_ID}"]

