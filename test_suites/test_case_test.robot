*** Settings ***
Resource    ../resources/common_resources.robot
Test Setup    Go To Required Link    ${TEST_CASES_LINK}
Test Teardown   Close All Browsers

*** Variables ***
${HEADER_TEST_CASES_LOCATOR}    //*[text() = 'Test Cases']
${TEST_CASES_LINK}    //*[@id="header"]//a[@href="/test_cases"]

*** Test Cases ***
Verify Test Cases Page
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_TEST_CASES_LOCATOR}    TEST CASES