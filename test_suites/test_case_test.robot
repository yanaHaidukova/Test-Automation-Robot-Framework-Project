*** Settings ***
Resource    ../resources/common_resources.robot
Test Setup    Go To Automation Exercise Home Page
Test Teardown   Close All Browsers

*** Variables ***
${HEADER_TEST_CASES_LOCATOR}    //*[text() = 'Test Cases']
${TEST_CASES_BUTTON}    //*[@id="header"]//a[@href="/test_cases"]

*** Test Cases ***
Verify Test Cases Page
    [Tags]  UI_tests_Part1
    Click Link     ${TEST_CASES_BUTTON}
    Check User Is Redirected To The Selected Page    ${HEADER_TEST_CASES_LOCATOR}    TEST CASES