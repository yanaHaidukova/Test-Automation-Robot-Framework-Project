*** Settings ***
Library    OperatingSystem
Library    String
Library    BuiltIn


*** Variables ***
${RAW_FILE_PATH}  ${CURDIR}\\files\\understanding-abstract-art.jpg
${NORMALIZED_FILE_PATH}=  Normalize Path  ${RAW_FILE_PATH}
${FILE_PATH}=  Replace String  ${NORMALIZED_FILE_PATH}  \\  /

*** Keywords ***
