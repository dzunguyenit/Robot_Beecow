*** Settings ***
Documentation     /* LIST KEYWORD REUSE FOR REGITER PAGE */
...               /* Author: Phuoc Ha */
#Resource          ${CURDIR}${/}..${/}..${/}..${/}conf${/}selenium_config.robot
Resource          ${CURDIR}${/}..${/}..${/}..${/}resources${/}objects${/}popup${/}obj_login_register.robot

*** Keywords ***
Input Values Register Popup Page
    [Arguments]    ${username}    ${password}    ${fullname}
    [Documentation]    REGISTER_KEY: Input Values Register Popup Page
    Wait Until Element Is Visible    id=${ID.TXT.POP.USERNAME}
    Input Text    id=${ID.TXT.POP.USERNAME}    ${username}
    Input Text    xpath=${XPATH.TXT.POP.PASSWORD}    ${password}
    Input Text    id=${ID.TXT.POP.YOUR.NAME}    ${fullname}

Click Button Continue Popup
    [Documentation]    REGISTER_KEY: Click button continue to register new user
    Click Button    xpath=${XPATH.BTN.CONTINUE}

Input Activation Code
    [Arguments]    ${activation_code}
    [Documentation]    REGISTER_KEY: Input Activation Code
    Wait Until Element Is Visible    id=${ID.TXT.CODE}
    Input Text    id=${ID.TXT.CODE}    ${activation_code}

Click Button Verify And Login
    [Documentation]    REGISTER_KEY: Click Button Verify And Login
    Click Button    xpath=${XPATH.BTN.ACTIVE.CODE}