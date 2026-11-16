# findutils/tests/smoke.star — asserts behaviour and version SHAPE, never prose.

WIN = ocx.target_platform.os == ocx.os.Windows
FIND = "find.exe" if WIN else "find"
XARGS = "xargs.exe" if WIN else "xargs"

r_version = ocx.run(FIND, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# find lists a file it was given, by name.
ocx.write_file("needle.txt", "x")
ocx.write_file("other.log", "y")
r_find = ocx.run(FIND, ".", "-type", "f", "-name", "*.txt")
expect.ok(r_find)
expect.contains(r_find.stdout, "needle.txt")
expect.eq(r_find.stdout.count("other.log"), 0)

# xargs turns stdin tokens into arguments of the command it runs.
r_xargs = ocx.run(XARGS, "-n", "1", "echo", stdin="a b\n")
expect.ok(r_xargs)
expect.eq(r_xargs.stdout.replace("\r\n", "\n"), "a\nb\n")
