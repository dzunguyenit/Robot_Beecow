*** Settings ***
Documentation     /* GLOBAL DATA FOR PROJECT */
...               /* Author: Phuoc Ha */

*** Variables ***
# TIME
${TIMESLEEP}      3s
${TIMEWAIT}       7s
${TIMEOUT}        20s
${TIMEMAX}        60s
${TIMEMIN}        1s
${DELAY}          .25
# Common Variables
${gl_true}        True
${gl_false}       False
${gl_check}       Check
${gl_uncheck}     Uncheck
# COMMON VARIABLES
${default_rate_usd_eur}    0.8942    #0.8702
${default_rate_eur_usd}    1.11832    #1.14916
${tax_code_type}    GST_SG
${tax_code_name}    AT-TAX-AU
${tax_code_percent}    10
${tax_code_description}    Automation tax GST_SG:AT-TAX-AU
