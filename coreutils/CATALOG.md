---
title: uutils coreutils
description: A cross-platform Rust rewrite of the GNU coreutils — ls, cat, sort, wc, sha256sum and ~100 more as one multicall binary
keywords: coreutils,uutils,gnu,rust,cli,posix,ls,cat,sort,multicall
---

# uutils coreutils

[uutils coreutils](https://uutils.org) is a cross-platform rewrite of the GNU
coreutils in Rust. All utilities are compiled into one multicall binary,
`coreutils`, so the same commands behave the same on Linux, macOS and Windows.

## What's included

- **coreutils** — the multicall binary. Invoke a utility by name as the first
  argument: `coreutils ls -l`, `coreutils sort -u names.txt`,
  `coreutils sha256sum release.tar.gz`. `coreutils --list` prints every
  available utility.

## What is on PATH

On Linux, macOS and Windows arm64 only `coreutils` is exposed; call the
utilities through it (`coreutils ls`, `coreutils sort`, …).

On Windows amd64 upstream also ships every utility as its own `.exe`
(`ls.exe`, `sort.exe`, `link.exe`, `timeout.exe`, …), and all of them are on
`PATH`. They take precedence over same-named Windows and MSVC tools while the
package is active.

## Platforms

Linux (amd64, arm64; static builds that run on glibc and musl), macOS (amd64,
arm64) and Windows (amd64, arm64).

The archive also ships upstream's `LICENSE` and `README.md`.
