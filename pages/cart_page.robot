*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PROCEED_BTN}      class=check_out

*** Keywords ***
Proceed To Checkout
    Wait Until Element Is Visible    ${PROCEED_BTN}
    Click Element    ${PROCEED_BTN}