*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Select the first "View Product" button found
${FIRST_PRODUCT_VIEW}    xpath=(//a[contains(text(), 'View Product')])[1]
${ADD_TO_CART_BTN}       css=button[class*='cart']
${MODAL_VIEW_CART}       xpath=//u[contains(text(), 'View Cart')]

*** Keywords ***
Add First Product To Cart
    Wait Until Element Is Visible    ${FIRST_PRODUCT_VIEW}
    Click Element    ${FIRST_PRODUCT_VIEW}
    
    Wait Until Element Is Visible    ${ADD_TO_CART_BTN}
    Click Button    ${ADD_TO_CART_BTN}
    
    # Wait for the "Added!" modal to appear, then go to cart
    Wait Until Element Is Visible    ${MODAL_VIEW_CART}
    Click Element    ${MODAL_VIEW_CART}