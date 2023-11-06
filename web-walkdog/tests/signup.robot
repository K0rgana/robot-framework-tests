*** Settings ***
Documentation    test suite sign up page

Library    Browser
Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
should signup a new user
    [Tags]    smoke

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
    ...    user_id=sample_id.jpeg

    Go to signup page
    Fill signup form    ${user_info}
    Submit form
    Feedback should be   expected-message=Recebemos o seu cadastro e em breve retornaremos o contato.

should not signup if required fields are empty
    [Tags]    required

    Go to signup page
    Submit form

    Alert should be    expected-text=Informe o seu nome completo
    Alert should be    expected-text=Informe o seu melhor email
    Alert should be    expected-text=Informe o seu CPF
    Alert should be    expected-text=Informe o seu CEP
    Alert should be    expected-text=Informe um número maior que zero
    Alert should be    expected-text=Adcione um documento com foto (RG ou CHN)

should verify if data is valid 
    [Tags]    validate

    ${user_info}    Create Dictionary
    ...    name=Ultron
    ...    email=tstark
    ...    cpf=1234567890
    ...    cep=12345
    ...    street=
    ...    number=-333
    ...    details=
    ...    district=
    ...    cityUf=
    ...    user_id=sample_id.jpeg

    Go to signup page
    Fill signup form    ${user_info}

    Submit form

    Alert should be    expected-text=Informe um email válido
    Alert should be    expected-text=CPF inválido
    Alert should be    expected-text=Informe um CEP válido
    Alert should be    expected-text=Informe um número maior que zero

should signup a new user who do nurce as sevice
    [Tags]    extraservice

    ${user_info}    Create Dictionary
    ...    name=Bruce Banner
    ...    email=hulk@mail.com
    ...    cpf=00819266000
    ...    cep=69097339
    ...    street=Rua 248
    ...    number=333
    ...    details=Gate1
    ...    district=Nova Cidade
    ...    cityUf=Manaus/AM
    ...    user_id=sample_id.jpeg

    Go to signup page
    Fill signup form    ${user_info}
    fill extra service    expected-text=Cuidar
    Submit form
    Feedback should be   expected-message=Recebemos o seu cadastro e em breve retornaremos o contato.

should signup a new user who do train as sevice
    [Tags]    extraservice

    ${user_info}    Create Dictionary
    ...    name=Steave Rogers
    ...    email=rogers@mail.com
    ...    cpf=00819266000
    ...    cep=69097339
    ...    street=Rua 248
    ...    number=333
    ...    details=Gate1
    ...    district=Nova Cidade
    ...    cityUf=Manaus/AM
    ...    user_id=sample_id.jpeg

    Go to signup page
    Fill signup form    ${user_info}
    fill extra service    expected-text=Adestrar
    Submit form
    Feedback should be   expected-message=Recebemos o seu cadastro e em breve retornaremos o contato.
