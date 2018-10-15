*** Settings ***
Documentation     /* Test Suite Register new User on Beecow Site */
...               /* Author: Phuoc Ha */
Suite Setup       Connect To Database    psycopg2    ${DBNameCA}    ${DBUserCA}    ${DBPassCA}    ${DBHostCA}    ${DBPortCA}
Suite Teardown    Disconnect From Database
Test Teardown     Close All Browsers
Library           DatabaseLibrary
Resource          lib_register.robot

*** Variables ***
${DBHostCA}         192.168.1.221
${DBNameCA}         postgres
${DBUserCA}         postgres
${DBPassCA}         postgres
${DBPortCA}         5432


*** Test Cases ***
TCA0_Basic flow (B) - (0-sanityCheck)
    [Tags]    Smoke_Testing    Beecow    Login
    ${time}=    Evaluate    time.strftime("%d%m%Y%H%M%S", time.localtime())    time
    Log    ${time}
#    When I Register New User    ${sever_test}    user${time}@yopmail.com    ${pass_general}    User ${time}
#    ${active_code_db}=    Get Activation Code From Database By Email    user${time}@yopmail.com
    ${active_code_db}=    Get Activation Code From Database By Email    user30072018160143@yopmail.com
    Log    ${active_code_db}
#    And Input Activation Code    ${active_code_db}
#    Then Click Button Verify And Login
#    Then Verify User Logged Successfully    User ${time}


*** Keywords ***
I Register New User
    [Arguments]    ${url_sever}    ${username}    ${password}    ${fullname}
    [Documentation]    SUITE_KEY: Register new user
    Open Browser And Click GetStarted Button    ${url_sever}
    Click Button Sign Up Header
    Input Values Register Popup Page    ${username}    ${password}    ${fullname}
    Click Button Continue Popup

Get Activation Code From Database By Email
    [Arguments]    ${user_email}
    [Documentation]    SUITE_KEY: Get Activation Code From Database By Email
#    ${output_activation_code}=    Execute SQL String    SELECT "gateway-services".jhi_user.activation_key FROM "gateway-services".jhi_user WHERE "gateway-services".jhi_user.email='user30072018160143@yopmail.com'
    ${output_activation_code}=    Execute SQL String    SELECT activation_key FROM "gateway-services".jhi_user WHERE email='${user_email}'
    [Return]    ${output_activation_code}

# Command: robot tests/Register/Beecow_Register.robot