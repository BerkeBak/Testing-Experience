*** Settings ***
Documentation     ???
Resource          ../Resources/FrontOfficeApp.robot
Resource          ../Resources/CommonWeb.robot
Test Setup        Begin Web Test
Test Teardown     End Web Test

# robot -d results tests/Front_Office.robot

*** Variables ***
${BROWSER} =           edge
${URL} =               https://automationplayground.com/front-office/

*** Test Cases ***
Should be able to acces "Team" page
    [Documentation]    This is test 1
    [Tags]             test1
    FrontOfficeApp.Go to Landing Page
    FrontOfficeApp.Go to "Team" Page    

"Team" page should match requirements
    [Tags]             test2
    FrontOfficeApp.Go to Landing Page
    FrontOfficeApp.Go to "Team" Page
    FrontOfficeApp.Validate "Team" Page
