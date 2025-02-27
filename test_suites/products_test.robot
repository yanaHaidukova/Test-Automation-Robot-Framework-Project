*** Settings ***
Resource    ../resources/created_keywrods.robot
Resource    ../resources/common_keywords.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/products_test.robot

*** Variables ***
${PRODUCTS_LIST_LOCATOR} =  xpath=//div[@class="col-sm-4"]
${PRODUCT_LINK_LOCATOR} =  xpath=//a[@href="/product_details/1"]
${NEXT_PRODUCT} =  xpath=//a[@href="/product_details/4"]
${PRODUCT_DETAILS_NAME_LOCATOR} =  xpath=//div[@class="product-information"]//h2
${PRODUCT_DETAILS_CATEGORY_LOCATOR} =  xpath=//div[@class="product-information"]//P
${PRODUCT_DETAILS_CATEGORY_LOCATOR} =  xpath=//div[@class="product-information"]//p[3]
${AD_CLOSE_BUTTON} =  xpath=/html/body/ins[2]/div[1]//ins/span/svg/path
${SEARCH_LOCATOR} =  id=search_product
${PRODUCT_NAME} =  Polo
${TEST_PRODUCT} =  xpath=//div[@class="productinfo text-center"]//p

*** Test Cases ***
Test Case 8: Verify All Products and product detail page
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Products" link in the navigation menu
    Verify user is navigated to ALL PRODUCTS page successfully
    Verify list of products is displayed on the page    ${PRODUCTS_LIST_LOCATOR}
    Verify product card visible         ${NEXT_PRODUCT}
    Click "View product" button on the product card     ${PRODUCT_LINK_LOCATOR}
    Verify that product details are shown       ${PRODUCT_DETAILS_NAME_LOCATOR}
    Verify that relevant product details are shown

Test Case 9: Search Product
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Products" link in the navigation menu
    Verify user is navigated to ALL PRODUCTS page successfully
    Enter product name in search field      ${SEARCH_LOCATOR}    ${PRODUCT_NAME}
    CLick "Search" button
    Verify 'SEARCHED PRODUCTS' section is visible
    Verify that search results are correct   ${TEST_PRODUCT}