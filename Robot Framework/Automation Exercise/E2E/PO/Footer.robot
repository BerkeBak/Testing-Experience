*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Email Adress} =             Henk@Henk.com

*** Keywords ***
Focus On Footer
    Set Focus To Element       //*[@id='footer']
    Scroll Element Into View    //*[@id='footer']
    Page Should Contain        Subscription

Subscribe
    Input Text                        //*[@id='susbscribe_email']    ${Email Adress}
    Click Button                      //*[@id='subscribe']
    Page Should Contain               You have been successfully subscribed!
