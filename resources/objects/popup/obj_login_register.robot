*** Settings ***
Documentation     /* LIST OBJECT FOR LOGIN PAGE */
...               /* Author: Phuoc Ha */

*** Variable ***
# Object Beecow Login page
${ID.TXT.POP.USERNAME}    usr
${XPATH.TXT.POP.PASSWORD}    .//fieldset//input[@id='pwd']
${XPATH.BTN.POP.LOGIN}    .//button[@beetranslate='beecow.login.login']
${XPATH.LBL.ERROR.MESSAGE}    .//fieldset/div[last()]/span/span
# Register
${ID.TXT.POP.YOUR.NAME}    displayName
${XPATH.BTN.CONTINUE}    .//button[@beetranslate='beecow.signup.continue']
${ID.TXT.CODE}    code
${XPATH.BTN.ACTIVE.CODE}    .//button[@beetranslate='beecow.activate.button']
