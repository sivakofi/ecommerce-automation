*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_HEADER}      xpath=//h2[contains(text(), 'Login to your account')]
${EMAIL_FIELD}       css=input[data-qa='login-email']
${PASSWORD_FIELD}    css=input[data-qa='login-password']
${SUBMIT_BUTTON}     css=button[data-qa='login-button']

*** Keywords ***
Verify Login Page Loaded
    Wait Until Element Is Visible    ${LOGIN_HEADER}

Perform Login
    [Arguments]    ${email}    ${password}
    Input Text     ${EMAIL_FIELD}       ${email}
    Input Text     ${PASSWORD_FIELD}    ${password}
    Click Button   ${SUBMIT_BUTTON}