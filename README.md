# mirror-uutils

OCX mirror for [uutils](https://github.com/uutils) tooling. One repository, one
spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [coreutils](https://github.com/uutils/coreutils) | [`coreutils/mirror.yml`](coreutils/mirror.yml) | `ghcr.io/ocx-contrib/uutils/coreutils` | [`ocx.sh/uutils/coreutils`](https://index.ocx.sh/uutils/coreutils) | `MIT` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index. The `uutils` org is the project's own
brand and will hold further packages (findutils, diffutils), so it names the
namespace.

## Layout

```
coreutils/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

There is deliberately no `mirror-base.yml` / `extends:` while the repo holds one
package (`extends:` is a shallow merge that silently drops `containers:` when a
child restates `platforms:`).

## What is on PATH

Only `coreutils` — the multicall binary (`coreutils ls`, `coreutils sort`, …).
Upstream's x86_64 Windows archive additionally ships ~85 per-utility `.exe`
copies that would shadow host tools (`link.exe`, `sort.exe`, `timeout.exe`, …);
the spec cannot filter archive files, so **windows/amd64 is not mirrored**. See
the comments in [`coreutils/mirror.yml`](coreutils/mirror.yml).

## Editing

Edit the spec, then regenerate CI naming **every** spec (the generated
workflows are never hand-edited; `verify-generated.yml` fails on drift):

```sh
ocx-mirror package validate coreutils/mirror.yml
ocx-mirror package pipeline generate ci --spec coreutils/mirror.yml
```

Pushes go straight to `main`.
