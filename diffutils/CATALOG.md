---
title: uutils diffutils
description: A cross-platform Rust rewrite of GNU diffutils — diff and cmp as one multicall binary
keywords: diffutils,uutils,diff,cmp,patch,rust,cli,multicall
---

# uutils diffutils

[uutils diffutils](https://github.com/uutils/diffutils) is a cross-platform
rewrite of GNU `diff` and `cmp` in Rust, built as one multicall binary,
`diffutils`.

## What's included

- **diffutils** — the multicall binary. Invoke a utility by name as the first
  argument: `diffutils diff -u old.txt new.txt`, `diffutils cmp a.bin b.bin`.

## Per-utility names are deliberately not on PATH

Only `diffutils` is exposed. Bare `diff` and `cmp` are **not** put on `PATH`,
because they would shadow the host's own tools for everything that runs in the
same environment. Call them through `diffutils`, or alias them yourself.

## Platforms

Linux (amd64, arm64; dynamically linked against glibc, so musl hosts such as
Alpine are not supported), macOS (amd64, arm64) and Windows amd64. Upstream
ships no Windows arm64 build. Releases before 0.5.0 are a single-purpose
diff tool without the `diff`/`cmp` subcommands and are not mirrored.

The archive also ships upstream's `LICENSE-APACHE` and `LICENSE-MIT`
(dual-licensed) and `README.md`.
