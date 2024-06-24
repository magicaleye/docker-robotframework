***Settings***
Resource    ../../imports/import.robot
Force Tags  api

***Test Cases***
Add a new place
    ${body}=    Load Json from File   ${CURDIR}/../../data/api/body.json
    Set Suite Variable  ${body}
    ${response}=    POST    ${API_URL}/maps/api/place/add/json    json=${body}   params=key=qaclick123
    Log To Console      \n${response.json()}
    Set Test Variable   ${response}
    Response status code should be  200
    Verify response data with a value   status    OK
    Set place_id variable for later use 

Get created place
    ${response}=    GET    ${API_URL}/maps/api/place/get/json    params=place_id=${place_id}&key=qaclick123
    Log To Console      \n${response.json()}
    Set Test Variable   ${response} 
    Response status code should be  200
    Verify response data and request body  name
    Verify response data and request body  phone_number
    Verify response data and request body  address

Update created place
    ${response}=    PUT    ${API_URL}/maps/api/place/get/json    params=place_id=${place_id}&key=qaclick123
    Log To Console      \n${response.json()}
    Set Test Variable   ${response}
    Response status code should be  200
    Verify response data and request body  name

Delete created place
    ${jsonString}=      Convert String to Json    {"place_id": "${place_id}"}
    Set Suite Variable  ${jsonString}
    ${response}=    DELETE    ${API_URL}/maps/api/place/delete/json    json=${jsonString}    params=key=qaclick123
    Log To Console      \n${response.json()}
    Set Test Variable   ${response} 
    Response status code should be  200
    Verify response data with a value  status  OK
