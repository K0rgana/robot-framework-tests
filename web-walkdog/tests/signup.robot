*** Settings ***
Documentation    test suite sign up page

Library    Browser
Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

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
