*** Settings ***
Documentation    custom actions for the test suit sign up (steps + elements)

Library    Browser

*** Keywords ***
Go to signup page
    Click    selector=css=a[href="/signup"]
    
    Wait For Elements State    
    ...    selector=form h1     
    ...    state=visible    
    ...    timeout=5000
    
    Get Text    
    ...    selector=form h1    
    ...    assertion_operator=equal    
    ...    assertion_expected=Faça seu cadastro

Fill signup form
    [Arguments]        ${user_info}
    Fill Text    
    ...    selector=css=input[name=name]              
    ...    txt=${user_info}[name]

    Fill Text    
    ...    selector=css=input[name=email]             
    ...    txt=${user_info}[email]

    Fill Text    
    ...    selector=css=input[name=cpf]               
    ...    txt=${user_info}[cpf]
    
    Fill Text    
    ...    selector=css=input[name=cep]               
    ...    txt=${user_info}[cep]

    
    Click    selector=css=input[type=button][value$=CEP]

    #Sleep    time_=3

    Get Property    
    ...    selector=css=input[name=addressStreet]    
    ...    property=value   
    ...    assertion_operator=equal    
    ...    assertion_expected=${user_info}[street]

    Get Property    
    ...    selector=css=input[name=addressDistrict]   
    ...    property=value   
    ...    assertion_operator=equal    
    ...    assertion_expected=${user_info}[district]

    Get Property    
    ...    selector=css=input[name=addressCityUf]    
    ...    property=value   
    ...    assertion_operator=equal    
    ...    assertion_expected=${user_info}[cityUf]

    Fill Text    
    ...    selector=css=input[name=addressNumber]     
    ...    txt=${user_info}[number]

    Fill Text    
    ...    selector=css=input[name=addressDetails]    
    ...    txt=${user_info}[details]

    Upload File By Selector    
    ...    selector=css=input[type=file]    
    ...    path=${EXECDIR}/resources/fixtures/${user_info}[user_id]
    
Submit form
    Click    selector=.button-register
    
Feedback should be
    [Arguments]    ${expected-message}
    
    Wait For Elements State    
    ...    selector=.swal2-html-container       
    ...    state=visible   
    ...    timeout=5

    Get Text    
    ...    selector=.swal2-html-container    
    ...    assertion_operator=equal    
    ...    assertion_expected=${expected-message}
    

Alert should be
    [Arguments]    ${expected-text}
    
    Wait For Elements State    
    ...    selector=css=.alert-error >> text=${expected-text}       
    ...    state=visible   
    ...    timeout=5

