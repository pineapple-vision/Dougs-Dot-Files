
#creates lazydocker container
alias lazydocker='sudo docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /home/ddepker/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'


# Prompt user before overwriting any files
alias cp='cp --interactive'
alias mv='mv --interactive'
alias rm='rm --interactive'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Search running processes
alias psgrep="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Always show disk usage in a human readable format
alias df='df -h'
alias du='du -h'

# Check the root directory folders amount of data
alias spacehogs='sudo du -sh /* | sort -hr'

# Show open ports
alias openports='netstat -nape --inet'
alias ports='netstat -tulanp'

# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

# Edit this .bashrc file
alias bashrc='sudo nano ~/.bashrc'
alias bash_aliases='sudo nano ~/.bash_aliases'
alias bash_functions='sudo nano ~/.bash_functions'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# Search command line history
alias gh="history | grep "

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
