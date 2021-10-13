*** Settings ***
Library     RequestsLibrary
*** Test Cases ***
Update Data
    Create Session    update_session        http://localhost:3000
    ${header}=        Create Dictionary     Content-Type=application/json 
    ${body}=        Create Dictionary        name=Hello    phone=09876560987
    ${response}=    PUT On Session    update_session        users/9      json=${body}      expected_status=anything
    Log To Console    ${response}
    Log To Console      ${response.content}
    