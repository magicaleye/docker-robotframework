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

Basic Authentication - Cancel
    [Tags]    auth
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_basic_auth} 
    Handle Alert     DISMISS
    Element Should Not Be Visible    ${msg_authorized}

Dropdown List    
    [Tags]    list
    Open Browser And Go To URL    ${url}     ${BROWSER}   ${BROWSER_VERSION}
    Wait Until Element Visible And Click    ${menu_dropdown}
    Select From List By Index    ${dropdown_select}    1
    Select From List By Label    ${dropdown_select}    Option 2
