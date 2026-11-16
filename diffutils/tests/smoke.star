# diffutils/tests/smoke.star — asserts behaviour on hermetic input, never
# help/version prose (0.5.0/0.6.0 have no working --version).
#
# Only the multicall `diffutils` is on PATH by design; every check goes
# through `diffutils diff …` / `diffutils cmp …`.

TOOL = "diffutils.exe" if ocx.target_platform.os == ocx.os.Windows else "diffutils"

ocx.write_file("a.txt", "one\ntwo\nthree\n")
ocx.write_file("b.txt", "one\n2\nthree\n")

# Identical input: exit 0, no output.
r_same = ocx.run(TOOL, "diff", "a.txt", "a.txt")
expect.ok(r_same)
expect.eq(r_same.stdout, "")

# Differing input: exit 1 (not an error), and the changed lines are reported.
r_diff = ocx.run(TOOL, "diff", "-u", "a.txt", "b.txt")
expect.eq(r_diff.exit_code, 1)
out = r_diff.stdout.replace("\r\n", "\n")
expect.matches(out, r"(?m)^-two$")
expect.matches(out, r"(?m)^\+2$")

# cmp: identical -> 0, differing -> 1.
expect.ok(ocx.run(TOOL, "cmp", "a.txt", "a.txt"))
expect.eq(ocx.run(TOOL, "cmp", "a.txt", "b.txt").exit_code, 1)
