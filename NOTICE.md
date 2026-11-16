# NOTICE

This repository packages and redistributes upstream software published by the
[uutils](https://github.com/uutils) project. The Apache-2.0 license in
[`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It does
**not** cover any upstream-derived asset — each package's redistributed bytes
carry their own license, recorded below.

Each package's logo reproduces the **upstream project's own mark** (taken from
the upstream repository's `docs/src/logo.svg`), unmodified apart from scaling,
solely to identify the software being mirrored. No endorsement or affiliation
is implied, and no trademark right is claimed.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `coreutils` | `ghcr.io/ocx-contrib/uutils/coreutils` | `MIT` |
| `findutils` | `ghcr.io/ocx-contrib/uutils/findutils` | `MIT` |
| `diffutils` | `ghcr.io/ocx-contrib/uutils/diffutils` | `MIT OR Apache-2.0` |
| `sed` | `ghcr.io/ocx-contrib/uutils/sed` | `MIT` |
| `grep` | `ghcr.io/ocx-contrib/uutils/grep` | `MIT` |

---

## `coreutils`

Upstream: <https://github.com/uutils/coreutils>
Published to `ghcr.io/ocx-contrib/uutils/coreutils`.

| Component | SPDX | Holder |
|---|---|---|
| uutils coreutils (`coreutils`) | **MIT** | Copyright (c) uutils developers |

Verified with `gh api repos/uutils/coreutils/license --jq .license.spdx_id`,
which answers `MIT`, and against the `LICENSE` file at the repository root.

The MIT license grants redistribution in source and object form on the single
condition that the copyright and permission notice accompany copies. That
condition is met by construction: upstream's `LICENSE` ships **inside every
mirrored archive** beside the binary and is republished unmodified as part of
the bundle content. No upstream artifact is modified; archives are republished
byte-for-byte inside an OCX bundle.

---

## `findutils`

Upstream: <https://github.com/uutils/findutils>
Published to `ghcr.io/ocx-contrib/uutils/findutils`.

| Component | SPDX | Holder |
|---|---|---|
| uutils findutils (`find`, `xargs`, `locate`, `updatedb`) | **MIT** | Copyright (c) uutils developers |

Verified with `gh api repos/uutils/findutils/license --jq .license.spdx_id`,
which answers `MIT`.

---

## `diffutils`

Upstream: <https://github.com/uutils/diffutils>
Published to `ghcr.io/ocx-contrib/uutils/diffutils`.

| Component | SPDX | Holder |
|---|---|---|
| uutils diffutils (`diffutils`) | **MIT OR Apache-2.0** | Copyright (c) uutils developers |

Verified against `Cargo.toml` (`license = "MIT OR Apache-2.0"`) and the
`LICENSE-APACHE` / `LICENSE-MIT` files at the repository root; the GitHub
license API reports `Apache-2.0` (it picks one of the two).

---

## `sed`

Upstream: <https://github.com/uutils/sed>
Published to `ghcr.io/ocx-contrib/uutils/sed`.

| Component | SPDX | Holder |
|---|---|---|
| uutils sed (`sed`) | **MIT** | Copyright (c) 2025 Diomidis Spinellis |

Verified with `gh api repos/uutils/sed/license --jq .license.spdx_id`,
which answers `MIT`, and against the `LICENSE` file shipped in every archive
(copyright holder as stated there). The MIT license grants redistribution on the
single condition that the copyright and permission notice accompany copies;
upstream's `LICENSE` ships inside every mirrored archive beside the binary and
is republished unmodified. No upstream artifact is modified.

---

## `grep`

Upstream: <https://github.com/uutils/grep>
Published to `ghcr.io/ocx-contrib/uutils/grep`.

| Component | SPDX | Holder |
|---|---|---|
| uutils grep (`grep`) | **MIT** | Copyright (c) uutils developers |

Verified with `gh api repos/uutils/grep/license --jq .license.spdx_id`, which
answers `MIT`. Upstream's `LICENSE` ships inside every mirrored archive beside
the binary and is republished unmodified in the bundle.
