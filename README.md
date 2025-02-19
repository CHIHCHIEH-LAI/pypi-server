# PyPI Server

## Poetry Env

1. Set virtual environments to be created inside the project

```sh
poetry config virtualenvs.in-project true
```

1. Prefer the active Python interpreter for virtual environments

```sh
poetry config virtualenvs.prefer-active-python true
```

1. Set the local Python version

```sh
pyenv local 3.9.13
```

1. Initialize a new Poetry project

```sh
poetry init
```

1. Activate the Poetry virtual environment

```sh
poetry shell
```

## PyPI Package

### Upload a Custom Package to the PyPI server

1. Configure a custom package repository

```sh
poetry config repositories.local http://127.0.0.1:6666/
```

1. Publish a package to the custom repository

```sh
poetry publish --build -r local
```

### Install a Custom Package from the PyPI server

1. Add a custom package source

```sh
poetry source add local http://127.0.0.1:6666
```

1. Install a package from the custom source

```sh
poetry add test_pkg@0.1.0 --source local
```

## PyPI Package Server

1. Create a S3 bucket to store the PyPI packages
2. Create an IAM user with S3 access
3. Clone the PyPI-Server project
4. Create a `.passwd-s3fs` file to store the IAM user’s credentials

```sh
echo ACCESS_KEY_ID:SECRET_ACCESS_KEY > .passwd-s3fs
```

5. Build a docker image for the PyPI server

```sh
docker build -t pypi-server:0.1.0 .
```

6. Run a docker container to start a PyPI server

```sh
./run_container.sh
```
