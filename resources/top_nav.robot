*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_resources.robot

*** Variables ***
${CONTACT_US_LINK}    //*[@href="/contact_us"]
${PRODUCTS_LINK}    //*[@id="header"]//a[@href="/products"]
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2

*** Keywords ***
Check User Can Navigate To Contact Us Page
    Click Link    ${CONTACT_US_LINK}
    Check Get In Touch Section Is Visible    ${HEADER_LOCATOR_CONTACT_US}    GET IN TOUCH

Check User Can Navigate To Products Page
    Click Link    ${PRODUCTS_LINK}
    Check Products List Is Shown

