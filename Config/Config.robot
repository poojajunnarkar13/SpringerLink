*** Settings ***
Resource          ../Resources/Home Page.robot
Resource          ../Resources/Search_Help_Page.robot
Resource          ../Resources/Search_Page.robot
Library           SeleniumLibrary

*** Variables ***
${TIMEOUT}        10s
${BROWSER}        chrome
${HOSTNAME}       https://rd.springer.com/

*** Test Cases ***
