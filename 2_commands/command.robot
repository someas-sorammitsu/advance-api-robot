*** Settings ***
Resource    ../0_resources/import.robot
Resource    ../0_resources/url_test.robot
Resource    ../0_resources/path_url.robot
Resource    ../0_resources/mock_url.robot
Resource    ../0_resources/mock_path.robot

*** Keywords ***
Get Data
    [Arguments]       ${url}        ${path}
    Create Session    get_session         ${url}
    ${response}=      GET On Session    get_session       ${path}        expected_status=anything
    [Return]     ${response}
POST Requests
     [Arguments]       ${url}        ${path}      ${body}     ${headers}
     Create Session    mypost      ${url}
#     ${headers}=      Create Dictionary     ${headers}
#     ${data}=    Create Dictionary         ${body}
     ${response}=    POST On Session     mypost        ${path}       data=${body}            headers=${headers}    expected_status=anything
     [Return]     ${response}
Update Requests
    [Arguments]       ${url}        ${path}      ${body}     ${headers}
    Create Session    Update        ${url} 
    ${response}=      PUT On Session    Update        ${path}      data=${body}            headers=${headers}    expected_status=anything
    [Return]         ${response}

Delete Request
    [Arguments]       ${url}        ${path}     ${headers}
    Create Session    Delete     ${url}
    ${response}=      Delete On Session    Delete        ${path}       headers=${headers}    expected_status=anything
    [Return]         ${response}