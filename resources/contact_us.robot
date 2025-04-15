*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Keywords ***
Remove File From Resources
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${CURDIR}/${file_name}
    File Should Exist    ${file_path}
    Remove File    ${file_path}
    Log    File ${file_name} removed from Resources directory.
    File Should Not Exist    ${file_path}

