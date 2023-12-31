## Requirements

- [Node.js v20.8.0](https://nodejs.org/en/download/)
- [Python 3.12.0](https://www.python.org/downloads/release/python-3120/)
- [Robot Framework](https://robotframework.org/):
  - [Lib Browser](https://github.com/MarketSquare/robotframework-browser)

## Run de project

### Activate v-env

on windows

```bash
python -m venv venv # create venv
venv\Scripts\Activate.ps1

# if has problems on powershell
set-executionpolicy RemoteSigned -Scope CurrentUser
```

on linux/Bash

```bash
python -m venv venv # create venv
source venv/Scripts/activate #bash on wind
source venv/bin/activate
```

### Instalation

with venv active run:

```bash
pip install -r requirements.txt # install project dependencies
rfbrowser init # Lib Browser install playright dependecies
```

### run tests

```bash
  cd web-walkdog/

  # runs full test suit
  # eg. robot -directory <path> <file_path>
  robot -d ./logs tests/signup.robot #Select the file

  # runs specific test by tag
  # eg. robot -directory <path> -i <tags> <file_path>
  robot -d ./logs -i required tests/signup.robot
```
