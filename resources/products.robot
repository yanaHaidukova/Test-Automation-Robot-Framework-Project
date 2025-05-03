*** Settings ***
Library      SeleniumLibrary
Library    String

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
${EXPECTED_NAME}    Mr. Lora Patison
${EXPECTED_COMPANY}    SoftServe
${EXPECTED_ADDRESS1}    Test address 1
${EXPECTED_ADDRESS2}    Test address 2
${EXPECTED_CITY_STATE_ZIP}    Toronto Ontario 123456
${EXPECTED_COUNTRY}    Canada
${EXPECTED_PHONE}    +12505550199
${YOUR_DELIVERY_INFO}    //*[@id="address_delivery"]

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
    ${attribute_value}=  Get Text    ${attribute_value}
    Should Be Equal As Strings    ${attribute_value}    ${expected_value}

Get All Address List Items
    [Arguments]    ${address_container}
    ${address_items}=    Get WebElements    ${address_container}//li
    [Return]    ${address_items}

Verify Address Section Contains All Expected Elements
    [Arguments]    ${address_container}
    Element Should Be Visible    ${address_container}${ADDRESS_FIRST_LAST_NAME}
    Element Should Be Visible    ${address_container}${ADDRESS_COMPANY}
    Element Should Be Visible    ${address_container}${ADDRESS_CITY_STATE_ZIP}
    Element Should Be Visible    ${address_container}${ADDRESS_COUNTRY}
    Element Should Be Visible    ${address_container}${ADDRESS_PHONE}

Verify Delivery Address Elements Exist
    Wait Until Element Is Visible    ${YOUR_DELIVERY_INFO}    timeout=10s
    Verify Address Section Contains All Expected Elements    ${YOUR_DELIVERY_INFO}
    # Count address list items to ensure all expected fields are present
    ${address_items}=    Get All Address List Items    ${YOUR_DELIVERY_INFO}
    ${count}=    Get Element Count    ${YOUR_DELIVERY_INFO}//li
    Should Be True    ${count} >= 7    Expected at least 7 address elements but found ${count}

Verify Delivery Address Content Item By Item
    # Verify name
    ${name_text}=    Get Text    ${YOUR_DELIVERY_INFO}${ADDRESS_FIRST_LAST_NAME}
    Should Contain    ${name_text}    ${EXPECTED_NAME}

    # Verify company/address
    ${company_text}=    Get Text    ${YOUR_DELIVERY_INFO}${ADDRESS_COMPANY}
    Should Contain    ${company_text}    ${EXPECTED_COMPANY}

    # Verify city, state, zip
    ${city_state_zip_text}=    Get Text    ${YOUR_DELIVERY_INFO}${ADDRESS_CITY_STATE_ZIP}
    Should Be Equal    ${city_state_zip_text}    ${EXPECTED_CITY_STATE_ZIP}

    # Verify country
    ${country_text}=    Get Text    ${YOUR_DELIVERY_INFO}${ADDRESS_COUNTRY}
    Should Be Equal    ${country_text}    ${EXPECTED_COUNTRY}

    # Verify phone
    ${phone_text}=    Get Text    ${YOUR_DELIVERY_INFO}${ADDRESS_PHONE}
    Should Contain    ${phone_text}    ${EXPECTED_PHONE}