*** Settings ***
Documentation     Register a new user with a random email.
Library           String
Resource          ${EXECDIR}/common.robot
Resource          ${EXECDIR}/pages/header_nav.robot
Resource          ${EXECDIR}/pages/signup_page.robot

Test Setup        Start Test
Test Teardown     End Test

*** Test Cases ***
Register New User Successfully
    [Documentation]    Creates a unique user every time this test runs.
    
    # 1. Click Signup
    Click Signup Login Button
    
    # 2. Generate Random Email (The Pro Move)
    # This creates a string like 'UserxTy7z'
    ${RANDOM_STRING}=    Generate Random String    8    [LETTERS][NUMBERS]
    ${NEW_EMAIL}=        Set Variable    test_${RANDOM_STRING}@example.com
    ${NEW_NAME}=         Set Variable    User${RANDOM_STRING}
    
    Log    Registering with email: ${NEW_EMAIL}
    
    # 3. Fill Signup Info
    Fill Initial Signup Info    ${NEW_NAME}    ${NEW_EMAIL}
    
    # 4. Fill Details
    Fill Account Details    password123
    Fill Address Info       Test    User
    
    # 5. Verify Success
    Verify Account Created
    
    # 6. Verify we are logged in
    Verify User Is Logged In    ${NEW_NAME}