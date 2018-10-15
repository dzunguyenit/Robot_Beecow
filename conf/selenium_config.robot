*** Settings ***
Documentation     /* FILE CONFIG */
...               /* Author: Phuoc Ha */
Library           Selenium2Library

*** Variable ***
# Selenium Library connection settings
${METHOD_TEST}    Webdriver    # Webdriver (no need start selenium sever standalone) / Grid (need start selenium sever standalone on test machine)
${SERVER_TEST}     https://beecow.mediastep.ca
${SERVER_SELENIUM}     http://localhost    # If ${METHOD_TEST}==Grid, change ${SERVER_URL} values with IP of test machine; Ex: http://192.168.33.10
#${BROWSER}       phantomjs    # Browser test on linux
${BROWSER}        gc    # ff/ie/gc/phantomjs
# GENERAL:
${sever_test}     https://beecow.mediastep.ca    #https://beecow.mediastep.com    #https://beecow.info
# MY MACHINE:
${store_product_fullname}    User Prod Store
${store_product_useremail}     prodstoreauto@yopmail.com
${store_deal_user}     prodweb@yopmail.com
${pass_general}    123456    # Pass general for all users