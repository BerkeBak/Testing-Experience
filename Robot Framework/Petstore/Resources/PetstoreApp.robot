*** Settings ***
Library        SeleniumLibrary
Resource        ./PO/Homepage.robot
Resource        ./PO/Login.robot
Resource        ./PO/Logout.robot
Resource        ./PO/ShoppingCart.robot
Resource        ./PO/Nav.robot
Resource        ./PO/MediumHairedCats.robot

*** Variables ***





*** Keywords ***
Go to Home Page
    Homepage.Navigate to
    Homepage.Verify Page Loaded


Click "Login" link
    Login.Click My Account
    Login.Click Login
    Login.Verify Page Loaded


Log in with valid credentials
    Login.Log in with valid credentials
    Login.Click "Login" Button
    Login.Verify Login Page Loaded


Log in with invalid credentials
    Login.Log in with invalid credentials
    Login.Click "Login" Button

Log in with missing credentials
    Login.Log in with missing credentials

Click "Logout" button
    Logout.Click "My Account" button
    Logout.Click "Logout" button
    Logout.Verify Logout Page Loaded

Open dropdown menu Shopping Cart
    ShoppingCart.Click dropdown menu Shopping Cart
    ShoppingCart.Verify dropdown menu opens

Close drop down menu Shopping Cart
    ShoppingCart.Click dropdown menu Shopping Cart
    ShoppingCart.Verify dropdown menu isn't open

Go to Shopping Cart Page
    ShoppingCart.Navigate to
    ShoppingCart.Verify Shopping Cart Loaded

Go to Medium Haired Cat Page
    Nav.Navigate to Medium Haired Cat Page
    Nav.Verify Medium Haired Cat Page Loaded

Add "LaPerm" to Shopping Cart
    MediumHairedCats.Click "ADD TO SHOPPING CART" Button at LaPerm
    MediumHairedCats.Verify if LaPerm is added to Shopping Cart  