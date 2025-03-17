*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
Verify LeftSideBar Contains Category
    Wait Until Page Contains    Category


Click On Category And Sub-Category
    [Arguments]    ${Category}    ${Sub-Category}
    Click Element                            //*[@href="#${Category}"]    
    Wait Until Element Is Visible            //*[@id="${Category}"]/descendant::*[contains(text(),"${Sub-Category}")]
    Click Element                            //*[@id="${Category}"]/descendant::*[contains(text(),"${Sub-Category}")]
    Wait Until Page Contains                 ${Category} - ${Sub-Category} Products


Click On Brand
    [Arguments]    ${Brand}
    Click Element                            //*[@href="/brand_products/${Brand}"]
    Wait Until Page Contains                 Brand - ${Brand} Products