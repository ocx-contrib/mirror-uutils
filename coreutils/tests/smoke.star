# coreutils/tests/smoke.star — stable across uutils releases.
# Asserts the contract (version shape, the multicall utility list, computed
# results on hermetic input), never help/version prose.
#
# Only the multicall `coreutils` is on PATH by design; every check below goes
# through `coreutils <utility> …`, never a bare `sort`/`wc`.

TOOL = "coreutils.exe" if ocx.target_platform.os == ocx.os.Windows else "coreutils"

# ── Tier 1 + 2: liveness + version SHAPE ────────────────────────────────────
# `coreutils --version` is rejected by 0.1.x/0.2.x ("function/utility not
# found", exit 1) and answered from 0.3.0 on; `coreutils <util> --version`
# works across the whole range, so ask a utility.
r_version = ocx.run(TOOL, "sort", "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# ── The multicall table is intact (utility NAMES are the contract) ──────────
r_list = ocx.run(TOOL, "--list")
expect.ok(r_list)
expect.matches(r_list.stdout, r"(?m)^sort$")
expect.matches(r_list.stdout, r"(?m)^wc$")
expect.matches(r_list.stdout, r"(?m)^sha256sum$")

# ── Tier 3: computed results on hermetic input ──────────────────────────────
# Inputs have no trailing-newline surprises: written exactly as given.
ocx.write_file("in.txt", "pear\napple\ncherry\napple\n")

# sort -u: ordering AND dedup — neither is true of the input.
r_sort = ocx.run(TOOL, "sort", "-u", "in.txt")
expect.ok(r_sort)
expect.eq(r_sort.stdout.replace("\r\n", "\n"), "apple\ncherry\npear\n")

# wc -l counts newlines: 4 in the input.
r_wc = ocx.run(TOOL, "wc", "-l", "in.txt")
expect.ok(r_wc)
expect.matches(r_wc.stdout, r"^\s*4\b")

# sha256("abc") is a published test vector; the file has no newline.
ocx.write_file("abc.txt", "abc")
r_sha = ocx.run(TOOL, "sha256sum", "abc.txt")
expect.ok(r_sha)
expect.contains(r_sha.stdout, "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")

# stdin path through a second utility: tr maps a-z to A-Z.
r_tr = ocx.run(TOOL, "tr", "a-z", "A-Z", stdin="ocx\n")
expect.ok(r_tr)
expect.eq(r_tr.stdout.replace("\r\n", "\n"), "OCX\n")
