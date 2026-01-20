*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Using the href attribute is safer than text here
${LOGIN_LINK}     xpath=//a[@href='/login']
${LOGOUT_LINK}    xpath=//a[@href='/logout']
${USER_INFO}      xpath=//li[contains(., 'Logged in as')]

*** Keywords ***
Click Signup Login Button
    Wait Until Element Is Visible    ${LOGIN_LINK}
    Click Element    ${LOGIN_LINK}

Verify User Is Logged In
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${LOGOUT_LINK}
    Element Should Contain    ${USER_INFO}    ${username}