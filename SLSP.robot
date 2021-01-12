*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${browser}  chrome
${url}  http://loadrunnertips.com/LoadRunner_Correlation_Challenge_Mod.aspx
${urlg}    https://www.google.sk/?hl=sk
${cislo}
${item}
${ot}   On Time
${i}
*** Test Cases ***
Test
    open browser    ${urlg}   ${browser}
    maximize browser window
    go to   ${url}
    click button    id:head_btnStart
    ${cislo}    get Text    id:head_lblMagicno
    input text  id:head_txtMacigNo  ${cislo}
    click button    id:head_btnNext
    click button    id:Button1
    FOR   ${i}    IN RANGE    1   21
       BuiltIn.Set Global Variable  ${i}
       ${item}  get text    head_lblstatus${i}
       Run Keyword if   "${item}"=="${ot}"  Test Keyword 1
       ...  ELSE    Test Keyword 2
    END
    click button    id:head_btnNext3
    close browser


*** Keywords ***
Test Keyword 1
    select checkbox  id:head_chk${i}
Test keyword 2
    checkbox should not be selected  id:head_chk${i}
