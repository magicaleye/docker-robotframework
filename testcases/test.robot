*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Test Setup       Set Log Level    DEBUG
Test Teardown    Close All Browsers

*** Variables ***
${url}    https://the-internet.herokuapp.com/
${BROWSER}    chrome
${BROWSER_VERSION}    stable
${headless}    ${False}
${menu_add_remove_elements}    //a[text()='Add/Remove Elements']
${menu_basic_auth}    //a[text()='Basic Auth']
${menu_dropdown}    //a[text()='Dropdown']
${btn_add_element}    //button[text()='Add Element']
${btn_delete}    //button[text()='Delete']
${msg_authorized}    //p[contains(text(), 'Congratulations')]
${dropdown_select}    id:dropdown 

*** Keywords ***
Wait Until Element Visible And Click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

Download File 
    [Arguments]    ${filename}
    Wait Until Element Visible And Click    ${filename}

Verify File Downloaded
    [Arguments]    ${path}
    File Should Exist    ${path}

Open Browser And Go To URL
    [Arguments]    ${url}    ${BROWSER}    ${BROWSER_VERSION}
    IF    ${headless}==${True}
        Open Browser    ${url}    ${BROWSER}      options=add_argument("--no-sandbox"); add_argument("--headless"); browser_version("${BROWSER_VERSION}")
    ELSE
        Open Browser    ${url}    ${BROWSER}      options=browser_version("${BROWSER_VERSION}")
    END
    ${info}=
    ...    Execute Javascript
    ...    return navigator.userAgent;
    Log To Console    ${info}    

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
