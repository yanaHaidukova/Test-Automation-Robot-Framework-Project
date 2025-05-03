*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${HOME_PAGE_LINK}    https://automationexercise.com
${BROWSER}    headlesschrome
${VIEW_CART}    //*[@class="modal-body"]//a[@href="/view_cart"]
${CART_BREADCRUMPS}    //*[@class="breadcrumb"]/li[2]
${PROCEED_CHECKOUT}    //a[@class="btn btn-default check_out"]
${NAME_FIELD_ID}    //input[@name="name"]
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${SIGNUP_LOGIN_LINK}    //*[@id="header"]//a[@href="/login"]
${HEADER_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${CREATE_ACCOUNT_BUTTON}    //button[@type="submit"][@data-qa="create-account"]
${ACCOUNT_CREATED_ID}    //*[@id="form"]//h2[@data-qa="account-created"]
${SIGNUP_BUTTON}    //button[@type="submit"][@data-qa="signup-button"]
${PASSWORD_VALUE}    PASSWORD123
@{ADDRESS_INFORMATION}    Lora    Patison    SoftServe    Test address 1    Test address 2    Canada    Ontario    Toronto    123456     +1250555019