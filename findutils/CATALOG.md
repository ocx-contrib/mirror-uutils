---
title: uutils findutils
description: A cross-platform Rust rewrite of GNU findutils — find, xargs, locate and updatedb
keywords: findutils,uutils,find,xargs,locate,updatedb,gnu,rust,cli,posix
---

# uutils findutils

[uutils findutils](https://github.com/uutils/findutils) is a cross-platform
rewrite of the GNU findutils in Rust, aiming to be a drop-in replacement.

## What's included

- **find** — search a directory tree by name, type, size, time and more, and
  act on the matches.
- **xargs** — build and run command lines from standard input.
- **locate** — query a file-name database.
- **updatedb** — build the database `locate` reads.

Binaries are static on Linux, so they run on glibc and musl hosts alike.

## Links

- Upstream: <https://github.com/uutils/findutils>
- License: MIT
