*** Settings ***
Resource    ../resources/common_resources.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/test_case_test.robot
*** Variables ***
${HEADER_TEST_CASES_LOCATOR}    //*[@id="form"]/div[1]//h2
${TEST_CASES_BUTTON}    //*[@id="header"]//a[@href="/test_cases"]

*** Test Cases ***
Verify Test Cases Page
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if the user can navigate to the Test cases page
    [Setup]  Go To Automation Exercise Home Page
    Click Link     ${TEST_CASES_BUTTON}
    Verify User Is Navigated To Test Cases Page Successfully    ${HEADER_TEST_CASES_LOCATOR}    TEST CASES