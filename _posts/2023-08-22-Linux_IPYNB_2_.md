---
comments: True
title: Linux and Bash Hacks
description: Hacks for Linux and Bash
layout: post
ccourses: {'csa': {'week': 0}}
type: hacks
---

```bash
#!/bin/bash

# Check if Bash is installed
if command -v bash &> /dev/null; then
    echo "Bash is installed."
else
    echo "Bash is not installed."
fi

# Check if GitHub is installed
if command -v git &> /dev/null; then
    echo "GitHub is installed."
else
    echo "GitHub is not installed."
fi

# Check if VSCode is installed
if command -v code &> /dev/null; then
    echo "VSCode is installed."
else
    echo "VSCode is not installed."
fi

# Check if Jupyter Notebook is installed
if command -v jupyter &> /dev/null; then
    echo "Jupyter Notebook is installed."
else
    echo "Jupyter Notebook is not installed."
fi

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo "Docker is installed."
else
    echo "Docker is not installed."
fi

# Check if Linux is running
if [[ "$(uname)" == "Linux" ]]; then
    echo "Linux is running."
else
    echo "Linux is not running."
fi

```

    Bash is installed.
    GitHub is installed.
    VSCode is installed.
    Jupyter Notebook is installed.
    Docker is installed.
    Linux is running.


> ## Frequent Linux Commands
>> Name and create blog notes on some Linux commands you will use frequently.

>> 1. `ls` - Lists directory contents 
>> 2. `cd` - Changes directory 
>> 3. `mkdir` - Makes a new directory
>> 4. `rm` - Is used to remove - can remove directories, files, folders - depending on what follows it (i.e. `rm -rf`)
>> 5. `sudo` - Gives authority to perform certain tasks
>> 6. `cp` - Copies files and directories; can also be used to create duplicate of files
>> 7. `mv` - Moves files and directories and renames them

---

> ## Verify tools
>> Is there anything we use to verify tools we installed? Review versions?

>>>> For reviewing versions, most of the time we can use the `--version` command. For example, `git --version` will give the version of git installed. This also verifies that you have downloaded the tool.

---

> ## Update repository
>> How would you update a repository? Use the git command line?

>>>> You can update a repository through the `git pull` command. If you do `git pull origin ...` then you are updating your repo with the latest changes from the remote repository. 
