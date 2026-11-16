---
title: uutils sed
description: A cross-platform Rust rewrite of GNU sed — the stream editor for filtering and transforming text
keywords: sed,uutils,gnu,rust,cli,stream-editor,text,regex,substitute
---

# uutils sed

[uutils sed](https://github.com/uutils/sed) is a cross-platform rewrite of GNU
sed in Rust, part of the [uutils](https://uutils.org) project. It aims at a
drop-in replacement for the stream editor that behaves the same on Linux, macOS
and Windows.

## What's included

- **sed** — the stream editor: `sed 's/old/new/g' file.txt`,
  `sed -n '2,4p' file.txt`, `printf 'a\n' | sed 's/a/b/' -`.

The binary is named `sed`, so it shadows any `sed` already on `PATH` for
everything that runs in the same environment.

## Platforms

Linux amd64 (static build that runs on glibc and musl), Linux arm64 (glibc
only — upstream ships no static arm64 build), macOS (amd64, arm64) and Windows
amd64.

The archive also ships upstream's `LICENSE` and `README.md`.
