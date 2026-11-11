# findertags

A Swift CLI that reads, writes, adds, removes, clears, and counts Finder tags. It ships through `aayush9029/tap`. Status: shipped.

## Commands

| Task | Command |
|------|---------|
| Build | `swift build` |
| Test | `swift test` |
| Universal release archive | `scripts/package-universal.sh v<version>` |

## Architecture

- `Sources/findertags/Commands` holds one argument-parser command per action.
- `Sources/findertags/Core/FinderTagStore.swift` reads and writes the tags. `OutputFormatter.swift` prints text or JSON (`--format json`).

## Rules

- The tap formula installs a prebuilt binary from the GitHub release. Run `scripts/package-universal.sh v<version>`, attach `dist/findertags-<version>-universal-macos.tar.gz` to the release, and put its SHA-256 in the formula.
- Change `AppVersion.current` in `Sources/findertags/Core/AppVersion.swift` before you tag.
