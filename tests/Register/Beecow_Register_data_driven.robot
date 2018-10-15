*** Settings ***
Documentation     /* Test Suite Register Beecow with data driven */
...               /* Author: Phuoc Ha */
Force Tags        DataDriven
Test Setup        Open Browser And Goes To Register Page    ${SERVER_TEST}
Test Template     The Error Message Should Shown
Test Teardown     Close All Browsers
Resource          ${CURDIR}${/}lib_register.robot

*** Variables ***
${expected_error_msg}    Please enter email / phone number and password
${expected_error_msg_invalid_email}    Invalid email
${expected_error_msg_existed_email}    Email already exists
${expected_error_msg_invalid_password}    Minimum 6 characters
${expected_error_msg_empty_fullname}    Please enter your name
${expected_error_msg_invalid_characters}    Your name excludes special characters

*** Test Cases ***
TC001_Register Fail With EMAIL validation - Data Driven
    [Tags]    TC001    RUN
    ${empty}    ${empty}    ${empty}    ${expected_error_msg}    # All Fields are Empty
    ${empty}    ${pass_general}    ${empty}    ${expected_error_msg}    # The Username is Empty
    ${empty}    ${empty}    Full Name Valid    ${expected_error_msg}    # The Username is Empty
    ${store_product_useremail}    ${pass_general}    Full Name Valid    ${expected_error_msg_existed_email}    # The Username is Existed
    prodstoreauto@yopmail    ${pass_general}    Full Name Valid    ${expected_error_msg_invalid_email}    # The Username is Wrong
    <script>alert('Injected!');</script>    ${pass_general}    Full Name Valid    ${expected_error_msg_invalid_email}    # The Username is javascript injection
    SELECT * FROM User where userId ='${store_product_useremail}' or '1'='1'    ${pass_general}    Full Name Valid    ${expected_error_msg_invalid_email}    # The Username is SQL injection

TC002_Register Fail With PASSWORD validation - Data Driven
    [Tags]    TC002    RUN
    validusertest@yopmail.com    ${empty}    Full Name Valid    ${expected_error_msg}    # The Password is Empty
    validusertest@yopmail.com    12345    Full Name Valid    ${expected_error_msg_invalid_password}    # The Password is Wrong
#    validuser@yopmail.com    <script>alert('Injected!');</script>    Full Name Valid    ${expected_error_msg_invalid_characters}    # The Password is javascript injection
#    validuser1@yopmail.com    SELECT * FROM User where userId ='${store_product_useremail}' or '1'='1'    Full Name Valid    ${expected_error_msg_invalid_characters}    # The Password is SQL injection

TC003_Register Fail With FULLNAME validation - Data Driven
    [Tags]    TC003
    ${store_product_useremail}    ${pass_general}    ${empty}    ${expected_error_msg_empty_fullname}    # The Your name is Wrong
    ${store_product_useremail}    ${pass_general}    <script>alert('Injected!');</script>    ${expected_error_msg_invalid_characters}    # The Your name is javascript injection
    ${store_product_useremail}    ${pass_general}    SELECT * FROM User where userId ='${store_product_useremail}' or '1'='1'    ${expected_error_msg_invalid_characters}    # The Your name is SQL injection

TC004_Register Fail with fields Contain Special Characters - Data Driven
    [Tags]    TC004
    !^%^%^&*(    ${pass_general}    Full Name Valid    ${expected_error_msg_invalid_email}
#    ${store_product_useremail}    !^%^%^&*(    Full Name Valid    ${expected_error_msg_invalid_email}
    ${store_product_useremail}    ${pass_general}    !^%^%^&*(    ${expected_error_msg_invalid_characters}

*** Keywords ***
Open Browser And Goes To Register Page
    [Arguments]    ${server_test}
    Open Browser And Click GetStarted Button    ${server_test}
    Click Button Signup Header

The Error Message Should Shown
    [Arguments]    ${username}    ${password}    ${fullname}    ${error_msg}
    Input Values Register Popup Page    ${username}    ${password}    ${fullname}
    Click Button Continue Popup
    Verify The Error Message Should Be Displayed    ${error_msg}

# Command: robot tests/Register/Beecow_Register_data_driven.robot
# Command: robot --include TC002 tests/Register/Beecow_Register_data_driven.robot