*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/PO/login.robot
Resource    ../resources/PO/search.robot
Resource    ../resources/PO/top_nav.robot
Resource    ../resources/PO/home.robot
Resource    ../resources/PO/contact_us.robot
Resource    ../resources/PO/products.robot
Resource    ../resources/PO/test_cases.robot
Resource    ../resources/common_keywords.robot




*** Variables ***
${HEADER_LOCATOR_CONTACT_US} =   xpath=//div[@class="contact-form"]//h2
${EXPECTED_HEADER_TEXT_CONTACT_US} =  GET IN TOUCH
${ACCOUNT_CREATED_ID} =  xpath=//*[@id="form"]//h2 [@data-qa="account-created"]
${HEADER_LOCATOR_DELETED} =  xpath=//*[@class="title text-center"]
${HEADER_LOCATOR_PRODUCTS} =  xpath=//h2[@class="title text-center"]
${EXPECTED_HEADER_TEXT_PRODUCTS} =  ALL PRODUCTS
${EXPECTED_HEADER_TEXT_DELETED} =  ACCOUNT DELETED!
${EXPECTER_HEADER_ACCOUNT_CREATED} =  ACCOUNT CREATED!
${EMAIL_CONTACT_ID} =  xpath=//input[@name="email"]
${LOGGED_IN_USER_NAME} =  alex
${VALIDATION_MESSAGE_EXISTING_USER_ID} =  //*[@id="form"]//p
${VALIDATION_MESSAGE_EXISTING_USER_TEXT} =  Email Address already exist!
${LOGGED_IN_USER_EMAIL} =  alexxx@gmail.com
${UPLOAD_FILE_LOCATOR} =  xpath=//input[@name="upload_file"]
${FILE_PATH} =  C:/Users/yhaid/Downloads/understanding-abstract-art.jpg
${VALIDATION_MESSAGE_INVALID_CREDENTIALS_ID} =  //*[@id="form"]//p
${VALIDATION_MESSAGE_INVALID_CREDENTIALS_TEXT} =  Your email or password is incorrect!
${PRODUCT_DETAILS_NAME_LOCATOR} =  xpath=//div[@class="product-information"]//h2
${PRODUCT_DETAILS_CATEGORY_LOCATOR} =  xpath=//div[@class="product-information"]//P
${PRODUCT_DETAILS_PRICE_LOCATOR} =  xpath=//div[@class="product-information"]//span/span
${PRODUCT_DETAILS_AVAILABILITY_LOCATOR} =  xpath=//div[@class="product-information"]//p[2]
${PRODUCT_DETAILS_AVAILABILITY_TEXT} =  Availability:
${PRODUCT_DETAILS_CONDITION_LOCATOR} =  xpath=//div[@class="product-information"]//p[3]
${PRODUCT_DETAILS_CONDITION_TEXT} =  Condition:
${PRODUCT_DETAILS_BRAND_LOCATOR} =  xpath=//div[@class="product-information"]//p[4]
${PRODUCT_DETAILS_BRAND_TEXT} =  Brand:
${HEADER_SEARCHED_PRODUCTS_LOCATOR} =  xpath=//div[@class="features_items"]/h2
${HEADER_SEARCHED_PRODUCTS_TEXT} =  SEARCHED PRODUCTS



*** Keywords ***
Verify user cannot create an account
    "Email Address already exist!" validation message is shown      ${VALIDATION_MESSAGE_EXISTING_USER_ID}      ${VALIDATION_MESSAGE_EXISTING_USER_TEXT}

Verify that account is successfully created
    Verify that "Account Created!" section is visible      ${ACCOUNT_CREATED_ID}    ${EXPECTER_HEADER_ACCOUNT_CREATED}

Upload a file
    Choose and upload a file      ${FILE_PATH}

Verify account is successfully deleted
    Verify "Account deleted" header is shown    ${HEADER_LOCATOR_DELETED}   ${EXPECTED_HEADER_TEXT_DELETED}

Verify user cannot login
    "Your email or password is incorrect!" validation message is shown      ${VALIDATION_MESSAGE_INVALID_CREDENTIALS_ID}    ${VALIDATION_MESSAGE_INVALID_CREDENTIALS_TEXT}

Verify user is navigated to ALL PRODUCTS page successfully
    Verify that "All products" header is shown   ${HEADER_LOCATOR_PRODUCTS}      ${EXPECTED_HEADER_TEXT_PRODUCTS}

Verify that relevant product details are shown
    Verify that product name is displayed    ${PRODUCT_DETAILS_NAME_LOCATOR}
    Verify that product category is displayed   ${PRODUCT_DETAILS_CATEGORY_LOCATOR}
    Verify that product price is displayed  ${PRODUCT_DETAILS_PRICE_LOCATOR}
    Verify that product availability is displayed   ${PRODUCT_DETAILS_AVAILABILITY_LOCATOR}
    Verify that product condition is displayed  ${PRODUCT_DETAILS_CONDITION_LOCATOR}
    Verify that product brand is displayed      ${PRODUCT_DETAILS_BRAND_LOCATOR}

Verify 'SEARCHED PRODUCTS' section is visible
    Scroll Element Into View    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Verify 'SEARCHED PRODUCTS' header is shown  ${HEADER_SEARCHED_PRODUCTS_LOCATOR}  ${HEADER_SEARCHED_PRODUCTS_TEXT}
