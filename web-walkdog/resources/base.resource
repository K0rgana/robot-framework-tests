*** Settings ***
Documentation    main file of resources

Library    Browser

Resource   actions/signup.resource

*** Keywords ***
Start session
    New Browser     browser=firefox    headless=True
    New Page        url=https://walkdog.vercel.app

    Wait For Elements State
    ...    selector=css=h1 >> text=Cuidado e diversão em cada passo
    ...    state= visible
    ...    timeout=5

Finish session
    Sleep    time_=1
    Take Screenshot    fullPage=True