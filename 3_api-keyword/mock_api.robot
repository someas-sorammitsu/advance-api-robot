*** Settings ***
Resource    ../2_commands/command.robot
*** Keywords ***
Login Mock API
    [Arguments]
    ...    ${username}
    ...    ${password}
    ${headers}=    Create Dictionary
    ...         Content-Type=application/json
    ...         Charset=UTF-8
    ${body}     Catenate
    ...    {
    ...        "data": {
    ...            "username": "${username}",
    ...            "password": "${password}"
    ...        }
    ...    }
    ${resp}=        POST Requests        ${mock_url}          ${mock_path}       ${body}          ${headers}
    Should Be Equal As Strings    ${resp.status_code}        200
    Response Mock Login    ${resp.json()}
    
Response Mock Login
    [Arguments]    ${resp}
    ${status}    Get From Dictionary    ${resp}    status
    ${code}    Get From Dictionary       ${status}      code
    ${username}    Get From Dictionary       ${status}      username
    ${password}    Get From Dictionary       ${status}      password
    ${message}    Get From Dictionary       ${status}      message
    Should Be Equal    ${code}    success
    Should Be Equal    ${username}    ${username}
    
    # Log To Console    \ncode: ${code} 
    # Log To Console    username: ${username} 
    # Log To Console    password: ${password} 
    # Log To Console    message: ${message} 