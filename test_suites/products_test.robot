*** Settings ***
Resource    ../resources/common_resources.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/products_test.robot

*** Variables ***
${PRODUCT_LINK_LOCATOR}    //a[@href="/product_details/1"]
${PRODUCT_DETAILS_NAME_LOCATOR}    //*[@class="product-information"]//h2
${PRODUCT_DETAILS_CATEGORY_LOCATOR}    //*[@class="product-information"]//P
${PRODUCT_DETAILS_CATEGORY_LOCATOR}    //*[@class="product-information"]//p[3]
${AD_CLOSE_BUTTON}    /html/body/ins[2]/*[1]//ins/span/svg/path
${SEARCH_LOCATOR}    //*[@id="search_product"]


*** Test Cases ***
Verify All Products and product detail page
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify all relevant product details are shown
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Products Page
    Verify Product Card Visible
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Wait Until Element Is Visible    ${PRODUCT_DETAILS_NAME_LOCATOR}
    Verify Relevant Product Details Are Shown

Search Product
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify user can search for product
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Products Page
    Search For Product    ${SEARCH_LOCATOR}    Polo
    Verify Searched Results Are Shown On The Page
