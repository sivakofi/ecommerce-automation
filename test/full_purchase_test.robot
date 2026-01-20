*** Settings ***
Documentation     Full E-Commerce Flow
# Use ${EXECDIR} to start looking from the project root folder
Resource          ${EXECDIR}/common.robot
Resource          ${EXECDIR}/pages/header_nav.robot
Resource          ${EXECDIR}/pages/login_page.robot
Resource          ${EXECDIR}/pages/products_pages.robot
Resource          ${EXECDIR}/pages/cart_page.robot
Resource          ${EXECDIR}/pages/payment_page.robot

Test Setup        Start Test
Test Teardown     End Test

*** Variables ***
# USER MUST UPDATE THESE
${EMAIL}          test_robot_123@example.com 
${PASSWORD}       password123

*** Test Cases ***
Registered User Can Purchase Item
    [Documentation]    End-to-end flow with dummy payment.
    
    # 1. Login
    Click Signup Login Button
    Perform Login    ${EMAIL}    ${PASSWORD}
    Verify User Is Logged In    TestUser

    # 2. Add Item
    # We navigate home first to ensure we see the product list
    Go To    https://automationexercise.com/products
    Add First Product To Cart

    # 3. Checkout
    # (The previous keyword already clicked "View Cart" in the modal)
    Proceed To Checkout

    # 4. Confirm Address/Comment
    Enter Comment And Place Order    "Please deliver with care!"

    # 5. Payment
    Enter Dummy Payment Details

    # 6. Success Verification
    Verify Order Success Message