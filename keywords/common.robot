*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait Until Element Visible And Click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

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
    Maximize Browser Window
