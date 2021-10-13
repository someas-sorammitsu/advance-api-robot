*** Settings ***
Library    RequestsLibrary

*** Test Case ***
POST Data
    Create Session    mypost      http://localhost:3000
    ${headers}=      Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary         name=my Post     phone=0987656  Location=Phnom Penh
    ${response}=    POST On Session     mypost        users       json=${body}     expected_status=anything
    Log To Console     ${response}
    Log To Console     ${response.content}