*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description   #automated tests for scout website

*** Variables ***
${ADDPLAYER90INPUT}                 xpath=//input[@name='web90']
${ADDPLAYERACHIEVEMENTINPUT}        xpath=//input[@name='achievements']
${ADDPLAYERAGEINPUT}                xpath=//input[@name='age']
${ADDPLAYERLINK}                    xpath=//span[text()='Add player']
${ADDPLAYERCLUBINPUT}               xpath=//input[@name='club']
${ADDPLAYERDISTRICTINPUT}           xpath=//*[@id='mui-component-select-district']
${ADDPLAYERDISTRICTDOLNINPUT}       xpath=//li[@data-value='dolnoslaskie']
${ADDPLAYEREMAILINPUT}              xpath=//input[@name='email']
${ADDPLAYERFBINPUT}                 xpath=//input[@name='webFB']
${ADDPLAYERHEIGHTINPUT}             xpath=//input[@name='height']
${ADDPLAYERLACZYINPUT}              xpath=//input[@name='webLaczy']
${ADDPLAYERLANGUAGEBUTTON}          xpath=//button[@aria-label='Add language']
${ADDPLAYERLANGUAGEINPUT}           xpath=//input[@name='languages[0]']
${ADDPLAYERLEGINPUT}                xpath=//*[@id='mui-component-select-leg']
${ADDPLAYERLEGLEFTINPUT}            xpath=//div/ul/li[@data-value='left']
${ADDPLAYERLEGRIGHTINPUT}           xpath=//li[@data-value='right']
${ADDPLAYERLEVELINPUT}              xpath=//input[@name='level']
${ADDPLAYERMAINPOSITIONINPUT}       xpath=//input[@name='mainPosition']
${ADDPLAYERNAMEINPUT}               xpath=//input[@name='name']
${ADDPLAYERNOTIFICATIONSAVED}       xpath=//*[text()='Added player.']
${ADDPLAYERNOTIFICATIONREDIR}       xpath=//*[text()='Redirect to edit page']
${ADDPLAYERPHONEINPUT}              xpath=//input[@name='phone']
${ADDPLAYERSECONDPOSITIONINPUT}     xpath=//input[@name='secondPosition']
${ADDPLAYERSUBMITBUTTON}            xpath=//button[@type='submit']
${ADDPLAYERSURNAMEINPUT}            xpath=//input[@name='surname']
${ADDPLAYERWEIGHTINPUT}             xpath=//input[@name='weight']
${ADDPLAYERYOUTUBEBUTTON}           xpath=//button[@aria-label='Add link to Youtube']
${ADDPLAYERYOUTUBEINPUT}            xpath=//input[@name='webYT[0]']
${BACKTOSIGNINLINK}                 xpath=//a[text()='Back to sign in']
${BROWSER}                          Chrome
${COLUMNSAGEBOX}                    xpath=//*[@value='age']
${COLUMNSCLOSEBUTTON}               xpath=//body/div[2]/div[3]/button
${COLUMNSMATCHESBOX}                xpath=//*[@value='matches']
${COLUMNSRATINGBOX}                 xpath=//*[@value='rating']
${COLUMNSREPORTSBOX}                xpath=//*[@value='reports']
${COLUMNSVIEWBUTTON}                      xpath=//*[@title='View Columns']
${EMAILINPUT}                       xpath=//*[@id='login']
${FILTERSTABLEBUTTON}               xpath=//*[@title='Filter Table']
${FILTERSCLOSEBUTTON}               xpath=/html/body/div[2]/div[3]/button
${FILTERSCLUBINPUT}                 xpath=//div[2]/div[5]/div/div/div/input
${FILTERSMAINPOSITIONINPUT}         xpath=//div[2]/div[4]/div/div/div/input
${FILTERSNAMEINPUT}                 xpath=//div[2]/div[1]/div/div/div/input
${FILTERSSEARCH}                    xpath=//main/div[2]/div/div/div[2]/div
${FILTERSSURNAMEINPUT}              xpath=//div/div[2]/div[2]/div/div/div/input
${LOGINPAGENOTIFIDENT}              xpath=//*[contains(text(),'Identifier')]
${LOGINPAGENOTIFPASSEMAIL}          xpath=//*[contains(text(),'Please')]
${LOGIN URL}                        https://dareit.futbolkolektyw.pl/en
${LOGIN URL FIRST}                  https://scouts-test.futbolkolektyw.pl/en
${MAINPAGELINK}                     xpath=//span[text()='Main page']
${PAGELOGO}                         xpath=//div[@title='Logo Scouts Panel']
${PASSWORDINPUT}                    xpath=//*[@id='password']
${PLAYERSBUTTON}                    xpath=//span[text()='Players']
${REMINDPASSWORDEMAILINPUT}         xpath=//input[@name='email']
${REMINDPASSWORDLINK}               xpath=//a[text()='Remind password']
${REMINDPASSWORDNOTIFICATION}       xpath=//*[text()='Message sent successfully.']
${REMINDPASSWORDSENDBUTTON}         xpath=//button[@type='submit']
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
    Assert Ident Notification
    Assert Dashboard
    [Teardown]  Close Browser

Login Invalid Email
    Open Login Page
    Type In Invalid Email
    Type In Password
    Click On The Submit Button
    Assert Ident Notification
    Assert Dashboard
    [Teardown]  Close Browser

Login Invalid Password
    Open Login Page
    Type In Email
    Type In Invalid Password
    Click On The Submit Button
    Assert Ident Notification
    Assert Dashboard
    [Teardown]  Close Browser

