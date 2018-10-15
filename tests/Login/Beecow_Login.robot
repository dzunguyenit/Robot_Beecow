*** Settings ***
Documentation     /* Test Suite Login Beecow */
...               /* Author: Phuoc Ha */
Test Teardown     Close All Browsers
Resource          ${CURDIR}${/}lib_login.robot

*** Variables ***
#

*** Test Cases ***
TCA0_Basic flow (B) - (0-sanityCheck)
    [Tags]    Smoke_Testing    Beecow    Login
    Given Log In     ${SERVER_TEST}    ${store_product_useremail}    ${pass_general}
    Then Verify User Logged Successfully    ${store_product_fullname}

# Command: robot tests/Login/Beecow_Login.robot