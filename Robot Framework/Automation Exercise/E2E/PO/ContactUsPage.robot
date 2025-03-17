*** Settings ***
Library    Browser
Library    Dialogs

*** Variables ***
${CONTACT_US_INPUT_FIELD_NAME} =               xpath=//*[@data-qa='name']
${CONTACT_US_INPUT_FIELD_EMAIL} =              xpath=//*[@data-qa='email']
${CONTACT_US_INPUT_FIELD_SUBJECT} =            xpath=//*[@data-qa='subject']
${CONTACT_US_INPUT_FIELD_MESSAGE} =            xpath=//*[@data-qa='message']
${CONTACT_US_uPLOAD_FIELD_FILE} =              xpath=//*[@name='upload_file']
${SUBMIT_BUTTON} =                             xpath=//*[@id="contact-us-form"]/div[6]/input
${SUMBIT_SUCCES} =                             xpath=//*[@class="status alert alert-success"]
${HOME_BUTTON} =                               xpath=//*[@class='btn btn-success']


*** Keywords ***
Send Contact Form
    Enter Name
    Enter Email
    Enter Subject
    Enter Message
    Execute Manual Step    test
    #Upload File
    Click Submit Button
    #Handle Alert
    #Verify Form Has Been Submitted
    #Click Home Button

Enter Name
    Type Text    ${CONTACT_US_INPUT_FIELD_NAME}           Henk

Enter Email
    Type Text    ${CONTACT_US_INPUT_FIELD_EMAIL}           Henk@Henk.com

Enter Subject
    Type Text    ${CONTACT_US_INPUT_FIELD_SUBJECT}         Testing

Enter Message
    Type Text    ${CONTACT_US_INPUT_FIELD_MESSAGE}         I'm inputting this text

Upload File
    Upload File By Selector    ${CONTACT_US_uPLOAD_FIELD_FILE}          C:/Programma's/Robot framework/Automation Exercise/TestFile.txt

Click Submit Button
    Click    ${SUBMIT_BUTTON}


Handle Alert
    Wait For Alert    accept

Verify Form Has Been Submitted
    Wait For Elements State    ${SUMBIT_SUCCES}    visible

Click Home Button
    Click    ${HOME_BUTTON}