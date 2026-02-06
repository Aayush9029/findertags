# findertags

Simple CLI for reading and editing Finder tags on macOS.

## Install

### Homebrew

```bash
brew tap Aayush9029/tap
brew install findertags
```

### From source

```bash
git clone https://github.com/Aayush9029/findertags.git
cd findertags
swift build -c release
cp .build/release/findertags /usr/local/bin/
```

## Usage

```bash
# Read tags (only paths with tags by default)
findertags read ~/Desktop/file.txt

# Include empty paths
findertags read --verbose ~/Desktop/file.txt ~/Desktop/other.txt

# Replace tags
findertags write ~/Desktop/file.txt Work Urgent

# Add / remove / clear
findertags add ~/Desktop/file.txt Client
findertags remove ~/Desktop/file.txt Urgent
findertags clear ~/Desktop/file.txt

# List tag frequencies across paths
findertags list ~/Desktop/file.txt ~/Desktop/other.txt

# JSON output
findertags read --format json ~/Desktop/file.txt
```

## Development

```bash
swift build
swift test
```

## Release packaging

```bash
./scripts/package-universal.sh v0.1.0
```

Creates a universal macOS tarball and prints the SHA256 for Homebrew formula updates.

## License

MIT
