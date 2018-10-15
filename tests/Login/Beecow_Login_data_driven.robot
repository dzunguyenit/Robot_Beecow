*** Settings ***
Documentation     /* Test Suite Login Beecow with data driven */
...               /* Author: Phuoc Ha */
Force Tags        DataDriven
Test Setup        Open Browser And Goes To Login Page    ${SERVER_TEST}
Test Template     The Error Message Should Shown
Test Teardown     Close All Browsers
Resource          ${CURDIR}${/}lib_login.robot

*** Variables ***
${expected_error_msg}    Please enter email / phone number and password
${expected_error_msg_invalid_email}    Invalid email
${expected_error_msg_invalid_password}    Minimum 6 characters
${expected_error_msg_wrong_pass}    Wrong email / phone number or password


*** Test Cases ***
TC001_Login Fail With EMAIL validation - Data Driven
    [Tags]    TC001    RUN
    ${empty}    ${empty}    ${expected_error_msg}    # Both Fields are Empty
    ${empty}    ${pass_general}    ${expected_error_msg}    # The Username is Empty
    prodstoreauto@yopmail    ${pass_general}    ${expected_error_msg}    # The Username is Wrong
    prodstoreauto@yopmail    ${pass_general}    ${expected_error_msg_invalid_email}    # The Username is Wrong
    <script>alert('Injected!');</script>    ${pass_general}    ${expected_error_msg_invalid_email}    # The Username is javascript injection
    SELECT * FROM User where userId ='${store_product_useremail}' or '1'='1'    ${pass_general}    ${expected_error_msg_invalid_email}    # The Username is SQL injection

TC002_Login Fail With PASSWORD validation - Data Driven
    [Tags]    TC002    RUN
    ${store_product_useremail}    ${empty}    ${expected_error_msg}    # The Password is Empty
    ${store_product_useremail}    12345    ${expected_error_msg_invalid_password}    # The Password is Empty
    ${store_product_useremail}    WrongPass    ${expected_error_msg_wrong_pass}    # The Password is Wrong

TC003_Login Fail with Username And Password Contain Special Characters - Data Driven
    [Tags]    TC003
    !^%^%^&*(    ${pass_general}    ${expected_error_msg}
    !^%^%^&*(@yopmail.com    &*^&&*^    ${expected_error_msg_invalid_email}

*** Keywords ***
Open Browser And Goes To Login Page
    [Arguments]    ${server_test}
    Open Browser And Click GetStarted Button    ${server_test}
    Click Button Login Header

The Error Message Should Shown
    [Arguments]    ${username}    ${password}    ${error_msg}
    Input Values Login Page    ${username}    ${password}
    Click Button Login Popup
    Verify The Error Message Should Be Displayed    ${error_msg}

# Command: robot tests/Login/Beecow_Login_data_driven.robot
# Command: robot --include TC001 tests/Login/Beecow_Login_data_driven.robot