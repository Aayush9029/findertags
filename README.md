# findertags

Read and modify Finder tags from the command line.

## Install

```bash
brew install aayush9029/tap/findertags
```

## Usage

```bash
findertags read ~/Desktop/file.txt                          # read tags
findertags read --verbose ~/Desktop/file.txt                # include paths with no tags
findertags write ~/Desktop/file.txt Work Urgent             # replace all tags
findertags add ~/Desktop/file.txt Client                    # add a tag
findertags remove ~/Desktop/file.txt Urgent                 # remove a tag
findertags clear ~/Desktop/file.txt                         # clear all tags
findertags list ~/Documents                                 # list tag frequencies
findertags read --format json ~/Desktop/file.txt            # JSON output
```

---

*More CLI tools: [`brew tap aayush9029/tap`](https://github.com/Aayush9029/homebrew-tap)*
