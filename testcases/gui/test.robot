*** Settings ***
Resource    ../../imports/import.robot
Test Teardown    Close All Browsers
Force Tags  gui

*** Test Cases ***
Add and Remove Elements
    [Tags]    clicks
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_add_remove_elements}
    Wait Until Element Visible And Click    ${btn_add_element}
    Element Should Be Visible     ${btn_delete}
    Wait Until Element Visible And Click    ${btn_delete}
    Element Should Not Be Visible     ${btn_delete}

Dropdown List    
    [Tags]    list
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_dropdown}
    Select From List By Index    ${dropdown_select}    1
    Select From List By Label    ${dropdown_select}    Option 2

Handle Alert 
    [Tags]    alert
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_js_alert}
    Click Button    ${btn_js_alert}
    Alert Should Be Present    ${msg_js_alert}    action=LEAVE
    Handle Alert    ACCEPT    
    Alert Should Not Be Present    ${msg_js_alert}
    Element Text Should Be    ${msg_result_locator}    ${msg_success_click}

Handle Confirm
    [Tags]    alert
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_js_alert}
    Click Button    ${btn_js_confirm}
    Alert Should Be Present    ${msg_js_confirm}    action=LEAVE
    Handle Alert    ACCEPT
    Alert Should Not Be Present    ${msg_js_confirm}
    Element Text Should Be    ${msg_result_locator}    ${msg_clicked}${SPACE}Ok
    Click Button    ${btn_js_confirm}
    Alert Should Be Present    ${msg_js_confirm}    action=LEAVE
    Handle Alert    DISMISS
    Alert Should Not Be Present    ${msg_js_confirm}
    Element Text Should Be    ${msg_result_locator}    ${msg_clicked}${SPACE}Cancel

Handle Prompt
    [Tags]    alert
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_js_alert}
    Click Button    ${btn_js_prompt}
    Alert Should Be Present    ${msg_js_prompt}    action=LEAVE
    Input Text Into Alert    ${text}
    Alert Should Not Be Present    ${msg_js_prompt}
    Element Text Should Be    ${msg_result_locator}    ${msg_entered}${SPACE}${text}

*** Variables ***
${text}    Docker