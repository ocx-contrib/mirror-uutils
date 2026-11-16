# grep/tests/smoke.star — asserts behaviour on hermetic input, never help prose.

TOOL = "grep.exe" if ocx.target_platform.os == ocx.os.Windows else "grep"

# Liveness + version SHAPE.
r_version = ocx.run(TOOL, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

ocx.write_file("in.txt", "pear\napple\ncherry\napple pie\n")

# Plain match: selects only matching lines.
r_plain = ocx.run(TOOL, "apple", "in.txt")
expect.ok(r_plain)
expect.eq(r_plain.stdout.replace("\r\n", "\n"), "apple\napple pie\n")

# -c counts, -v inverts, -n numbers.
r_count = ocx.run(TOOL, "-c", "apple", "in.txt")
expect.ok(r_count)
expect.matches(r_count.stdout, r"^\s*2\b")

r_inv = ocx.run(TOOL, "-v", "-n", "apple", "in.txt")
expect.ok(r_inv)
expect.eq(r_inv.stdout.replace("\r\n", "\n"), "1:pear\n3:cherry\n")

# Regex: anchored alternation (-E).
r_re = ocx.run(TOOL, "-E", "^(pear|cherry)$", "in.txt")
expect.ok(r_re)
expect.eq(r_re.stdout.replace("\r\n", "\n"), "pear\ncherry\n")

# stdin path via `-` (an empty-string pipe trap is avoided by real content).
r_stdin = ocx.run(TOOL, "-o", "b[a-z]*", "-", stdin="foo bar baz\n")
expect.ok(r_stdin)
expect.eq(r_stdin.stdout.replace("\r\n", "\n"), "bar\nbaz\n")
