*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/variables.robot
Library     BuiltIn
Test Setup       Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
Suite Teardown   Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}     ${VALID_NAME}

*** Variables ***
${PRODUCTS_LINK}    //*[@id="header"]//a[@href="/products"]
${PRODUCT_LINK_LOCATOR}    //a[@href="/product_details/1"]
${VIEW_PRODUCT}    //a[@href="/product_details/{product_id}"]
${SEARCH_LOCATOR}    //*[@id="search_product"]
${PRODUCT_NAME_LOCATOR}    //*[@class="product-information"]//h2
${CATEGORY_LOCATOR}    //*[@class="product-information"]//P
${PRICE_LOCATOR}    //*[@class="product-information"]//span/span
${AVAILABILITY_LOCATOR}    //*[@class="product-information"]//p[2]
${CONDITION_LOCATOR}    //*[@class="product-information"]//p[3]
${BRAND_LOCATOR}    //*[@class="product-information"]//p[4]
${QUANTITY_SELECTION}    //input[@id="quantity"]
${HEADER_SEARCHED_PRODUCTS_LOCATOR}    //*[@class="features_items"]/h2
${HEADER_LOCATOR_PRODUCTS}    //h2[@class="title text-center"]
${NEXT_PRODUCT}    //*[@href="/product_details/4"]
${PRODUCT_NAME}     Dress
${PRODUCT_FROM_LIST}    //*[@class="single-products"]
${CART_ITEM_TEMPLATE}    //tr[@id="{product_id}"]
${ADD_CART_BUTTON}    //button[@class="btn btn-default cart"]
${CHECKOUT_REGISTER}     //*[@class="modal-body"]//a[@href="/login"]
${ADDRESS_DETAILS}    //*[@class="checkout-information"]

*** Test Cases ***
Verify All Products And Product Details Page
    [Setup]  Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Check Relevant Text Is Displayed    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Wait Until Page Contains Element   ${PRODUCT_NAME_LOCATOR}
    Wait Until Page Contains Element    ${CATEGORY_LOCATOR}
    Wait Until Page Contains Element    ${PRICE_LOCATOR}
    Wait Until Page Contains Element    ${AVAILABILITY_LOCATOR}
    Wait Until Page Contains Element    ${CONDITION_LOCATOR}
    Wait Until Page Contains Element    ${BRAND_LOCATOR}

Verify User Can Search For Product
    [Tags]  UI_tests_Part1
    [Setup]  Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Search For Product    ${SEARCH_LOCATOR}    ${PRODUCT_NAME}    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Scroll Element Into View    ${SEARCH_LOCATOR}
    Check Search Results   ${PRODUCT_FROM_LIST}    ${PRODUCT_NAME}

Verify User Can Add Products To Cart
    [Tags]  UI_tests_Part2
    [Setup]  Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1
    Click Button    ${CONTINUE_SHOPPING}
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    2
    Click Link    ${VIEW_CART}
    Check Relevant Text Is Displayed    ${CART_BREADCRUMPS}    Shopping Cart
    Check Product Details In The Cart    product-1    ${CART_ITEM_TEMPLATE}    Rs. 500    1    Rs. 500
    Check Product Details In The Cart    product-2    ${CART_ITEM_TEMPLATE}    Rs. 400    1    Rs. 400

Verify Product Quantity In Cart
    [Tags]  UI_tests_Part2
    [Setup]  Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Check Relevant Text Is Displayed    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Wait Until Element Is Visible    ${QUANTITY_SELECTION}
    Input Text    ${QUANTITY_SELECTION}    4
    Textfield Value Should Be    ${QUANTITY_SELECTION}    4
    Click Button    ${ADD_CART_BUTTON}
    Check Relevant Text Is Displayed    ${MODAL_ADDED_CART}    Your product has been added to cart.
    Click Link    ${VIEW_CART}
    Check Relevant Text Is Displayed    ${CART_BREADCRUMPS}    Shopping Cart
    Check Product Attributes    product-1    ${CART_ITEM_TEMPLATE}    ${CART_QUANTITY}    4

Verify User Registration During Checkout
    [Tags]  UI_tests_Part2
    [Setup]  Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    [Teardown]  Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}     ${VALID_NAME}
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1
    Click Link    ${VIEW_CART}
    Check Relevant Text Is Displayed    ${CART_BREADCRUMPS}    Shopping Cart
    Click Link    ${PROCEED_CHECKOUT}
    Wait Until Element Is Visible    ${CHECKOUT_REGISTER}
    Click Link    ${CHECKOUT_REGISTER}
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION

Verify User Registration Before Checkout
    [Tags]  UI_tests_Part2
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
    Click Link    ${PRODUCTS_LINK}
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1
    Click Link    ${VIEW_CART}
    Check Relevant Text Is Displayed    ${CART_BREADCRUMPS}    Shopping Cart
    Click Link    ${PROCEED_CHECKOUT}
    Check Relevant Text Is Displayed    ${CART_BREADCRUMPS}    Checkout
    Wait Until Element Is Visible    ${ADDRESS_DETAILS}
    Verify Delivery Address Elements Exist
    Verify Delivery Address Content Item By Item


