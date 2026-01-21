*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_HEADER}      xpath=//h2[contains(text(), 'Login to your account')]
${EMAIL_FIELD}       css=input[data-qa='login-email']
${PASSWORD_FIELD}    css=input[data-qa='login-password']
${SUBMIT_BUTTON}     css=button[data-qa='login-button']

# NEW: We need this to check if the red text appears
${ERROR_MESSAGE}     xpath=//p[contains(text(), 'Email Address or Password is incorrect')]

*** Keywords ***
Verify Login Page Loaded
    Wait Until Element Is Visible    ${LOGIN_HEADER}

Perform Login
    [Arguments]    ${email}    ${password}
    Input Text     ${EMAIL_FIELD}       ${email}
    Input Text     ${PASSWORD_FIELD}    ${password}
    Click Button   ${SUBMIT_BUTTON}

# NEW: Call this in your "Negative" test case
Verify Login Error Appears
    Wait Until Element Is Visible    ${ERROR_MESSAGE}