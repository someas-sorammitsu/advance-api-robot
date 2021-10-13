*** Settings ***
Documentation    Suite description
Resource        ../3_api-keyword/api_user.robot
*** Test Cases ***
PLACE
    API GET PLACE DATA        7
# POST PLACE
#     API POST PLACE DATA    Krang Dei Meas     Kampong Chhnang
# PLACE
#      API GET PLACE DATA