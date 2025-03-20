*** Settings ***
Library    OperatingSystem
Library    String
Library    BuiltIn


*** Variables ***
${RAW_FILE_PATH}    ${CURDIR}\\files\\understanding-abstract-art.jpg
#${NORMALIZED_FILE_PATH}=  Replace String  ${RAW_FILE_PATH}  \\  /


*** Keywords ***
