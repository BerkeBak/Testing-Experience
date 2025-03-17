*** Settings ***
Library            Browser
Library            Dialogs
Resource           ../PO/TopNav.robot

*** Variables ***
${Url} =                         ${URL}
${Browser} =                     ${BROWSER}
${Cookies} =                     xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p

*** Keywords ***
Begin Web Test
    New Browser    chromium    False
    New Context
    New Page    ${Url}
    Accept Cookies
    ##Browser.Open Browser                       ${Url}    ${Browser}    False    args
    ##...                                 options=add_argument("--start-maximized"); add_extension(r"C:\\Programma's\\Robot framework\\CRX Files\\Stands AdBlocker - Chrome Web Store 2.1.34.0.crx")
    #Switch Window                       locator=Automation Exercise
    #Wait Until Page Contains            Features Items


Close Web Test
    TopNav.Navigate To Cart Page
    Check If Shopping Cart is Empty
    #Remove Items From Shopping Cart
    Browser.Close Browser  


Accept Cookies
    Click    ${Cookies}

Check If Shopping Cart is Empty
    ${Cart_Empty} =    Browser.Get Text   xpath=//*[@id="empty_cart"]/p/b
    Run Keyword If    'Cart is empty!' == '${Cart_Empty}'    log    Cart is Empty

Remove Items From Shopping Cart
    #Functioneert als er maar 1 item in the shopping cart zit.
    ${Count} =    Browser.Get Element Count    xpath=//*[@class="fa fa-times"]    >    0
    WHILE    '${Count} > 0'
        Click    xpath=//*[@class="fa fa-times"]
        Sleep    1s
        ${Count} =    Browser.Get Element Count    xpath=//*[@class="fa fa-times"]    >    0
    END

