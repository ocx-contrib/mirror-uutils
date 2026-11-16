# sed/tests/smoke.star — stable across uutils/sed releases.
# Asserts the contract (version shape, computed results on hermetic input),
# never help/version prose. stdin goes through `-` (a piped empty stdin would
# otherwise be preferred over a file arg).

TOOL = "sed.exe" if ocx.target_platform.os == ocx.os.Windows else "sed"

r_version = ocx.run(TOOL, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# Substitution on stdin.
r_sub = ocx.run(TOOL, "s/a/b/", "-", stdin="banana\n")
expect.ok(r_sub)
expect.eq(r_sub.stdout.replace("\r\n", "\n"), "bbnana\n")

# Global flag + file input: every `a` replaced.
ocx.write_file("in.txt", "banana\ncherry\n")
r_g = ocx.run(TOOL, "s/a/X/g", "in.txt")
expect.ok(r_g)
expect.eq(r_g.stdout.replace("\r\n", "\n"), "bXnXnX\ncherry\n")

# -n with an address + p: only line 2 printed.
r_n = ocx.run(TOOL, "-n", "2p", "in.txt")
expect.ok(r_n)
expect.eq(r_n.stdout.replace("\r\n", "\n"), "cherry\n")
