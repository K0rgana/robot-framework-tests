*** Settings ***
Documentation    suite de teste da sign up page

Library    Browser

*** Test Cases ***
should signup a new user
    ${user_info}    Create Dictionary
    ...    name=Thor Odinson
    ...    email=thunder@mail.com
    ...    cpf=00819266000
    ...    cep=69097339
    ...    street=Rua 248
    ...    number=333
    ...    details=Gate1
    ...    district=Nova Cidade
    ...    cityUf=Manaus/AM
    ...    user_id=/data/sample_id.jpeg

    Go to signup page
    Fill signup form    ${user_info}
    Submit form
    Feedback should be   expected-message=Recebemos o seu cadastro e em breve retornaremos o contato.
    Get evidence

*** Keywords ***
Go to signup page
    New Browser     browser=firefox    headless=True
    New Page        url=https://walkdog.vercel.app/signup

Fill signup form
    [Arguments]        ${user_info}
    Wait For Elements State    selector=form h1     state=visible    timeout=3
    Get Text    selector=form h1    assertion_operator=equal    assertion_expected=Faça seu cadastro

    Fill Text    selector=css=input[name=name]              txt=${user_info}[name]
    Fill Text    selector=css=input[name=email]             txt=${user_info}[email]
    Fill Text    selector=css=input[name=cpf]               txt=${user_info}[cpf]
    
    Fill Text    selector=css=input[name=cep]               txt=${user_info}[cep]
    Click    selector=css=input[type=button][value$=CEP]

    Get Property    selector=css=input[name=addressStreet]    property=value   assertion_operator=equal    assertion_expected=${user_info}[street]
    Get Property    selector=css=input[name=addressDistrict]   property=value   assertion_operator=equal    assertion_expected=${user_info}[district]
    Get Property    selector=css=input[name=addressCityUf]    property=value   assertion_operator=equal    assertion_expected=${user_info}[cityUf]

    Fill Text    selector=css=input[name=addressNumber]     txt=${user_info}[number]
    Fill Text    selector=css=input[name=addressDetails]    txt=${user_info}[details]

    Upload File By Selector    selector=css=input[type=file]    path=${EXECDIR}${user_info}[user_id]
    
Submit form
    Click    selector=.button-register
    
Feedback should be
    [Arguments]    ${expected-message}
    Wait For Elements State    selector=.swal2-html-container       state=visible   timeout=5
    Get Text    selector=.swal2-html-container    assertion_operator=equal    assertion_expected=${expected-message}
    
Get evidence
    Sleep    time_=1
    Take Screenshot

