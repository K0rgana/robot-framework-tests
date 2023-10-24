*** Settings ***
Documentation    suite de teste da sign up page

Library    Browser

*** Test Cases ***
should signup a new user
    #data
    ${name}               Set Variable    Thor Odinson
    ${email}              Set Variable    thunder@mail.com
    ${cpf}                Set Variable    00819266000
    ${cep}                Set Variable    69097339
    ${addressStreet}      Set Variable    Rua 248
    ${addressNumber}      Set Variable    333
    ${addressDetails}     Set Variable    Gate1
    ${addressDistrict}    Set Variable    Nova Cidade
    ${addressCityUf}      Set Variable    Manaus/AM
    ${sample_id}          Set Variable    /data/sample_id.jpeg

    Go to signup page
    Fill signup form    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}    ${addressDistrict}   ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${sample_id}
    Submit form
    Feedback should be   message=Recebemos o seu cadastro e em breve retornaremos o contato.
    Get evidence

*** Keywords ***
Go to signup page
    New Browser     browser=firefox    headless=True
    New Page        url=https://walkdog.vercel.app/signup

Fill signup form
    [Arguments]        ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}    ${addressDistrict}   ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${sample_id}
    Wait For Elements State    selector=form h1     state=visible    timeout=3
    Get Text    selector=form h1    assertion_operator=equal    assertion_expected=Faça seu cadastro

    Fill Text    selector=css=input[name=name]              txt=${name}
    Fill Text    selector=css=input[name=email]             txt=${email}
    Fill Text    selector=css=input[name=cpf]               txt=${cpf}
    
    Fill Text    selector=css=input[name=cep]               txt=${cep}
    Click    selector=css=input[type=button][value$=CEP]

    Get Property    selector=css=input[name=addressStreet]    property=value   assertion_operator=equal    assertion_expected=${addressStreet}
    Get Property    selector=css=input[name=addressDistrict]   property=value   assertion_operator=equal    assertion_expected=${addressDistrict}
    Get Property    selector=css=input[name=addressCityUf]    property=value   assertion_operator=equal    assertion_expected=${addressCityUf}

    Fill Text    selector=css=input[name=addressNumber]     txt=${addressNumber}
    Fill Text    selector=css=input[name=addressDetails]    txt=${addressDetails}

    Upload File By Selector    selector=css=input[type=file]    path=${EXECDIR}${sample_id}
    
Submit form
    Click    selector=.button-register
    
Feedback should be
    [Arguments]    ${expected-message}
    Wait For Elements State    selector=.swal2-html-container       state=visible   timeout=5
    Get Text    selector=.swal2-html-container    assertion_operator=equal    assertion_expected=${expected-message}
    
Get evidence
    Sleep    time_=1
    Take Screenshot

