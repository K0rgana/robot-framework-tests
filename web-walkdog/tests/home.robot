*** Settings ***
Documentation    suite de teste da home page

Library    Browser

*** Test Cases ***
Home page should be online
    New Browser     browser=firefox    headless=True
    New Page    https://walkdog.vercel.app

    Get Text    h1    equal    Cuidado e diversão em cada passo
    Take Screenshot


