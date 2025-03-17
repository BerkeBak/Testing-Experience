*** Settings ***
Resource              ../Resources/Common.robot
Resource              ../Resources/AutomationExerciseApp.robot
Test Setup            Begin Web Test
Test Teardown         Close Web Test

#robot -d Results Tests/AutomationExercise.robot
#robot -d Results -i 'Test Case 10' Tests/AutomationExercise.robot


*** Variables ***
${URL} =                https://automationexercise.com/
${BROWSER} =            chromium


*** Test Cases ***
Register User
    [Tags]              Test Case 1
    AutomationExerciseApp.Register User


Login User with correct email and password
    [Tags]              Test Case 2
    AutomationExerciseApp.Login User with correct email and password


Login User with incorrect email and password
    [Tags]              Test Case 3
    AutomationExerciseApp.Login User with incorrect email and password


Logout User
    [Tags]              Test Case 4
    AutomationExerciseApp.Logout User


Register User with existing email
    [Tags]              Test Case 5
    AutomationExerciseApp.Register User with existing email


Contact Us Form
    [Tags]              Test Case 6
    AutomationExerciseApp.Contact Us Form
    #Testcase gaat fout, omdat de Click Submit Button op de contact page niet functioneert in de script.

Verify Test Cases Page
    [Tags]              Test Case 7
    AutomationExerciseApp.Navigate To Test Cases Page

Verify All Products and product detail Page
    [Tags]              Test Case 8
    AutomationExerciseApp.Go To The Detail Page of Product    4

Search Product
    [Tags]              Test Case 9
    TopNav.Navigate To Product Page
    AutomationExerciseApp.Search Product    Sweater

Verify Subscription in home page
    [Tags]              Test Case 10
    AutomationExerciseApp.Subscribe On Footer

Verify Subscription in Cart page
    [Tags]              Test Case 11
    AutomationExerciseApp.Subscribe On Cart Page


Add Products in Cart
    [Tags]              Test Case 12
    AutomationExerciseApp.Add First And Second Product To Cart


Verify Product quantity in Cart
    [Tags]              Test Case 13
    AutomationExerciseApp.Verify Product quantity in Cart


Place Order: Register While Checkout
    [Tags]              Test Case 14
    AutomationExerciseApp.Place Order: Register While Checkout


Place Order: Register Before Checkout
    [Tags]              Test Case 15
    AutomationExerciseApp.Place Order: Register Before Checkout


Place Order: Login Before Checkout
    [Tags]              Test Case 16
    AutomationExerciseApp.Place Order: Login Before Checkout


Remove Products From Cart
    [Tags]              Test Case 17
    AutomationExerciseApp.Remove Products From Cart


View Category Products
    [Tags]              Test Case 18
    AutomationExerciseApp.View Category Products


View & Cart Brand Products
    [Tags]              Test Case 19
    AutomationExerciseApp.View & Cart Brand Products


Search Products and Verify Cart After Login
    [Tags]              Test Case 20
    AutomationExerciseApp.Search Products and Verify Cart After Login


Add Review On Product
    [Tags]              Test Case 21
    AutomationExerciseApp.Add Review On Product


Add to cart from Recommended Items
    [Tags]              Test Case 22
    AutomationExerciseApp.Add to cart from Recommended Items


Verify Address Details In Checkout Page
    [Tags]              Test Case 23
    AutomationExerciseApp.Verify Address Details In Checkout Page
