*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_URL}    https://automationexercise.com/api

*** Test Cases ***
Get All Products List Via API
    [Documentation]    Verifies the backend returns product data (Status 200).
    Create Session    mysession    ${API_URL}
    
    # Send GET Request
    ${response}=    GET On Session    mysession    /productsList
    
    # Validation 1: Status Code
    Should Be Equal As Strings    ${response.status_code}    200
    
    # Validation 2: Check Content
    ${json_response}=    Set Variable    ${response.json()}
    Log    ${json_response}
    
    # Verify the API response contains "products"
    Dictionary Should Contain Key    ${json_response}    products