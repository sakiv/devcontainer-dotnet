# Dev Container for .NET
Development environment for python

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
    ```
    git clone https://github.com/sakiv/devcontainer-dotnet.git
    ```

- If you already have a C# code, then go to your C# project directory and pull this repository
    ```
    git pull --ff --allow-unrelated-histories https://github.com/sakiv/devcontainer-dotnet.git
    ```
    *Note: you may require to fix the conflicts during merge.*

- Add necessary environment variables in local.env
    ```
    POSTGRESS_UID=********
    POSTGRESS_PWD=********
    ```

- Build docker image
    ```
    docker compose build
    ```

- Build docker image and spin off a new container
    ```
    docker compose up
    ```

- Create new container from existing image and workspace from host machine directory
    ```
    docker run -dit --env-file local.env --mount type=bind,source="$(pwd)",target=/workspace --name="$(basename $PWD)" devcontainer-dotnet:latest
    ```

- Build multi platform image and publish
    ```
    docker buildx create --use

    docker buildx build --platform linux/amd64,linux/arm64 -t sakiv77/devcontainer-dotnet:latest --push .
    ```

*Note: I recommend using VS Code Docker extension to manage docker images and containers. But if you are using another IDE and need to use Docker CLI then refer to (Docker CLI documentation)[https://docs.docker.com/engine/reference/commandline/cli/]*

## VS Code Instructions

- Install the `C# Dev Kit` extension
- Install the `Remote - Containers` extension
- Open the `Command Palette` and type `Dev Containers`, then select the `Dev Containers: Attach to Running Container...` and select the running docker container
- VS Code will restart and reload
- On the `Explorer` sidebar, click the open a folder button and then enter `/workspace` (this will be loaded from the remote container)
- On the `Extensions` sidebar, select the `C# Dev Kit` extension and install it on the container




