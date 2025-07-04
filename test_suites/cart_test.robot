*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/variables.robot
Library     BuiltIn
Test Setup    Go To Automation Exercise Home Page

*** Test Cases ***
Verify User Can Add Products To Cart
    [Tags]  UI_tests_Part2
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
    Click Button    ${CONTINUE_SHOPPING}
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    2    ${EMPTY}
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Check Product Details In The Cart    product-1    ${CART_ITEM_TEMPLATE}    Rs. 500    1    Rs. 500
    Check Product Details In The Cart    product-2    ${CART_ITEM_TEMPLATE}    Rs. 400    1    Rs. 400

Verify Product Quantity In Cart
    [Tags]  UI_tests_Part2
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}
    Go To Required Link    ${PRODUCT_LINK_LOCATOR}    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Wait Until Element Is Visible    ${QUANTITY_SELECTION}
    Input Text    ${QUANTITY_SELECTION}    4
    Textfield Value Should Be    ${QUANTITY_SELECTION}    4
    Click Button    ${ADD_CART_BUTTON}
    Check Relevant Text Is Displayed    ${MODAL_ADDED_CART}    Your product has been added to cart.
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Check Product Attributes    product-1    ${CART_ITEM_TEMPLATE}    ${CART_QUANTITY}    4

Verify User Registration During Checkout
    [Tags]  UI_tests_Part2
    [Teardown]  Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}     ${VALID_NAME}
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Click Link    ${PROCEED_CHECKOUT}
    Wait Until Element Is Visible    ${CHECKOUT_REGISTER}
    Go To Required Link    ${CHECKOUT_REGISTER}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION

Verify User Registration Before Checkout
    [Tags]  UI_tests_Part2
    Go To Required Link    ${SIGNUP_LOGIN_LINK}   ${HEADER_LOCATOR_LOGIN}    Login to your account
    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Go To Required Link    ${PROCEED_CHECKOUT}    ${CART_BREADCRUMPS}    Checkout
    Check Address Details During Checkout    ${YOUR_DELIVERY_INFO}
    Scroll Page And Close Advertisement    ${REVIEW_ORDER}
    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
    Input Text    ${CART_COMMENT}    Added to the cart
    Scroll Page And Close Advertisement    ${PLACE_ORDER}
    Go To Required Link    ${PLACE_ORDER}    ${CART_BREADCRUMPS}    Payment
    Fill In Payment Details
    Click Button    ${CONFIRM_PAYMENT}
    Check Relevant Text Is Displayed    ${ORDER_CONFIRMED}    Congratulations! Your order has been confirmed!

Verify User Can Login Before Checkout
    [Tags]  UI_tests_Part2
    [Teardown]    Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}    ${LOGGEDIN_SUCCESS}
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Go To Required Link    ${PROCEED_CHECKOUT}    ${CART_BREADCRUMPS}    Checkout
    Check Address Details During Checkout    ${YOUR_DELIVERY_INFO}
    Scroll Page And Close Advertisement    ${REVIEW_ORDER}
    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
    Input Text    ${CART_COMMENT}    Added to the cart
    Scroll Page And Close Advertisement    ${PLACE_ORDER}
    Go To Required Link    ${PLACE_ORDER}    ${CART_BREADCRUMPS}    Payment
    Fill In Payment Details
    Click Button    ${CONFIRM_PAYMENT}
    Check Relevant Text Is Displayed    ${ORDER_CONFIRMED}    Congratulations! Your order has been confirmed!

Verify User Can Remove Product From Cart
    [Tags]  UI_tests_Part2
    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
    ${remove_from_cart}=   Replace String    ${REMOVE_FROM_CART}    {product_id}    ${ADDED_PRODUCT_ID}
    Click Link    ${remove_from_cart}
    ${status}=  Run Keyword And Return Status    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
    Log    Does keyword fail? ${status}