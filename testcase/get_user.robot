*** Settings ***
Library    RequestsLibrary
*** Test Case ***
TC1 Get user
    Create Session    get_session         http://localhost:3000
    ${response}=      GET On Session    get_session        users
    Log To Console    ${response}   
    Log To Console    ${response.content}