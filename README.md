# findertags

Read and modify Finder tags from the command line.

## Install

```bash
brew install aayush9029/tap/findertags
```

## Usage

```bash
# Read tags
findertags read ~/Desktop/file.txt

# Include paths with no tags
findertags read --verbose ~/Desktop/file.txt ~/Desktop/other.txt

# Replace all tags on a file
findertags write ~/Desktop/file.txt Work Urgent

# Add / remove / clear
findertags add ~/Desktop/file.txt Client
findertags remove ~/Desktop/file.txt Urgent
findertags clear ~/Desktop/file.txt

# List tag frequencies
findertags list ~/Desktop/file.txt ~/Desktop/other.txt

# JSON output
findertags read --format json ~/Desktop/file.txt
```
