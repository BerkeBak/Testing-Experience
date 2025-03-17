*** Settings ***
Documentation            These are the testscripts for the Petstore
Resource                 ../Resources/PetstoreApp.robot
Resource                 ../Resources/CommonWeb.robot
Test Setup               Begin Web Test
Test Teardown            End Web Test
Library                  SeleniumLibrary
Library                  Telnet
Library                  Dialogs


# Commands
# robot -d Results tests/Petstore.robot


*** Variables ***
${BROWSER} =             chrome
${URL} =                 http://testobjectv1.westeurope.cloudapp.azure.com/index.php?route=common/home



*** Test Cases ***
Home page should load
    [Tags]                1001        Smoke         Home
    PetstoreApp.Go to Home Page

Login should succeed with valid credentials
    [Tags]                1002        Smoke         Login
    PetstoreApp.Go to Home Page
    PetstoreApp.Click "Login" link
    PetstoreApp.Log in with valid credentials

Login should fail with invalid credentials
    [Tags]                1003        Functional    Login
    PetstoreApp.Go to Home Page
    PetstoreApp.Click "Login" link
    PetstoreApp.Log in with invalid credentials

Login should fail with missing credentials
    [Tags]                1004        Functional    Login
    PetstoreApp.Go to Home Page
    PetstoreApp.Click "Login" link
    PetstoreApp.Log in with missing credentials

User should be able to log out
    [Tags]                1005        Functional    Logout
    PetstoreApp.Go to Home Page
    PetstoreApp.Click "Login" link
    PetstoreApp.Log in with valid credentials
    PetstoreApp.Click "Logout" button

Dropdown for the Shopping Cart should open and close
    [Tags]                1006        Smoke         Shopping Cart
    PetstoreApp.Go to Home Page
    PetstoreApp.Open dropdown menu Shopping Cart
    PetstoreApp.Close drop down menu Shopping Cart

Shopping Cart page should load
    [Tags]                1007        Smoke         Shopping Cart
    PetstoreApp.Go to Home Page
    PetstoreApp.Go to Shopping Cart Page

Shopping Cart should contain 0 items
    [Tags]                1008        Functional    Shopping Cart
    PetstoreApp.Go to Home Page
    PetstoreApp.Open dropdown menu Shopping Cart
    ShoppingCart.Verify Shopping Cart contains 0 items
    PetstoreApp.Go to Shopping Cart Page
    ShoppingCart.Verify Shopping Cart contains 0 items

Shopping Cart should contain an item
    [Tags]                1009        Functional    Shopping Cart
    PetstoreApp.Go to Home Page
    PetstoreApp.Go to Medium Haired Cat Page
    PetstoreApp.Add "LaPerm" to Shopping Cart
    PetstoreApp.Open dropdown menu Shopping Cart
    ShoppingCart.Verify Downdown Menu Shopping Cart contains LaPerm 
    PetstoreApp.Go to Shopping Cart Page
    ShoppingCart.Verify Shopping Cart contains an item

