*** Settings ***
Resource    ../resources/created_keywrods.robot
Resource    ../resources/common_keywords.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/test_case_test.robot
*** Variables ***
${HEADER_TEST_CASES_LOCATOR} =  xpath=//*[@id="form"]/div[1]//h2
${EXPECTED_HEADER_TEST_CASES} =  TEST CASES

*** Test Cases ***
Test Case 7: Verify Test Cases Page
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Test cases" button
    Verify user is navigated to "Test cases" page successfully  ${HEADER_TEST_CASES_LOCATOR}    ${EXPECTED_HEADER_TEST_CASES}