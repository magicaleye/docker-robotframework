***Settings***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

***Keywords***  
Response status code should be
    [Arguments]     ${expectedCode}  
    Status Should be    ${expectedCode}     ${response}

Set place_id variable for later use 
    ${place_id}=    Get value from Json    ${response.json()}    place_id
    ${place_id}=    Get From List    ${place_id}    0
    Set Suite Variable  ${place_id} 

Verify response data and request body
    [Arguments]     ${jsonNode}
    ${expected}=    Get value from Json    ${body}   ${jsonNode}
    ${actual}=      Get value from Json    ${response.json()}   ${jsonNode}  
    Should be Equal     ${expected}     ${actual} 

Verify response data with a value
    [Arguments]     ${jsonNode}     ${expected} 
    ${actual}=      Get value from Json    ${response.json()}   ${jsonNode} 
    ${actual}=    Get From List    ${actual}    0
    Should be Equal     ${expected}     ${actual}