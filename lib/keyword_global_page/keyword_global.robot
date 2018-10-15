*** Settings ***
Documentation     /* LIST GLOBAL KEYWORD REUSE FOR PROJECT */
...               /* Author: Phuoc Ha */
Resource          ${CURDIR}${/}..${/}..${/}resources${/}datatest${/}data_global.robot
Resource          ${CURDIR}${/}..${/}..${/}resources${/}objects${/}obj_global.robot
Resource          ${CURDIR}${/}..${/}..${/}lib${/}keyword_function_page${/}popup${/}page_login.robot

*** Variables ***
# FLAGE VARIABLE

*** Keywords ***
Select Language
    [Arguments]    ${language_text}
    [Documentation]    GLOBAL_KEY: Click link language in getstarted popup
    Click Link    ${language_text}

Click Button GetStarted
    [Documentation]    GLOBAL_KEY: Click button getstarted when page is open
    Wait Until Element Is Visible    id=${ID.BTN.GETSTARTED}
    Click Element    id=${ID.BTN.GETSTARTED}

Click Button Login Header
    [Documentation]    GLOBAL_KEY: Click button LOGIN at the HEADER menu
    Click Element    xpath=${XPATH.BTN.LOGIN}

Click Button Sign Up Header
    [Documentation]    GLOBAL_KEY: Click Button Sign Up Header
    Click Element    xpath=${XPATH.BTN.SIGNUP}

Open Browser And Click GetStarted Button
    [Arguments]    ${url_sever}
    [Documentation]    GLOBAL_KEY: Open Browser And Click GetStarted Button
#    Open Browser    ${url_sever}    ${BROWSER}
    ${SERVER_STANDALONE}    Catenate    SEPARATOR=    ${SERVER_SELENIUM}    :4444/wd/hub
    Set Suite Variable    ${SERVER_STANDALONE}
    Open Browser    ${url_sever}    ${BROWSER}    remote_url=${SERVER_STANDALONE}
    Set Selenium Speed    ${DELAY}
    Set Selenium Timeout    ${TIMEOUT}
    Maximize Browser Window
    Select Language    English
    Click Button GetStarted

Log In
    [Arguments]    ${url_sever}    ${username}    ${password}
    [Documentation]    GLOBAL_KEY: Click button get started when browser is open, then login into Beecow page with valid data
    Open Browser And Click GetStarted Button    ${url_sever}
    Click Button Login Header
    Input Values Login Page    ${username}    ${password}
    Click Button Login Popup

############ VERIFY KEYWORDS #########

Verify Title Of Current Page
    [Arguments]    ${title_page}
    [Documentation]    GLOBAL_KEY: Verify TITLE of Current Page
    Title Should Be    title=${title_page}