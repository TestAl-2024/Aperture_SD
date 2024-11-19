# Created by alifyusof at 12/11/2024
*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Library    Collections
Library    SeleniumLibrary
Library    OperatingSystem
Library    DataDriver   file=../data/test_data.csv  dialect=excel   encoding=utf-8

Test Template   Run Test Scenario

*** Keywords ***
Run Test Scenario
    [Arguments]    ${scenario}      ${username}     ${password}     @{products}
    Open Browser To Application
    Log In With Credentials    ${username}  ${password}
    Run keyword if    "${scenario}" == "Positive"   Add Products To Cart        @{products}
    Run keyword if    "${scenario}" == "Positive"   Verify Products In Cart     @{products}
    Run keyword if    "${scenario}" == "Positive"   Checkout And Validate    John   Doe 12345
    Run keyword if    "${scenario}" == "Negative"   Capture page screenshot
    Close browser

*** Test Cases ***
Positive Login and Add To Cart
    [Template]    Run Test Scenario
    Positive Login  ${USERNAME} ${PASSWORD} @{PRODUCTS}

Invalid Login Test
    [Template]    Run Test Scenario
    Invalid Login   locked_out_user wrong_pass  @{PRODUCTS}