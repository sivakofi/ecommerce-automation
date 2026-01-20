*** Settings ***
Library    SeleniumLibrary
Library     String             # Needed for 'Generate Random String'
Resource    header_nav.robot   # Needed for 'Click Signup Login Button'

*** Variables ***
# Page 1: Initial Signup
${SIGNUP_NAME}      css=input[data-qa='signup-name']
${SIGNUP_EMAIL}     css=input[data-qa='signup-email']
${SIGNUP_BTN}       css=button[data-qa='signup-button']

# Page 2: Account Details
${GENDER_MALE}      id=id_gender1
${PASSWORD_FIELD}   css=input[data-qa='password']
${DAY_DROPDOWN}     css=select[data-qa='days']
${MONTH_DROPDOWN}   css=select[data-qa='months']
${YEAR_DROPDOWN}    css=select[data-qa='years']

# Address Information
${FIRST_NAME}       css=input[data-qa='first_name']
${LAST_NAME}        css=input[data-qa='last_name']
${ADDRESS}          css=input[data-qa='address']
${COUNTRY}          css=select[data-qa='country']
${STATE}            css=input[data-qa='state']
${CITY}             css=input[data-qa='city']
${ZIPCODE}          css=input[data-qa='zipcode']
${MOBILE}           css=input[data-qa='mobile_number']
${CREATE_BTN}       css=button[data-qa='create-account']

${ACCOUNT_CREATED}  xpath=//b[contains(text(), 'Account Created!')]
${CONTINUE_BTN}     css=a[data-qa='continue-button']

*** Keywords ***
Fill Initial Signup Info
    [Arguments]    ${name}    ${email}
    Input Text     ${SIGNUP_NAME}     ${name}
    Input Text     ${SIGNUP_EMAIL}    ${email}
    Click Button   ${SIGNUP_BTN}

Fill Account Details
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${GENDER_MALE}
    Click Element  ${GENDER_MALE}
    Input Text     ${PASSWORD_FIELD}    ${password}
    
    # Selecting from dropdowns
    Select From List By Value    ${DAY_DROPDOWN}    10
    Select From List By Value    ${MONTH_DROPDOWN}  5
    Select From List By Value    ${YEAR_DROPDOWN}   2000

Fill Address Info
    [Arguments]    ${fname}    ${lname}
    Input Text     ${FIRST_NAME}    ${fname}
    Input Text     ${LAST_NAME}     ${lname}
    Input Text     ${ADDRESS}       123 Robot Street
    Select From List By Value    ${COUNTRY}    United States
    Input Text     ${STATE}         New York
    Input Text     ${CITY}          New York
    Input Text     ${ZIPCODE}       10001
    Input Text     ${MOBILE}        1234567890
    Click Button   ${CREATE_BTN}

Verify Account Created
    Wait Until Element Is Visible    ${ACCOUNT_CREATED}
    Click Element    ${CONTINUE_BTN}

Register Random User
    [Documentation]    Generates a user, registers them, and RETURNS the email/password.
    [Arguments]    ${password}
    
    # Generate Random Data
    ${RANDOM_ID}=        Generate Random String    8    [LETTERS][NUMBERS]
    ${NEW_EMAIL}=        Set Variable    test_${RANDOM_ID}@example.com
    ${NEW_NAME}=         Set Variable    User${RANDOM_ID}
    
    # Perform Registration Steps
    Click Signup Login Button
    Fill Initial Signup Info    ${NEW_NAME}    ${NEW_EMAIL}
    Fill Account Details        ${password}
    Fill Address Info           Test    User
    Verify Account Created
    
    # CRITICAL: Send this data back to the test case!
    RETURN    ${NEW_NAME}