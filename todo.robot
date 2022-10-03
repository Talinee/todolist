* Settings *
Library    SeleniumLibrary    timeout=10
Library    BuiltIn
Suite Teardown  Close All Browsers

* Variable *
${HOMEPAGE}  https://abhigyank.github.io/To-Do-List/
${BROWSER}  chrome
${xpath_inputer}  //*[@id="new-task"]
${todo}  Do some test
${btn}    //*[@id="add-item"]/button/i 
${todo_btn}     //html/body/div/div/div[1]/a[2]/span
${add_todo}    //*[@id="incomplete-tasks"]
${done_btn}  //html/body/div/div/div[1]/a[3]
${done}    //*[@id="completed-tasks"]/li[1]/span
${check_box}    //*[@id="incomplete-tasks"]/li/label/span[4]
${delete_in_todo}    //*[@id="1"]/span

* Keywords *
Input Todo List   
    [Arguments]      ${xpath_input}       ${todo}
    Element Should Be Visible  ${xpath_inputer}
    Input Text       ${xpath_input}       ${todo}
Click Button 
    [Arguments]       ${btn}
    Element Should Be Visible    ${btn}
    Click Element        ${btn}
Click Todo Task
    [Arguments]       ${todo_btn}
    Element Should Be Visible    ${todo_btn}
    Click Element        ${todo_btn}
Check Done
    [Arguments]       ${check_box}
    Element Should Be Visible    ${check_box}
    Click Element        ${check_box}
Click done Task
    [Arguments]       ${done_btn} 
    Element Should Be Visible    ${done_btn} 
    Click Element        ${done_btn} 
Click Delete Todo
    [Arguments]       ${delete_in_todo} 
    Element Should Be Visible    ${delete_in_todo} 
    Click Element        ${delete_in_todo} 
Verify Todo Succes
    Wait Until Element Is Visible   ${add_todo}
    Element Should Be Visible    ${add_todo}
Verify Done Succes
    Wait Until Element Is Visible  ${done} 
    Element Should Be Visible    ${done}
Verify Delete Todo Succes
    Element Should Not Be Visible    ${add_todo}
Click Delete Done
    [Arguments]       ${delete_in_todo} 
    Element Should Be Visible    ${delete_in_todo} 
    Click Element        ${delete_in_todo}

* Test Cases *
Add Item
    [tags]    Pass
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Input Todo List    ${xpath_inputer}  ${todo} 
    Click Button           ${btn} 

Add Fail
    [tags]    Fail
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Click Button           ${btn} 

To-do Task
    [tags]    Pass
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Input Todo List    ${xpath_inputer}  ${todo} 
    Click Button          ${btn}
    Click Todo Task    ${todo_btn}
    Verify Todo Succes

Check done Task
    [tags]    Pass
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Input Todo List    ${xpath_inputer}  ${todo} 
    Click Button          ${btn}
    Click Todo Task    ${todo_btn}
    Verify Todo Succes
    Check Done    ${check_box}
    Click done Task    ${done_btn}
    Verify Done Succes

Delete In To-Do
    [tags]    Pass
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Input Todo List    ${xpath_inputer}  ${todo} 
    Click Button          ${btn}
    Click Todo Task    ${todo_btn}
    Verify Todo Succes
    Click Delete Todo    ${delete_in_todo}
    Verify Delete Todo Succes

Delete In To-Done
    [tags]    Pass
    Open Browser    about:blank    chrome
    Go To           ${HOMEPAGE}  
    Input Todo List    ${xpath_inputer}  ${todo} 
    Click Button          ${btn}
    Click Todo Task    ${todo_btn}
    Verify Todo Succes
    Check Done    ${check_box}
    Click done Task    ${done_btn}
    Verify Done Succes
    Click Delete Done    ${delete_in_todo}
    Verify Delete Todo Succes



   