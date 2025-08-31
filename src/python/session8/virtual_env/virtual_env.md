# virtual environment

A virtual environment (venv) is used to keep project-specific dependencies isolated,
so libraries from one project don’t conflict with another.


[//]: # (How to create vir env)
`python -m venv vde1`

[//]: # (how to activate vir env)
`.\vde1\Scripts\activate`

[//]: # (how to deactivate vir env)
`deactivate`


[//]: # (How to collect all packages, which installed in your env)

first activate your env ( .\venv\Scripts\activate)
`pip freeze > requirements.txt`

**we can use this requirement to setup new env**
`pip install -r requirements.txt`
