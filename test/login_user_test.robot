*** Settings ***
Documentation     Login scenarios (Positive and Negative)
Resource          ${EXECDIR}/common.robot
Resource          ${EXECDIR}/pages/header_nav.robot
Resource          ${EXECDIR}/pages/login_page.robot

Test Setup        Start Test
Test Teardown     End Test

*** Variables ***
${VALID_EMAIL}       test_robot_123@example.com
${VALID_PASSWORD}    password123

*** Test Cases ***
Test Case 1: Login Success
    [Documentation]    Verify a user can log in with valid info.
    Click Signup Login Button
    Perform Login    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Verify User Is Logged In    TestUser

Test Case 2: Login Failure (Wrong Password)
    [Documentation]    Verify error message appears.
    Click Signup Login Button
    Perform Login    ${VALID_EMAIL}    wrong_pass_123
    
    # Verify the red error text appears
    Wait Until Page Contains    Email Address or Password is incorrect!

Test Case 3: Login Failure (Empty Fields)
    [Documentation]    Verify what happens if we submit nothing.
    Click Signup Login Button
    Perform Login    ${EMPTY}    ${EMPTY}
    
    # Verify we are still on the login page (Login header is still visible)
    Verify Login Page Loaded