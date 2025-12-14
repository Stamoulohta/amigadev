# Amiga 68k Development Container

This repository provides a **preconfigured Docker-based development environment** for Amiga 68k projects.
It includes the **vbcc toolchain**, **vasmm68k assembler**, and **vlink linker**, ready to use inside VS Code or any Docker setup.

## Features

- Preinstalled Amiga 68k toolchain (vbcc, vasmm68k, vlink, EVO Amiga E compiler)
- Reproducible environment with Docker + docker-compose
- Ready for use in VS Code devcontainers

## Usage
You can include this devcontainer inside your Amiga project repo as a submodule:
- Add the submodule
  ```
  git submodule add https://github.com/Stamoulohta/amigadev.git .dev
  git submodule update --init --recursive
  ```
- Optionally include entries to your env
  ```
    DEVUID=1000
    DEVGID=1000
    DEVNAME=developer

    WORKSPACE=./src
  ```
- Build and start the container
  ```
  cd .dev
  make build
  make up
  ```
- Compile inside the container
  ```
  make dev
  vc +aos68k src.c -o out
  evo source.e -o out
  ```

## Licence
MIT
