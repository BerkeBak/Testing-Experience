*** Settings ***
Library    Browser


*** Variables ***


*** Keywords ***
Navigate To Page
    [Arguments]    ${Page}
    Click    selector=xpath=//*[@class="main-navigation"]//*[@name="Navigation ${Page}"]
    Wait For Load State    domcontentloaded    timeout=3s
    Get Text    //*[@id="selectedinsurance"]    equal    ${Page} Insurance

