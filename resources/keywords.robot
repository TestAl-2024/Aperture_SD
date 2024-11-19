# Created by alifyusof at 12/11/2024
*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem

*** Keywords ***
Open Browser To Application
    [Documentation]    Opens the browser and navigate to the application URL.
    Open browser    ${BASE_URL}
    Maximize browser window
    Wait until page contains element    ${LOGIN_BUTTON}

Log In With Credentials
    [Arguments]    ${username}  ${password}
    [Documentation]    Logs into the application with the provided username and password.
    Input text    ${LOGIN_USERNAME}     ${username}
    Input text    ${LOGIN_PASSWORD}     ${password}
    Click button    ${LOGIN_BUTTON}
    Wait until page contains element    ${CART_BUTTON}

Add Products To Cart
    [Arguments]    @{products}
    [Documentation]    Adds specified products to the cart.
    FOR    ${product}   IN  @{products}
        ${product_xpath}=   Set variable    xpath://div[text()='${product}']/ancestor::div[@class='inventory_item']//button
        Click button    ${product_xpath}
    END

Verify Products In Cart
    [Arguments]    @{products}
    [Documentation]    Verifies that all selected products are present in the cart.
    Click element    ${CART_BUTTON}
    Wait until page contains element    ${CART_ITEMS}
    ${cart_items}=  Get WebElements    ${CART_ITEM_NAME}
    FOR    ${item}     IN  ${cart_items}
        ${item_text}=    Get text    ${item}
        Should contain    ${products}   @{item_text}
    END

Checkout And Validate
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    [Documentation]    Proceeds to checkout and validate the total .
    Click element    ${CHECKOUT_BUTTON}
    Input text    ${FIRST_NAME}     ${first_name}
    Input text    ${LAST_NAME}      ${last_name}
    Input text    ${POSTAL_CODE}    ${postal_code}
    Click button    ${CONTINUE_BUTTON}
    Wait until page contains element    ${ORDER_TOTAL}
    ${total}=   Get text    ${ORDER_TOTAL}
    Log    Total:   ${total}
    Click button    ${FINISH_BUTTON}