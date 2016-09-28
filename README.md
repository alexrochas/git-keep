# Git-Keep
> A more intuitive way to hold changes that are not ready to commit

## What is this?
These are git subcommands that aim to add productivity and safety to your work with versioning.

## Installation:

Clone this project
```
~$ git clone git@github.com:alexrochas/hold_git.git
```

Add this folder project to your PATH environment (.environment/.profile/.bashrc/.zshrc, choose your poison)
```
export PATH=$PATH:<path_to_project>/hold_git
```

## Usage

Now you should have two more commands on your git

**git keep**
```shell
~$ git keep -m "short description" #will get all your unstaged files and add them to a new local branch with your description
```

**git give-back**
```shell
~$ git give-back <branch_name> #will return previously unstaged files to an unstaged state and delete created branch
```

## How to contribute
Open a pull request/issue or fork this repo and submit your changes via a pull request.

## Release History

* 0.0.1
    * Basic scripts
* 0.0.2
    * Git subcommand

## Meta

Alex Rocha - [about.me](http://about.me/alex.rochas)
