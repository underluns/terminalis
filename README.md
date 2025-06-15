[![workflow](https://github.com/underluns/terminalis/actions/workflows/ci.yml/badge.svg)](https://github.com/underluns/terminalis/actions)
[![pipeline](https://gitlab.com/underluns/terminalis/badges/master/pipeline.svg)](https://gitlab.com/underluns/terminalis/-/pipelines)
[![coverage](https://gitlab.com/underluns/terminalis/badges/master/coverage.svg)](https://gitlab.com/underluns/terminalis/-/commits)

# terminalis

This is a shell script [terminalis.sh](./lib/terminalis.sh)

It extends the system console and adds several useful [features](#features) for developers

## Contents

* [Requirements](#requirements)
* [Installation](#installation)
* [Features](#features)
* [Usage](#usage)
* [Testing](#testing)
* [Changelog](#changelog)
* [License](#license)

## Requirements

This project depends on and/or uses third-party software:
* unix-like operating system:
    * [ubuntu](https://ubuntu.com) or [macos](https://www.apple.com/macos)
* shell command-line interpreter:
    * [bash](https://www.gnu.org/software/bash) or [zsh](https://www.zsh.org)
* version-control software:
    * [git](https://git-scm.com)

Correct installation and usage is guaranteed only if the specified dependencies are met

## Installation

Download this project repository to any folder of your choice, for example to `~/.sh/`, by executing commands:
```sh
git clone https://gitlab.com/underluns/terminalis.git ~/.sh/terminalis
```

And then add the following lines to your shell configuration file `~/.bashrc` or `~/.zshrc`:
```sh
. ${TERMINALIS_ROOT:=~/.sh/terminalis}/install.sh
```
Now you have all the features of the terminalis

## Features

The features for this project will be described in this section

## Usage

The use cases for this project will be described in this section

## Testing

This project's checks are integrated with [GitLab СI/CD](https://gitlab.com/underluns/terminalis/-/pipelines) and [GitHub Actions](https://github.com/underluns/terminalis/actions)

## Changelog

This project's changelog is available in [./CHANGELOG.md](./CHANGELOG.md)

## License

This project is licensed under [./LICENSE.txt](./LICENSE.txt)
