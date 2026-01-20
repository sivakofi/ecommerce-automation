*** Settings ***
Documentation     Full Lifecycle: Create User -> Buy -> Delete User
Library           String
Resource          ${EXECDIR}/common.robot
Resource          ${EXECDIR}/pages/header_nav.robot
Resource          ${EXECDIR}/pages/signup_page.robot
Resource          ${EXECDIR}/pages/products_pages.robot
Resource          ${EXECDIR}/pages/cart_page.robot
Resource          ${EXECDIR}/pages/payment_page.robot

Test Setup        Start Test
Test Teardown     End Test

*** Variables ***
${COMMON_PASSWORD}    password123

*** Test Cases ***
New User Can Register Buy And Delete Account
    [Documentation]    A complete journey test that cleans up after itself.

    # 1. REGISTER (The robot creates the user and remembers the name)
    ${CREATED_NAME}=    Register Random User    ${COMMON_PASSWORD}
    
    # 2. VERIFY LOGIN (Automation Exercise auto-logs you in after signup)
    Verify User Is Logged In    ${CREATED_NAME}

    # 3. BUY ITEM (Same logic as before)
    Go To    https://automationexercise.com/products
    Add First Product To Cart
    Proceed To Checkout
    Enter Comment And Place Order    "This is a robotic order"
    Enter Dummy Payment Details
    Verify Order Success Message

    # 4. CLEANUP (Delete the account to keep the system clean)
    Click Element    xpath=//a[@href='/delete_account']
    Wait Until Element Is Visible    xpath=//b[contains(text(), 'Account Deleted!')]
    Log    Successfully deleted user: ${CREATED_NAME}