*** Settings ***
Documentation    main file of resources

Library    Browser

Resource   env.resource
Resource   actions/signup.resource

*** Keywords ***
Start session
    New Browser     browser=${BROWSER}    headless=True
    New Page        url=${BASE_URL}

    Wait For Elements State
    ...    selector=css=h1 >> text=Cuidado e diversão em cada passo
    ...    state= visible
    ...    timeout=5

Finish session
    Sleep    time_=1
    Take Screenshot    fullPage=True