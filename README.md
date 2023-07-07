# Dev Container for .NET
Development environment for .NET

## Prerequisites
- An IDE Tool,  
    - [Visual Studio Code](https://code.visualstudio.com/download) - preferred by @sakiv
- A Git client ([Git Bash for Windows](https://git-scm.com/downloads))
- [Docker Engine](https://docs.docker.com/engine/install/)
    - Docker Desktop (free for personal use) 
    - Standalone Docker Engine (works well with Colima)

*Note: If you are using VS Code then I highly recommended [VS Code Docker extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) to manage docker images and containers*

## Usage:

- If you are starting fresh, clone git repository
    ```zsh
    git clone https://github.com/sakiv/devcontainer-dotnet.git
    ```

- If you already have a C# code, then go to your C# project directory and pull this repository
    ```zsh
    git pull --ff --allow-unrelated-histories https://github.com/sakiv/devcontainer-dotnet.git
    ```
    *Note: you may require to fix the conflicts during merge.*

- Add necessary environment variables in local.env
    ```ini
    POSTGRESS_UID=********
    POSTGRESS_PWD=********
    ```

- Build docker image
    ```zsh
    docker compose build
    ```

- Build docker image and spin off a new container
    ```zsh
    docker compose up
    ```

- By default this image builds with .NET Core 7.0, to change to your preferred version, pass DOTNET_VERSION environement variable to `docker-compose` command
    ```zsh
    DOTNET_VERSION=7.0 docker compose build
    ```

- Create new container from existing image and workspace from host machine directory
    ```zsh
    docker run -dit --env-file local.env --mount type=bind,source="$(pwd)",target=/workspace --name="$(basename $PWD)" devcontainer-dotnet:latest
    ```

- Build multi platform image and publish
    ```zsh
    docker buildx create --use

    docker buildx build --platform linux/amd64,linux/arm64 --build-arg DOTNET_VERSION=7.0 --tag sakiv77/devcontainer-dotnet:7.0 --tag sakiv77/devcontainer-dotnet:latest --push .
    ```

*Note: I recommend using VS Code Docker extension to manage docker images and containers. But if you are using another IDE and need to use Docker CLI then refer to (Docker CLI documentation)[https://docs.docker.com/engine/reference/commandline/cli/]*

## VS Code Instructions

- Install the `C# Dev Kit` extension
- Install the `Remote - Containers` extension
- Open the `Command Palette` and type `Dev Containers`, then select the `Dev Containers: Attach to Running Container...` and select the running docker container
- VS Code will restart and reload
- On the `Explorer` sidebar, click the open a folder button and then enter `/workspace` (this will be loaded from the remote container)
- On the `Extensions` sidebar, select the `C# Dev Kit` extension and install it on the container