Login No Data
    Open Login Page
    Click On The Submit Button
    Assert Provide Pass Email
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
    Fill Language Field
    Fill Youtube Field
    Click Add Player Submit Button
    Assert Popup
    Click On The Main Page
    Enter Dashboard
    [Teardown]    Close Browser

Remind Password
    Open Login Page
    Click On Remind Password
    Remind Type In Email
    Remind Click Send
    Remind Assert Popup
    [Teardown]    Close Browser

Search Filter Table
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Click On Players
    Fill Filters
    Choose Columns
    Screenshot Plz
    [Teardown]    Close Browser

*** Keywords ***
Assert Dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
#    Title Should Be                     Scouts panel
    Capture Page Screenshot             alert.png
Assert Ident Notification
    Wait Until Element Is Visible       ${LOGINPAGENOTIFIDENT}
    Capture Page Screenshot             identnotif.png
Assert Login Page
    Wait Until Element Is Visible       ${SCOUTSPANEL}
#    Title Should Be                     Scouts panel - sign in
    Capture Page Screenshot             logout.png
Assert Popup
    Wait Until Element Is Visible       ${ADDPLAYERNOTIFICATIONSAVED}
    Wait Until Element Is Visible       ${ADDPLAYERNOTIFICATIONREDIR}
Assert Provide Pass Email
    Wait Until Element Is Visible       ${LOGINPAGENOTIFPASSEMAIL}
    Capture Page Screenshot             providepassemail.png
Choose Columns
    Click Element                       ${COLUMNSVIEWBUTTON}
    Click Element                       ${COLUMNSAGEBOX}
    Click Element                       ${COLUMNSRATINGBOX}
    Click Element                       ${COLUMNSMATCHESBOX}
    Click Element                       ${COLUMNSREPORTSBOX}
    Click Element                       ${COLUMNSCLOSEBUTTON}
    Capture Page Screenshot             search_filter_table.png
Click Add Player Submit Button
    Click Element                    ${ADDPLAYERSUBMITBUTTON}
Click Add Player Button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element                    ${ADDPLAYERLINK}
Click On Back To Sign In
    Click Element                    ${BACKTOSIGNINLINK}
Click On Players
    Wait Until Element Is Visible       ${PLAYERSBUTTON}
    Click Element                       ${PLAYERSBUTTON}
Click On Remind Password
    Click Element                    ${REMINDPASSWORDLINK}
Click On The Main Page
    Click Element                       ${MAINPAGELINK}
Click On The Signout Button
    Click Element                    ${SIGNOUTBUTTON}
Click On The Submit Button
    Click Element    xpath=//button[@type='submit']
Enter Dashboard
    Wait Until Element Is Visible    ${SIGNOUTBUTTON}
    Capture Page Screenshot          newplayer.png
Fill District Field
    Wait Until Element Is Visible   ${ADDPLAYERDISTRICTINPUT}
    Click Element                   ${ADDPLAYERDISTRICTINPUT}
    Wait Until Element Is Visible   ${ADDPLAYERDISTRICTDOLNINPUT}
    Click Element                   ${ADDPLAYERDISTRICTDOLNINPUT}
Fill filters
    Wait Until Element Is Visible       ${FILTERSTABLEBUTTON}
    Click Element                       ${FILTERSTABLEBUTTON}
    Input Text                          ${FILTERSNAMEINPUT}             Michael
    Input Text                          ${FILTERSSURNAMEINPUT}          Kelso
    Input Text                          ${FILTERSMAINPOSITIONINPUT}     Kettlehead
    Input Text                          ${FILTERSCLUBINPUT}             Point Place
    Click Element                       ${FILTERSCLOSEBUTTON}
    Wait Until Element Is Visible       ${FILTERSSEARCH}
Fill Language Field
    Click Element                   ${ADDPLAYERLANGUAGEBUTTON}
    Input Text                      ${ADDPLAYERLANGUAGEINPUT}       Polish
Fill Leg Field
    Wait Until Element Is Visible   ${ADDPLAYERLEGINPUT}
    Click Element                   ${ADDPLAYERLEGINPUT}
    Wait Until Element Is Visible   ${ADDPLAYERLEGRIGHTINPUT}
    Click Element                   ${ADDPLAYERLEGRIGHTINPUT}
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
    Input Text    ${ADDPLAYERLEVELINPUT}            None
    Input Text    ${ADDPLAYERACHIEVEMENTINPUT}      None
    Input Text    ${ADDPLAYERLACZYINPUT}            Tak
    Input Text    ${ADDPLAYER90INPUT}               Też
#    Input Text    ${ADDPLAYERFBINPUT}               To może nie
Fill Youtube Field
    Click Element                   ${ADDPLAYERYOUTUBEBUTTON}
    Input Text                      ${ADDPLAYERYOUTUBEINPUT}        https://www.youtube.com/watch?v=dQw4w9WgXcQ
Open Login Page
    Open Browser        ${LOGIN URL}    ${BROWSER}
#    Title Should Be     Scouts panel - sign in
Remind Assert Popup
    Wait Until Element Is Visible       ${REMINDPASSWORDNOTIFICATION}
    Capture Page Screenshot             remind_password.png
Remind Click Send
    Click Element                       ${REMINDPASSWORDSENDBUTTON}
Remind Type In Email
    Input Text                          ${REMINDPASSWORDEMAILINPUT}     user09@getnada.com
Screenshot Plz
    Capture Page Screenshot          alert.png
Type In Email
    Input Text          ${EMAILINPUT}     user09@getnada.com
Type In Invalid Email
    Input Text          ${EMAILINPUT}     user19@getnada.com
Type In Invalid Password
    Input Text          ${PASSWORDINPUT}  test-4321
Type In Password
    Input Text          ${PASSWORDINPUT}  Test-1234


