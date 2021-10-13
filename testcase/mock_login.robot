*** Settings ***
Resource    ../3_api-keyword/mock_api.robot
*** Test Case ***
[TC1]Login Mock
    Login Mock API    admin    password
[TC2]Login Mock Fail
    Login Mock API    invalid     password
    