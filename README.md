# mirror-uutils

OCX mirror for [uutils](https://github.com/uutils) tooling. One repository, one
spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [coreutils](https://github.com/uutils/coreutils) | [`coreutils/mirror.yml`](coreutils/mirror.yml) | `ghcr.io/ocx-contrib/uutils/coreutils` | [`ocx.sh/uutils/coreutils`](https://index.ocx.sh/uutils/coreutils) | `MIT` |
| [findutils](https://github.com/uutils/findutils) | [`findutils/mirror.yml`](findutils/mirror.yml) | `ghcr.io/ocx-contrib/uutils/findutils` | [`ocx.sh/uutils/findutils`](https://index.ocx.sh/uutils/findutils) | `MIT` |
| [diffutils](https://github.com/uutils/diffutils) | [`diffutils/mirror.yml`](diffutils/mirror.yml) | `ghcr.io/ocx-contrib/uutils/diffutils` | [`ocx.sh/uutils/diffutils`](https://index.ocx.sh/uutils/diffutils) | `MIT OR Apache-2.0` |
| [sed](https://github.com/uutils/sed) | [`sed/mirror.yml`](sed/mirror.yml) | `ghcr.io/ocx-contrib/uutils/sed` | [`ocx.sh/uutils/sed`](https://index.ocx.sh/uutils/sed) | `MIT` |
| [grep](https://github.com/uutils/grep) | [`grep/mirror.yml`](grep/mirror.yml) | `ghcr.io/ocx-contrib/uutils/grep` | [`ocx.sh/uutils/grep`](https://index.ocx.sh/uutils/grep) | `MIT` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index. The `uutils` org is the project's own
brand and holds several packages, so it names the namespace.

## Layout

```
<pkg>/   (coreutils, findutils, diffutils, sed, grep)
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

There is deliberately no `mirror-base.yml` / `extends:` (it is a shallow merge that silently drops `containers:` when a
child restates `platforms:`).

## What is on PATH

Only `coreutils` — the multicall binary (`coreutils ls`, `coreutils sort`, …).
Upstream's x86_64 Windows archive additionally ships ~90 per-utility `.exe`
builds that would shadow host tools (`link.exe`, `sort.exe`, `timeout.exe`, …);
the windows/amd64 `asset_type` keeps only `coreutils.exe` via `include:`. See
the comments in [`coreutils/mirror.yml`](coreutils/mirror.yml). Likewise
`diffutils` exposes only its multicall `diffutils` (`diffutils diff`, `diffutils cmp`).

## Editing

Edit the spec, then regenerate CI naming **every** spec (the generated
workflows are never hand-edited; `verify-generated.yml` fails on drift):

```sh
ocx-mirror package validate coreutils/mirror.yml
ocx-mirror package pipeline generate ci --spec coreutils/mirror.yml
```

Pushes go straight to `main`.
