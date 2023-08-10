<<comment
# The hash # is a comment or action, # is not part of the comment or action
# The dollar $ represent a terminal command, $ is not part of command

# Start a terminal for commands
$ git clone https://github.com/nighthawkcoders/student.git
$ ./student/activate.sh

# Start a new terminal
$ gem install jekyll bundler
$ conda activate
$ cd student
$ bundle install
$ bundle exec jekyll serve

# The build execution is complete
# Ctl-Click on "link" in terminal
# Observe web site in browser
comment

## Terminal Commands
#### Installs ruby and gnu tools
echo "=== Missing Packages ==="
sudo apt -y install ruby-full build-essential

#### Github Pages Local Build
echo "=== GitHub pages build tools  ==="
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
gem install jekyll bundler

