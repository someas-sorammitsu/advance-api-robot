*** Settings ***
Library    RequestsLibrary
*** Variable ***

*** Keywords ***
Delete Data 
    [Arguments]
    ...    ${id}
    Create Session     delete      http://localhost:3000
    ${response}=    Delete On Session    delete    users/${id}  
    Log To Console     ${response}
    Log To Console    ${response.content}

*** Test Case ***
Delete User 
    Delete Data    5
   