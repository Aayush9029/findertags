<p align="center">
  <img src="assets/icon.png" width="128" alt="findertags">
  <h1 align="center">findertags</h1>
  <p align="center">Read and modify Finder tags from the command line</p>
</p>

<p align="center">
  <a href="https://github.com/Aayush9029/findertags/releases/latest"><img src="https://img.shields.io/github/v/release/Aayush9029/findertags" alt="Release"></a>
  <a href="https://github.com/Aayush9029/findertags/blob/main/LICENSE"><img src="https://img.shields.io/github/license/Aayush9029/findertags" alt="License"></a>
</p>

<p align="center">
  <img src="assets/demo.gif" alt="findertags demo" width="800">
</p>

## Install

```bash
brew install aayush9029/tap/findertags
```

Or tap first:

```bash
brew tap aayush9029/tap
brew install findertags
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

## License

MIT
