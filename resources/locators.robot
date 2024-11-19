# Created by alifyusof at 12/11/2024
*** Settings ***

*** Variables ***
# Login Page
${LOGIN_USERNAME}   id: user-name
${LOGIN_PASSWORD}   id: password
${LOGIN_BUTTON}     id: login-button

# Product Page
${ADD_TO_CART_BUTTON}   xpath://button[contains(., 'Add to cart')]
${CART_BADGE}  css:.shopping_cart_badge
${CART_BUTTON}  id: shopping_cart_container

# Cart Page
${CART_ITEMS}   css:.cart_item
${CART_ITEM_NAME}   css:.inventory_item_name
${CHECKOUT_BUTTON}  id: checkout

# Checkout Page
${FIRST_NAME}   id: first_name
${LAST_NAME}    id: last_name
${POSTAL_CODE}  id: postal_code
${CONTINUE_BUTTON}  id: continue
${FINISH_BUTTON}    id: finish
${ORDER_TOTAL}  css:.summary_total_label