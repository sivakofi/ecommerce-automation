*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Checkout Page Elements
${COMMENT_FIELD}    class=form-control
${PLACE_ORDER}      xpath=//a[@href='/payment']

# Payment Page Elements (Using data-qa is best here!)
${NAME_CARD}        css=input[data-qa='name-on-card']
${CARD_NUM}         css=input[data-qa='card-number']
${CVC_NUM}          css=input[data-qa='cvc']
${EXP_MONTH}        css=input[data-qa='expiry-month']
${EXP_YEAR}         css=input[data-qa='expiry-year']
${PAY_BTN}          css=button[data-qa='pay-button']

# Success Page
${SUCCESS_MSG}      css=p[style*='font-size: 20px']  # Or use data-qa if available

*** Keywords ***
Enter Comment And Place Order
    [Arguments]    ${comment}
    Wait Until Element Is Visible    ${COMMENT_FIELD}
    Input Text     ${COMMENT_FIELD}    ${comment}
    Click Element  ${PLACE_ORDER}

Enter Dummy Payment Details
    Wait Until Element Is Visible    ${NAME_CARD}
    Input Text     ${NAME_CARD}    Test User
    Input Text     ${CARD_NUM}     4111111111111111
    Input Text     ${CVC_NUM}      123
    Input Text     ${EXP_MONTH}    12
    Input Text     ${EXP_YEAR}     2030
    Click Button   ${PAY_BTN}

Verify Order Success Message
    Wait Until Element Is Visible    xpath=//b[contains(text(), 'Order Placed!')]
    Page Should Contain    Congratulations! Your order has been confirmed!