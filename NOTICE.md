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
