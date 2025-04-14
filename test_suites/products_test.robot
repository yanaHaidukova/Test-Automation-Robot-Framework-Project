*** Settings ***
Resource    ../resources/common_resources.robot
Library     BuiltIn
Test Setup    Go To Automation Exercise Home Page
Test Teardown   Close All Browsers

*** Variables ***
${PRODUCTS_LINK}    //*[@id="header"]//a[@href="/products"]
${PRODUCT_LINK_LOCATOR}    //a[@href="/product_details/1"]
${AD_CLOSE_BUTTON}    /html/body/ins[2]/*[1]//ins/span/svg/path
${SEARCH_LOCATOR}    //*[@id="search_product"]
${PRODUCT_NAME_LOCATOR}    //*[@class="product-information"]//h2
${CATEGORY_LOCATOR}    //*[@class="product-information"]//P
${PRICE_LOCATOR}    //*[@class="product-information"]//span/span
${AVAILABILITY_LOCATOR}    //*[@class="product-information"]//p[2]
${CONDITION_LOCATOR}    //*[@class="product-information"]//p[3]
${BRAND_LOCATOR}    //*[@class="product-information"]//p[4]
${HEADER_SEARCHED_PRODUCTS_LOCATOR}    //*[@class="features_items"]/h2
${HEADER_LOCATOR_PRODUCTS}    //h2[@class="title text-center"]
${NEXT_PRODUCT}    //*[@href="/product_details/4"]
${PRODUCT_NAME}     Dress
${PRODUCT_FROM_LIST}    //*[@class="single-products"]

*** Test Cases ***
Verify All Products And Product Details Page
    [Tags]  UI_tests_Part1
    Click Link    ${PRODUCTS_LINK}
    Check User Is Redirected To The Selected Page    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Check User Is Redirected To The Selected Page    ${PRODUCT_NAME_LOCATOR}    Blue top
    Check Product Details    ${PRODUCT_NAME_LOCATOR}
    Check Product Details    ${CATEGORY_LOCATOR}
    Check Product Details    ${PRICE_LOCATOR}
    Check Product Details    ${AVAILABILITY_LOCATOR}
    Check Product Details    ${CONDITION_LOCATOR}
    Check Product Details    ${BRAND_LOCATOR}

Verify User Can Search For Product
    [Tags]  UI_tests_Part1
    Click Link    ${PRODUCTS_LINK}
    Check User Is Redirected To The Selected Page    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Search For Product    ${SEARCH_LOCATOR}    ${PRODUCT_NAME}    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Scroll Element Into View    ${SEARCH_LOCATOR}
    Check Search Results   ${PRODUCT_FROM_LIST}    ${PRODUCT_NAME}

