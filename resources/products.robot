*** Settings ***
Library      SeleniumLibrary
Library    String
Resource    ../resources/common_resources.robot

*** Variables ***
${SEARCH_BUTTON}    //*[@id="submit_search"]
${PRODUCTS_LIST_LOCATOR}    //*[@class='features_items']
${CART_PRICE}    //tr[@id="{product_id}"]//td[@class ="cart_price"]
${CART_QUANTITY}    //tr[@id="{product_id}"]//td[@class="cart_quantity"]
${CART_TOTAL}    //tr[@id="{product_id}"]//td[@class="cart_total"]
${ADDRESS_FIRST_LAST_NAME}    //li[contains(@class,'address_firstname') and contains(@class,'address_lastname')]
${ADDRESS_COMPANY}    //li[contains(@class,'address_address1') and contains(@class,'address_address2')]
${ADDRESS1}    //*[@class="address item box"]//li[4]
${ADDRESS2}    //*[@class="address item box"]//li[5]
${ADDRESS_CITY_STATE_ZIP}    //li[contains(@class,'address_city') and contains(@class,'address_state_name') and contains(@class,'address_postcode')]
${ADDRESS_COUNTRY}    //li[contains(@class,'address_country_name')]
${ADDRESS_PHONE}    //li[contains(@class,'address_phone')]
${EXPECTED_NAME}    Mr. Monika Patison
${EXPECTED_COMPANY}    SoftServe
${EXPECTED_ADDRESS1}    Test address 1
${EXPECTED_ADDRESS2}    Test address 2
${EXPECTED_CITY_STATE_ZIP}    Toronto Ontario 123456
${EXPECTED_COUNTRY}    Canada
${EXPECTED_PHONE}    +12505550199
${YOUR_DELIVERY_INFO}    //*[@id="address_delivery"]
${CARD_NAME}    //*[@name="name_on_card"]
${CARD_NUMBER}    //*[@name="card_number"]
${CVC}    //*[@name="cvc"]
${EXPIRATION_MONTH}    //*[@name="expiry_month"]
${EXPIRATION_YEAR}    //*[@name="expiry_year"]

*** Keywords ***
Check Search Results
    [Arguments]  ${product_locator}  ${search_term}
    ${products}=  Get WebElements  ${product_locator}
    FOR  ${product}  IN  @{products}
        ${product_text}=  Get Text  ${product}
        Log  Checking product: ${product_text}
        Run Keyword And Continue On Failure  Should Contain  ${product_text}  ${search_term}
    END

Check Product Details In The Cart
    [Arguments]    ${product_id}    ${cart_item_template}    ${expected_price}    ${expected_quantity}    ${expected_total}
    ${cart_item_id}=  Replace String    ${cart_item_template}    {product_id}    ${product_id}
    Wait Until Element Is Visible    ${cart_item_id}
    Check Product Attributes    ${product_id}    ${cart_item_template}    ${CART_PRICE}    ${expected_price}
    Check Product Attributes    ${product_id}     ${cart_item_template}    ${CART_QUANTITY}    ${expected_quantity}
    Check Product Attributes    ${product_id}    ${cart_item_template}    ${CART_TOTAL}    ${expected_total}

Check Product Attributes
    [Arguments]    ${product_id}    ${cart_item_template}    ${attribute}     ${expected_value}
    ${attribute_value}=  Replace String    ${attribute}    {product_id}    ${product_id}
    Check Relevant Text Is Displayed    ${attribute_value}    ${expected_value}

Check Product Is Displayed In The Cart
    [Arguments]    ${product_locator}    ${product_id}
    ${added_product}=     Replace String    ${product_locator}    {product_id}    ${product_id}
    Element Should Be Visible    ${added_product}

Check Address Details During Checkout
    [Arguments]    ${address_containter}
    Wait Until Element Is Visible    ${address_containter}
    Check Relevant Text Is Displayed    ${address_containter}${ADDRESS_FIRST_LAST_NAME}    ${EXPECTED_NAME}
    Check Relevant Text Is Displayed    ${address_containter}${ADDRESS_COMPANY}    ${EXPECTED_COMPANY}
    Check Relevant Text Is Displayed    ${address_containter}${ADDRESS_CITY_STATE_ZIP}    ${EXPECTED_CITY_STATE_ZIP}
    Check Relevant Text Is Displayed    ${address_containter}${ADDRESS_COUNTRY}    ${EXPECTED_COUNTRY}
    Check Relevant Text Is Displayed    ${address_containter}${ADDRESS_PHONE}    ${EXPECTED_PHONE}

Fill In Payment Details
    Input And Verify Text Field    ${CARD_NAME}    ${VALID_NAME}
    Input And Verify Text Field    ${CARD_NUMBER}    0000111122223333
    Input And Verify Text Field    ${CVC}    123
    Input And Verify Text Field    ${EXPIRATION_MONTH}    08
    Input And Verify Text Field    ${EXPIRATION_YEAR}    2028