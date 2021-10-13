*** Settings ***
Resource    ../3_api-keyword/api_user.robot
*** Test Case ***
Test update user info
    API Update Requests       9    Hello VH    09876789