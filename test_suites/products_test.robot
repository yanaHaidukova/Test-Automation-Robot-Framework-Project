*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/variables.robot
Library     BuiltIn
Test Setup    Go To Automation Exercise Home Page

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
${REVIEW_ORDER}    //*[@class="table table-condensed"]//tbody
${PRODUCT_IN_CART}    //*[@id="{product_id}"]
${CART_COMMENT}    //*[@name="message"]
${PLACE_ORDER}    //a[@href="/payment"]
${CONFIRM_PAYMENT}    //button[@id="submit"]
${ORDER_CONFIRMED}    //*[contains(text(), 'Congratulations! Your order has been confirmed!')]
${REMOVE_FROM_CART}    //tr[@id="{product_id}"]//a[@class="cart_quantity_delete"]
${CATEGORY_ACCORDIONS}    //*[@id="accordian"]
${ACCORDION_WOMEN}    //a[@data-parent="#accordian"][@href="#Women"]
${WOMEN_EXPANDED}    //*[@id="Women"]
${WOMEN_TOPS}    //a[@href="/category_products/2"]
${CATEGORY_PAGE_HEADER}    //*[@class="title text-center"]
${ACCORDION_MEN}    //a[@data-parent="#accordian"][@href="#Men"]
${MEN_EXPANDED}    //*[@id="Men"]
${MEN_TSHIRTS}    //a[@href="/category_products/3"]

*** Test Cases ***
#Verify All Products And Product Details Page
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Scroll Element Into View    ${NEXT_PRODUCT}
#    Wait Until Element Is Visible   ${NEXT_PRODUCT}
#    Go To Required Link    ${PRODUCT_LINK_LOCATOR}    ${PRODUCT_NAME_LOCATOR}    Blue Top
#    Wait Until Page Contains Element   ${PRODUCT_NAME_LOCATOR}
#    Wait Until Page Contains Element    ${CATEGORY_LOCATOR}
#    Wait Until Page Contains Element    ${PRICE_LOCATOR}
#    Wait Until Page Contains Element    ${AVAILABILITY_LOCATOR}
#    Wait Until Page Contains Element    ${CONDITION_LOCATOR}
#    Wait Until Page Contains Element    ${BRAND_LOCATOR}
#
#Verify User Can Search For Product
#    [Tags]  UI_tests_Part1
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Search For Product    ${SEARCH_LOCATOR}    ${PRODUCT_NAME}    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
#    Scroll Element Into View    ${SEARCH_LOCATOR}
#    Check Search Results   ${PRODUCT_FROM_LIST}    ${PRODUCT_NAME}
##
#Verify User Can Add Products To Cart
#    [Tags]  UI_tests_Part2
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
#    Click Button    ${CONTINUE_SHOPPING}
#    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    2    ${EMPTY}
#    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
#    Check Product Details In The Cart    product-1    ${CART_ITEM_TEMPLATE}    Rs. 500    1    Rs. 500
#    Check Product Details In The Cart    product-2    ${CART_ITEM_TEMPLATE}    Rs. 400    1    Rs. 400
#
#Verify Product Quantity In Cart
#    [Tags]  UI_tests_Part2
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Scroll Element Into View    ${NEXT_PRODUCT}
#    Wait Until Element Is Visible   ${NEXT_PRODUCT}
#    Go To Required Link    ${PRODUCT_LINK_LOCATOR}    ${PRODUCT_NAME_LOCATOR}    Blue Top
#    Wait Until Element Is Visible    ${QUANTITY_SELECTION}
#    Input Text    ${QUANTITY_SELECTION}    4
#    Textfield Value Should Be    ${QUANTITY_SELECTION}    4
#    Click Button    ${ADD_CART_BUTTON}
#    Check Relevant Text Is Displayed    ${MODAL_ADDED_CART}    Your product has been added to cart.
#    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
#    Check Product Attributes    product-1    ${CART_ITEM_TEMPLATE}    ${CART_QUANTITY}    4
#
#Verify User Registration During Checkout
#    [Tags]  UI_tests_Part2
#    [Teardown]  Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}     ${VALID_NAME}
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
#    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
#    Click Link    ${PROCEED_CHECKOUT}
#    Wait Until Element Is Visible    ${CHECKOUT_REGISTER}
#    Go To Required Link    ${CHECKOUT_REGISTER}    ${HEADER_LOCATOR_LOGIN}    Login to your account
#    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
#
#Verify User Registration Before Checkout
#    [Tags]  UI_tests_Part2
#    Go To Required Link    ${SIGNUP_LOGIN_LINK}   ${HEADER_LOCATOR_LOGIN}    Login to your account
#    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
#    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
#    Go To Required Link    ${PROCEED_CHECKOUT}    ${CART_BREADCRUMPS}    Checkout
#    Check Address Details During Checkout    ${YOUR_DELIVERY_INFO}
#    Scroll Page And Close Advertisement    ${REVIEW_ORDER}
#    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
#    Input Text    ${CART_COMMENT}    Added to the cart
#    Scroll Page And Close Advertisement    ${PLACE_ORDER}
#    Go To Required Link    ${PLACE_ORDER}    ${CART_BREADCRUMPS}    Payment
#    Fill In Payment Details
#    Click Button    ${CONFIRM_PAYMENT}
#    Check Relevant Text Is Displayed    ${ORDER_CONFIRMED}    Congratulations! Your order has been confirmed!
#
#Verify User Can Login Before Checkout
#    [Tags]  UI_tests_Part2
#    [Teardown]    Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}
#    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
#    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}    ${LOGGEDIN_SUCCESS}
#    Go To Required Link    ${PRODUCTS_LINK}    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
#    Check User Can Add Product To Cart    ${VIEW_PRODUCT}    1    ${EMPTY}
#    Go To Required Link    ${VIEW_CART}    ${CART_BREADCRUMPS}    Shopping Cart
#    Go To Required Link    ${PROCEED_CHECKOUT}    ${CART_BREADCRUMPS}    Checkout
#    Check Address Details During Checkout    ${YOUR_DELIVERY_INFO}
#    Scroll Page And Close Advertisement    ${REVIEW_ORDER}
#    Check Product Is Displayed In The Cart    ${PRODUCT_IN_CART}    ${ADDED_PRODUCT_ID}
#    Input Text    ${CART_COMMENT}    Added to the cart
#    Scroll Page And Close Advertisement    ${PLACE_ORDER}
#    Go To Required Link    ${PLACE_ORDER}    ${CART_BREADCRUMPS}    Payment
#    Fill In Payment Details
#    Click Button    ${CONFIRM_PAYMENT}
#    Check Relevant Text Is Displayed    ${ORDER_CONFIRMED}    Congratulations! Your order has been confirmed!
#
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

Verify User Can View Category Products
    [Tags]  UI_tests_Part2
    Element Should Be Visible    ${CATEGORY_ACCORDIONS}
    Click Link    ${ACCORDION_WOMEN}
    Wait Until Element Is Visible    ${WOMEN_EXPANDED}
    Click Link    ${WOMEN_TOPS}
    Check Relevant Text Is Displayed    ${CATEGORY_PAGE_HEADER}    WOMEN - TOPS PRODUCTS
    Scroll Element Into View    ${ACCORDION_MEN}
    Click Link    ${ACCORDION_MEN}
    Wait Until Element Is Visible    ${MEN_EXPANDED}
    Click Link    ${MEN_TSHIRTS}
    Check Relevant Text Is Displayed   ${CATEGORY_PAGE_HEADER}    MEN - TSHIRTS PRODUCTS


