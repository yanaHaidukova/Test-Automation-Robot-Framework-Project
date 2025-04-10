*** Settings ***
Resource    ../resources/common_resources.robot
Test Setup    Go To Automation Exercise Home Page
Test Teardown   Close All Browsers

#robot -d results test_suites/products_test.robot

*** Variables ***
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
${SEARCH_PRODUCT}     //*[contains (text(), 'Polo')]

*** Test Cases ***
Verify All Products and product detail page
    [Tags]  UI_tests_Part1
    Check User Can Navigate To Products Page
    Check Product Card Visible
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Check User Is Redirected To Product Details Page    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Check Product Name Is Displayed    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Check Product Category Is Displayed    ${CATEGORY_LOCATOR}
    Check Product Price Is Displayed    ${PRICE_LOCATOR}
    Check Product Availability Is Displayed    ${AVAILABILITY_LOCATOR}
    Check Product Condition Is Displayed    ${CONDITION_LOCATOR}
    Check Product Brand Is Displayed      ${BRAND_LOCATOR}

Search Product
    [Tags]  UI_tests_Part1
    Check User Can Navigate To Products Page
    Search For Product    ${SEARCH_LOCATOR}    Polo    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Scroll Element Into View    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Check Search Results Are Correct    ${SEARCH_PRODUCT}    Polo
