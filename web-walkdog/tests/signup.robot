*** Settings ***
Documentation    test suite sign up page

Library    Browser
Resource    ../resources/base.resource

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
    Get evidence

