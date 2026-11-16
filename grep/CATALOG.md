---
title: uutils grep
description: A cross-platform Rust implementation of GNU grep
keywords: grep,uutils,gnu,rust,cli,regex,search,posix
---

# uutils grep

[uutils grep](https://github.com/uutils/grep) is a cross-platform
implementation of GNU grep in Rust, from the uutils project, behaving the same
on Linux, macOS and Windows.

## What's included

- **grep** — the executable, under its upstream name.

## Shadows the host grep

The binary is named `grep` and is put on `PATH` as such, so inside an
environment that includes this package it takes precedence over the system
`grep`.

## Platforms

Linux (amd64, arm64; glibc 2.34 or newer), macOS (amd64, arm64) and Windows
amd64. Upstream publishes no musl or static Linux build and no Windows arm64
build.

The archive also ships upstream's `LICENSE` and `README.md`.
