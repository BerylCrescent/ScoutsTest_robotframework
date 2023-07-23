*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${ADDPLAYERAGEINPUT}                xpath=//input[@name='age']
${ADDPLAYERLINK}                  xpath=//span[text()='Add player']
${ADDPLAYERCLUBINPUT}               xpath=//input[@name='club']
${ADDPLAYERDISTRICTINPUT}           xpath=//*[@id='mui-component-select-district']
${ADDPLAYERDISTRICTDOLNINPUT}       xpath=//li[@data-value='dolnoslaskie']
${ADDPLAYEREMAILINPUT}              xpath=//input[@name='email']
${ADDPLAYERHEIGHTINPUT}             xpath=//input[@name='height']
${ADDPLAYERLEGINPUT}                xpath=//*[@id='mui-component-select-leg']
${ADDPLAYERLEGLEFTINPUT}            xpath=//div/ul/li[@data-value='left']
${ADDPLAYERLEGRIGHTINPUT}           xpath=//li[@data-value='right']
${ADDPLAYERMAINPOSITIONINPUT}       xpath=//input[@name='mainPosition']
${ADDPLAYERNAMEINPUT}               xpath=//input[@name='name']
${ADDPLAYERPHONEINPUT}              xpath=//input[@name='phone']
${ADDPLAYERSECONDPOSITIONINPUT}     xpath=//input[@name='secondPosition']
${ADDPLAYERSUBMITBUTTON}            xpath=//button[@type='submit']
${ADDPLAYERSURNAMEINPUT}            xpath=//input[@name='surname']
${ADDPLAYERWEIGHTINPUT}             xpath=//input[@name='weight']
${BACKTOSIGNINLINK}                 xpath=//a[text()='Back to sign in']
${BROWSER}                          Chrome
${EMAILINPUT}                       xpath=//*[@id='login']
${LOGIN URL}                        https://scouts-test.futbolkolektyw.pl/en
${MAINPAGELINK}                     xpath=//span[text()='Main page']
${PAGELOGO}                         xpath=//div[@title='Logo Scouts Panel']
${PASSWORDINPUT}                    xpath=//*[@id='password']
${REMINDPASSWORDLINK}               xpath=//a[text()='Remind password']
${SCOUTSPANEL}                      xpath=//form/div/div[1]/h5
${SIGNINBUTTON}                     xpath=//button[@type='submit']
${SIGNOUTBUTTON}                    xpath=//span[text()='Sign out']



*** Test Cases ***
Login to the system
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser

Login logout test
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Enter Dashboard
    Click On The Signout Button
    Assert Login Page
    [Teardown]  Close Browser

Login Invalid Data
    Open Login Page
    Type In Invalid Email
    Type In Invalid Password
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser

Login Invalid Email
    Open Login Page
    Type In Invalid Email
    Type In Password
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser

Login Invalid Password
    Open Login Page
    Type In Email
    Type In Invalid Password
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser

Login No Data
    Open Login Page
    Click On The Submit Button
    Assert Dashboard
    [Teardown]  Close Browser

Hyperlink On Login Page
    Open Login Page
    Click On Remind Password
    Screenshot Plz
    Click On Back To Sign In
    Assert Login Page
    [Teardown]    Close Browser

Add New Player
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Click Add Player Button
    Fill The Fields
    Fill Leg Field
    Fill District Field
    Click Add Player Submit Button
    Click On The Main Page
    Enter Dashboard
    [Teardown]    Close Browser


*** Keywords ***
Open Login Page
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type In Email
    Input Text    ${EMAILINPUT}     user09@getnada.com
Type In Invalid Email
    Input Text    ${EMAILINPUT}     user19@getnada.com
Type In Password
    Input Text    ${PASSWORDINPUT}  Test-1234
Type In Invalid Password
    Input Text    ${PASSWORDINPUT}  test-4321
Click On The Submit Button
    Click Element    xpath=//button[@type='submit']
Assert Dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot          alert.png
Enter Dashboard
    Wait Until Element Is Visible    ${SIGNOUTBUTTON}
    Capture Page Screenshot          login.png
Click On The Signout Button
    Click Element    ${SIGNOUTBUTTON}
Assert Login Page
    Wait Until Element Is Visible    ${SCOUTSPANEL}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot          logout.png
Click On Remind Password
    Click Element    ${REMINDPASSWORDLINK}
Screenshot Plz
    Capture Page Screenshot    alert.png
Click On Back To Sign In
    Click Element    ${BACKTOSIGNINLINK}
Click Add Player Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element                    ${ADDPLAYERLINK}
Fill The Fields
    Wait Until Element Is Visible   ${ADDPLAYERSUBMITBUTTON}
    Input Text    ${ADDPLAYEREMAILINPUT}    witcher@op.pl
    Input Text    ${ADDPLAYERNAMEINPUT}     Geralt
    Input Text    ${ADDPLAYERSURNAMEINPUT}  Riv
    Input Text    ${ADDPLAYERPHONEINPUT}    500555005
    Input Text    ${ADDPLAYERWEIGHTINPUT}   55
    Input Text    ${ADDPLAYERHEIGHTINPUT}   182
    Input Text    ${ADDPLAYERCLUBINPUT}     Kaer Morhen
    Input Text    ${ADDPLAYERSECONDPOSITIONINPUT}   Monster Slayer
    Input Text    ${ADDPLAYERMAINPOSITIONINPUT}     Witcher
    Input Text    ${ADDPLAYERAGEINPUT}              11.11.2011
Fill Leg Field
    Wait Until Element Is Visible   ${ADDPLAYERLEGINPUT}
    Click Element                   ${ADDPLAYERLEGINPUT}
    Wait Until Element Is Visible   ${ADDPLAYERLEGRIGHTINPUT}
    Click Element                   ${ADDPLAYERLEGRIGHTINPUT}
Fill District Field
    Wait Until Element Is Visible   ${ADDPLAYERDISTRICTINPUT}
    Click Element                   ${ADDPLAYERDISTRICTINPUT}
    Wait Until Element Is Visible   ${ADDPLAYERDISTRICTDOLNINPUT}
    Click Element                   ${ADDPLAYERDISTRICTDOLNINPUT}
Click Add Player Submit Button
    Click Element    ${ADDPLAYERSUBMITBUTTON}
Click On The Main Page
    Click Element    ${MAINPAGELINK}

