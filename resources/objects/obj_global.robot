*** Settings ***
Documentation     /* LIST GLOBAL OBJECT */
...               /* Author: Phuoc Ha */

*** Variable ***
# Object Beecow Getstarted popup
${ID.BTN.GETSTARTED}    btn-start-mobi
# Header Menu
${XPATH.BTN.LOGIN}    .//span[@beetranslate='beecow.action.login']
${XPATH.BTN.SIGNUP}    .//span[@beetranslate='beecow.action.signup']

${XPATH.LBL.PROFILE.NAME}    .//span[@class='txt']
${XPATH.LNK.PROFILE.LOGOUT}    .//div[beetranslate='beecow.action.logout']