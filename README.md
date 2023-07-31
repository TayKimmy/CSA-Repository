## Blog site using GitHub Pages and Jekyll
> This site is intended for Students.   This is to record plans, complete hacks, and do work for your learnings.
- This can be customized to support computer science as you work through pathway (JavaScript, Python/Flask, Java/Spring)
- All tangible artifact work is in a _posts or in a _notebooks.  
- Front matter (aka meta data) in ipynb and md files is used to organize information according to week and column in running web site.

## GitHub Pages
All `GitHub Pages` websites are managed on GitHub infrastructure. GitHub uses `Jekyll` to tranform your content into static websites and blogs. Each time we change files in GitHub it initiates a GitHub Action that rebuilds and publishes the site with Jekyll.  
- GitHub Pages is powered by: [Jekyll](https://jekyllrb.com/).
- Publised teacher website: [nighthawkcoders.github.io/teacher](https://nighthawkcoders.github.io/teacher/)

## Preparing a Preview Site 
In all development, it is recommended to test your code before deployment.  The GitHub Pages development process is optimized by testing your development on your local machine, prior to files on GitHub

Development Cycle. For GitHub pages, the tooling described below will create a development cycle  `make-code-save-preview`.  In the development cycle, it is a requirement to preview work locally, prior to doing a VSCode `commit` to git.

Deployment Cycle.  In the deplopyment cycle, `sync-github-action-review`, it is a requirement to complete the development cycle prior to doing a VSCode `sync`.  The sync triggers github repository update.  The action starts the jekyll build to publish the website.  Any step can have errors and will require you to do a review.

### WSL and/or Ubuntu installation requirements
- The result of these step is Ubuntu tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/ubuntu/)
```bash
# ruby
# WSL/Ubuntu commands
#
# install Ruby for WSL
# sudo apt install. installs packages for Ubuntu
sudo apt install ruby-full build-essential zlib1g-dev
# the following "echo" commands adds gems installation directory into the .bashrc file, avoiding root requirements
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
#
# install conda for WSL Ubuntu
wget -q https://repo.anaconda.com/miniconda/wget -q Miniconda3-latest-Linux-x86.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p $HOME/miniconda
# Configure ruby into shell
conda init bash
#
# source the .bashrc file or relanuch terminal
source ~/.bashrc
# update conda
conda update -n base -y -c defaults conda
conda install -y -c conda-forge pyyam
# install jekyll and bundler
gem install jekyll bundler
```

### MacOs installation requirements 
- Ihe result of these step are MacOS tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/macos/)
```bash
# ruby
# MacOS commands
#
# Install Ruby for MacOS
brew install chruby ruby-install xz
ruby-install ruby 3.1.3
# Configure ruby into shell using .zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
#
# install conda for MacOS
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p $HOME/miniconda
# Configure ruby into shell
conda init zsh

#
# source the .zshrc file or relanuch terminal
source ~/.zshrc
#
# update conda
conda update -n base -y -c defaults conda
conda install -y -c conda-forge pyyam
# install jekyll
gem install jekyll bundler
```

### Preview
- The result of these step is server running on: http://0.0.0.0:4100/teacher/.  Regeneration messages will run in terminal on any save.  Press the Enter or Return key in the terminal at any time to enter commands.

- Complete installation
```bash
bundle install
```
- Run Server.  This requires running terminal commands `make`, `make stop`, `make clean`, or `make convert` to manage the running server.  Logging of details will appear in terminal.   A `Makefile` has been created in project to support commands and start processes.

    - Start preview server in terminal
    ```bash
    cd ~/vscode/teacher  # my project location, adapt as necessary
    make
    ```

    - Terminal output of shows server address. Cmd or Ctl click http location to open preview server in browser. Example Server address message... 
    ```
    Server address: http://0.0.0.0:4100/teacher/
    ```

    - Save on ipynb or md activiates "regeneration". Refresh browser to see updates. Example terminal message...
    ```
    Regenerating: 1 file(s) changed at 2023-07-31 06:54:32
        _notebooks/2024-01-04-cockpit-setup.ipynb
    ```

    - Terminal message are generated from background processes.  Click return or enter to obtain prompt and use terminal as needed for other tasks.  Alway return to root of project `cd ~/vscode/teacher` for all "make" actions. 
        

    - Stop preview server, but leave constructed files in project for your review.
    ```bash
    make stop
    ```

    - Stop server and "clean" constructed files, best choice when renaming files to eliminate potential duplicates in constructed files.
    ```bash
    make clean
    ```

    - Test notebook conversions, best choice to see if IPYNB conversion is acting up.
    ```bash
    make convert
    ```
