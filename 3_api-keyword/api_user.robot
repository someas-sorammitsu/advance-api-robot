*** Settings ***
Resource    ../2_commands/command.robot
*** Keywords ***


API GET DATA USER
    ${header}=    Create Dictionary
    ...        Content-Type=application/json
    ${resp}=    Get Data        ${url}          ${path_user}
    Log To Console       ${resp}
    Log To Console       ${resp.content}

API POST Data
    ${headers}=    Create Dictionary
    ...         Content-Type=application/json
    ...         Charset=UTF-8
    ${body}     Catenate

    ...     {
    ...           "name":"Samsung",
    ...           "phone":"0987654322"
    ...     }

    Log To Console   ${body}
    ${resp}=        POST Requests        ${url}          ${path_user}       ${body}          ${headers}
    Log To Console      ${headers}
    Log To Console  ${body}
    Log To Console      ${resp}
   #@@==============
Response keyword
    [Arguments]    ${resp}
    ${pname}    Get From Dictionary       ${resp}     place_name
    ${location}    Get From Dictionary    ${resp}     location  
    ${id}    Get From Dictionary    ${resp}    id
    Should Be Equal     ${pname}     Krang Dei Meas
    Log To Console    \n\n ${pname} 
    Log To Console    ${location} 
    Log To Console    ${id} 
    # Log To Console     ${resp}
    

 API GET PLACE DATA
    [Arguments]
    ...    ${id}
    ${header}=    Create Dictionary
    ...        Content-Type=application/json
    ${resp}=    Get Data        ${url}          ${path_place}/${id}
    Response keyword    ${resp.json()}
    # Log To Console       ${resp}
    # Log To Console       ${resp.content}

API POST PLACE DATA
    [Arguments]
    ...     ${place_name}
    ...     ${location}
    ${headers}=    Create Dictionary
    ...         Content-Type=application/json
    ...         Charset=UTF-8
    ${body}     Catenate

    ...     {
    ...           "place_name":"${place_name}",
    ...           "location":"${location}"
    ...     }

    Log To Console   ${body}
    ${resp}=        POST Requests        ${url}          ${path_place}       ${body}          ${headers}
    Log To Console      ${headers}
    Log To Console  ${body}
    Log To Console      ${resp}

API Update Requests
    [Arguments]
    ...       ${id}
    ...       ${name}
    ...       ${phone}
    ${headers}=    Create Dictionary
    ...         Content-Type=application/json
    ...         Charset=UTF-8
    ${body}     Catenate
    ...     {
    ...           "name":"${name}",
    ...           "phone":"${phone}"
    ...     }
    ${resp}=    Update Requests        ${url}          ${path_user}/${id}       ${body}          ${headers}
    Log To Console    ${resp}
    Log To Console    ${resp.content}

API Delet User Inofo
    [Arguments]
    ...    ${id}
    ${headers}=    Create Dictionary
    ...         Content-Type=application/json
    ...         Charset=UTF-8
    ${resp}=    Delete Request        ${url}          ${path_user}/${id}      ${headers}
    Log To Console     ${resp}
    