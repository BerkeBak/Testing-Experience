*** Settings ***
Library             Browser
Resource            ../PO/Homepage.robot
Resource            ../PO/TopNav.robot
Resource            ../PO/LoginPage.robot
Resource            ../PO//SignupPage.robot
Resource            ../PO/AccountCreatedPage.robot
Resource            ../PO/DeleteAccountPage.robot
Resource            ../PO/ContactUsPage.robot
Resource            ../PO/ProductPage.robot
Resource            ../PO/Footer.robot
Resource            ../PO/ShoppingCartPage.robot
Resource            ../PO/CheckoutPage.robot
Resource            ../PO/PaymentPage.robot
Resource            Common.robot
Resource            ../PO/LeftSideBar.robot

*** Variables ***
${Testing}
${Product_Number}
@{Price_Of_Products}

${Valid Email Address} =                           Henk@Henk.com
${Valid Username} =                                Henk
${Valid Password} =                                HenkHenk
${Invalid Email Address} =                         Error@Error.com
${Invalid Username} =                              Error
${Invalid Password} =                              ErrorError

*** Keywords ***
Register User 
    TopNav.Navigate To Login Page
    LoginPage.New User Signup        ${Valid Username}    ${Valid Email Address}
    SignupPage.Register User         ${Valid Password}    ${Valid Username}
    TopNav.Verify If Logged In With User    ${Valid Username}
    #Delete Account


Delete Account
    TopNav.Delete Account
    DeleteAccountPage.Verify Page Loaded
    DeleteAccountPage.Click Continue Button


Login User with correct email and password
    TopNav.Navigate To Login Page
    LoginPage.Login User    ${Valid Email Address}    ${Valid Password}
    TopNav.Verify If Logged In With User    ${Valid Username}


Login User with incorrect email and password
    TopNav.Navigate To Login Page
    LoginPage.Login User    ${Invalid Email Address}    ${Invalid Password}
    LoginPage.Verify Invalid Credentials Error


Logout User
    Login User with correct email and password
    TopNav.Logout


Register User with existing email
    TopNav.Navigate To Login Page
    LoginPage.New User Signup    ${Valid Username}    ${Valid Email Address}
    LoginPage.Verify Existing Credentials Error


Contact Us Form
    TopNav.Navigate To Contact Us Page
    ContactUsPage.Send Contact Form
    Homepage.Verify Homepage Loaded

    
Navigate To Test Cases Page
    TopNav.Navigate To Test Cases Page

Go To The Detail Page of Product
    [Arguments]    ${Product_Number}
    TopNav.Navigate To Product Page
    ProductPage.Navigate To Product Detail Page    ${Product_Number}

Search Product
    [Arguments]    ${Searched_Product}
    TopNav.Navigate To Product Page
    ProductPage.Search Product     ${Searched_Product}
    ProductPage.Verify Amount of Searched Products Are On The Page    ${Searched_Product}
    
Subscribe On Footer
    Footer.Focus On Footer
    Footer.Subscribe


Subscribe On Cart Page
    TopNav.Navigate To Cart Page
    Subscribe


Add First And Second Product To Cart
    TopNav.Navigate To Product Page
    ProductPage.Get Product Prices
    ProductPage.Add Product To Cart    1
    ProductPage.Continue Shopping
    ProductPage.Add Product To Cart    2
    ProductPage.View Cart
    ShoppingCartPage.Verify Product Is In Cart    @{Price_Of_Products}

Verify Product quantity in Cart
    TopNav.Navigate To Product Page
    ProductPage.Navigate To Product Detail Page    5
    ProductPage.Add Quantity To Cart    4
    ProductPage.View Cart
    ShoppingCartPage.Verify Quantity Of Product Is In Cart    5    4 


Place Order: Register While Checkout
    Buy Product
    Checkout
    ShoppingCartPage.Checkout Popup - Register/Login
    Register User
    TopNav.Verify If Logged In With User
    TopNav.Navigate To Cart Page
    Checkout
    CheckoutPage.Verify Address Details
    CheckoutPage.Verify Billing Address
    CheckoutPage.Enter Description In Comment Area
    CheckoutPage.Click Place Order Button
    PaymentPage.Enter Payment Details
    PaymentPage.Wait For Succes message
    Delete Account


Buy Product
    TopNav.Navigate To Product Page
    ProductPage.Add Product To Cart    6
    ProductPage.View Cart


Checkout
    ShoppingCartPage.Click on Checkout Button


Place Order: Register Before Checkout
    Navigate To Login Page
    Register User
    TopNav.Verify If Logged In With User
    Buy Product
    Checkout
    CheckoutPage.Verify Address Details
    CheckoutPage.Verify Billing Address
    CheckoutPage.Enter Description In Comment Area
    CheckoutPage.Click Place Order Button
    PaymentPage.Enter Payment Details
    PaymentPage.Wait For Succes message
    Delete Account


Place Order: Login Before Checkout
    Navigate To Login Page
    Login To Your Account
    TopNav.Verify If Logged In With User
    Buy Product
    Checkout
    CheckoutPage.Verify Address Details
    CheckoutPage.Verify Billing Address
    CheckoutPage.Enter Description In Comment Area
    CheckoutPage.Click Place Order Button
    PaymentPage.Enter Payment Details
    PaymentPage.Wait For Succes message
    #Delete Account


Remove Products From Cart
    Buy Product
    Common.Remove Items From Shopping Cart


View Category Products
    LeftSideBar.Verify LeftSideBar Contains Category
    LeftSideBar.Click On Category And Sub-Category    Women    Dress
    LeftSideBar.Click On Category And Sub-Category    Men    Tshirts


View & Cart Brand Products
    TopNav.Navigate To Product Page
    LeftSideBar.Click On Brand    Polo
    LeftSideBar.Click On Brand    H&M


Search Products and Verify Cart After Login
    TopNav.Navigate To Product Page
    Search Product    Dress
    ProductPage.Add Searched Products To Cart
    TopNav.Navigate To Cart Page
    ShoppingCartPage.Verify Searched Products Are In Cart
    TopNav.Navigate To Login Page
    LoginPage.Login To Your Account
    TopNav.Navigate To Cart Page
    ShoppingCartPage.Verify Searched Products Are In Cart


Add Review On Product
    TopNav.Navigate To Product Page
    ProductPage.Click On View Product    1
    ProductPage.Write Review On ProductPage
    ProductPage.Click Submit Button On Review    


Add to cart from Recommended Items
    Footer.Focus On Footer
    Homepage.Verify Recommended Items Are Visible
    Homepage.Add Recommended Item    4
    ProductPage.View Cart
    ShoppingCartPage.Verify ProductId Is In Cart    4


Verify Address Details In Checkout Page
    TopNav.Navigate To Login Page
    LoginPage.New User Signup
    SignupPage.Register User
    TopNav.Verify If Logged In With User
    ProductPage.Add Product To Cart    2
    ProductPage.View Cart
    ShoppingCartPage.Click on Checkout Button
    CheckoutPage.Verify Address Details
    CheckoutPage.Verify Billing Address
    TopNaV.Delete Account
    