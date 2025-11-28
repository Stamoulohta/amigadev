# Amiga 68k Development Container

This repository provides a **preconfigured Docker-based development environment** for Amiga 68k projects.
It includes the **vbcc toolchain**, **vasmm68k assembler**, and **vlink linker**, ready to use inside VS Code or any Docker setup.

## Features

- Preinstalled Amiga 68k toolchain (vbcc, vasmm68k, vlink)
- Reproducible environment with Docker + docker-compose
- Ready for use in VS Code devcontainers

## Usage
You can include this devcontainer inside your Amiga project repo as a submodule:
- Add the submodule
  ```
  git submodule add https://github.com/Stamoulohta/amigadev.git .dev
  git submodule update --init --recursive
  ```
- Build the container
  ```
  cd dev
  make build
  ```
- Compile inside the container
  ```
  vc +aos68k src.c -o out
  ```

## Licence
MIT
