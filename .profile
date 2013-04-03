###############################################################################
# Application Defautls                                                        #
###############################################################################

SVN_EDITOR=/usr/bin/nano; export SVN_EDITOR
export EDITOR="/usr/local/bin/mate -w"

# User TURN for Rake Tests
export USE_TURN=true

# PragProg book tools
export JAVA_HOME="/Library/Java/Home"

# Fix MySQL 5.5
DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

###############################################################################
# Custom Shell Commands                                                       #
###############################################################################

# LivingSocial
alias standup='mate ~/.standup'
alias openvpn="/usr/local/bin/pgrep racoon | xargs sudo kill -9; osascript /Volumes/LivingSocial/code/applescripts/openvpn.scpt"
alias keep_vpn_alive="watch -n 180 ping -c 1 code.livingsocial.net"
alias cdls="cd /Volumes/LivingSocial"
alias mark_live='RAILS_ENV=development ./script/offline_tasks.rb mark_live_deals'
alias mark_live_deals='RAILS_ENV=development script/offline_tasks.rb mark_live_deals'
alias refstart='SBT_OPTS="-XX:MaxPermSize=512m" ./sbt "project refcode" start-server'
alias haproxystart='sudo /usr/local/Cellar/haproxy/1.4.15/sbin/haproxy -f /usr/local/etc/haproxy.cfg'
alias fixnginx='sudo ipfw enable firewall'

source '~/.dbkey'

# LivingSocial speedup
export RUBY_HEAP_FREE_MIN=1024
export RUBY_HEAP_MIN_SLOTS=4000000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_GC_MALLOC_LIMIT=500000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

# For invoikint ruby test/unit/foo.rb
export RUBYOPT=-Itest

# formatting the prompt so I always know what branch I'm on
# used as reference: http://bit.ly/7rnCY7
#
# [time] hostname:dir (branch) username
#
source /usr/local/etc/bash_completion.d/git-prompt.sh
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
PS1='$(__git_ps1 "[\t] \h:\W (%s) ")\u$ '

alias termkit='cd ~/Sources/TermKit/Node/ && node nodekit.js'

# spotlight indexing
alias spotoff='sudo mdutil -a -i off'
alias spoton='sudo mdutil -a -i on'

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# memcached
alias mcd='memcached -d -l 127.0.0.1 -p 11211'
alias mck='killall memcached'
alias mcst='ps ax | grep memcached | grep -v grep'
alias mcflush="echo 'flush_all' | nc localhost 11211"

# nginx
alias nlog='tail -f /usr/local/Cellar/nginx/1.0.4/logs/access.log'
alias nrestart='pgrep nginx | xargs sudo kill -9 && sudo /usr/local/sbin/nginx'
alias nstop='pgrep nginx | xargs sudo kill -9'
alias ndeets='ps auxwww | grep nginx'

# PHP
alias mpear="/Applications/MAMP/bin/php5.3/bin/pear"

# Rails
alias mr="mongrel_rails start"
alias rake:nuke="rake db:drop db:create db:migrate db:seed"
alias sg=script/generate
alias ss=script/server
alias ssd='script/server --debugger'
alias tlog='tail -f log/development.log'

# Postgres
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias psdeets="ps auxwww | grep postgres"

# Top Aliases
alias tu="top -u cpu" #cpu
alias tm="top -o vsize" #memory


## SVN
# This will strip all svn entries from a folder and all its subfolders. be forewarned.
alias deletesvndir="find . -name '.svn' -type d | xargs rm -rf"

## Git
# Show difference between the HEAD and the index
alias staged="git diff --cached"

# Show difference between working tree and the index
alias unstaged="git diff"

# Show staged and unstaged changes (what would be commited with "git commit -a")
alias both="git diff HEAD"

# Bundler stuff
alias gib="gem install bundler --no-rdoc --no-ri"
alias be="bundle exec"

#Apps
alias gowilde="cdls && cd code/wilde"
alias goq="cdls && cd code/csr_tool"

# git
alias g="git"
alias gb='git branch'
alias gba='git branch -a -v'
alias gbd='git branch -d'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glr='git pull --rebase'
alias gls='git log --stat'
alias gp='git push'
alias gpom='git push origin master'
alias grm='git status | grep deleted | awk '\''{print $3}'\'' | xargs git rm'
alias grp='git remote prune origin'
alias gs='git status'
alias gwho='git log | grep Author | sort | uniq'

# Misc commands from Andy Atkinson @ Living Social

alias getip="ifconfig en1 | grep 'inet ' | cut -f 2 -d ' '"
alias la='ls -A'
alias ll='ls -l'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias lowvol='osascript -e "set Volume 0.01"'
alias ls='ls -laAFGh'
alias mute='osascript -e "set Volume 0"'
alias myip='ifconfig|grep -A 4 "en0"|grep -oe "[[:digit:]]\{2,3\}.[[:digit:]]\{2,3\}.[[:digit:]]\{2,3\}.[[:digit:]]\{2,3\}[[:space:]]"|pbcopy;echo "copied IP to clipboard: ";pbpaste'
alias whatsrunning='lsof -i'
alias xc='open *.xcodeproj'

alias StartVBnet='sudo ifconfig lo0 alias 192.168.10.100'
alias StopVBnet='sudo ifconfig lo0 -alias 192.168.10.100'

#Man pages

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}



###############################################################################
# SSH Openers                                                                 #
###############################################################################

source "~/.sshopeners"

###############################################################################
# Path Settings                                                               #
###############################################################################

# basic path
export MANPATH="/usr/local/man:$MANPATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/X11/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*