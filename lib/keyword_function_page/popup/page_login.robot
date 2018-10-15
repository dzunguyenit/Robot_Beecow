*** Settings ***
Documentation     /* LIST KEYWORD REUSE FOR LOGIN */
...               /* Author: Phuoc Ha */
Resource          ${CURDIR}${/}..${/}..${/}..${/}conf${/}selenium_config.robot
Resource          ${CURDIR}${/}..${/}..${/}..${/}resources${/}objects${/}popup${/}obj_login_register.robot

*** Keywords ***
Input Values Login Page
    [Arguments]    ${username}    ${password}
    [Documentation]    LOGIN_KEY: Input username & password in login page
    Wait Until Element Is Visible    id=${ID.TXT.POP.USERNAME}
    Input Text    id=${ID.TXT.POP.USERNAME}    ${username}
    Input Text    xpath=${XPATH.TXT.POP.PASSWORD}    ${password}

Click Button Login Popup
    [Documentation]    LOGIN_KEY: Click button login in popup loginơ
    Click Button    xpath=${XPATH.BTN.POP.LOGIN}

Log Out Beecow
    [Documentation]    LOGIN_KEY: Log Out Beecow
    Click Element    xpath=${xpath_lbl_profile_name}
    Wait Until Element Is Visible    xpath=${xpath_lnk_profile_logout}
    Click Element    xpath=${xpath_lnk_profile_logout}

############ VERIFY KEYWORDS #########

Verify User Logged Successfully
    [Arguments]    ${user_fullnname}
    [Documentation]    LOGIN_KEY: Verify fullname of user show on header profile menu
    Wait Until Page Contains Element    xpath=.//span[@class='txt'][text()='${user_fullnname}']

Verify The Error Message Should Be Displayed
    [Arguments]    ${error_msg}
    [Documentation]    LOGIN_KEY: Verify error message show for popup login
    Page Should Contain    ${error_msg}
#    Element Should Be Visible    xpath=${xpath_lbl_error_message}
#    Element Text Should Be    xpath=${xpath_lbl_error_message}     ${error_msg}