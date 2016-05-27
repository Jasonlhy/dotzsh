# Path to your oh-my-zsh installation.
export ZSH=/Users/Jason/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages copydir)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$PATH:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# open man page in preview
pman (){
    man -t ${1} | open -f -a /applications/preview.app
}

# build and run a c program
runc (){
    make ${1}
    ./$1
}

# delete file with extension (show content & ask confirmation)
checkrm (){
    for f in `ls *.${1}`; do
        echo "/* *********************************"
        echo " * $f"
        echo " * *********************************/"
        cat "$f" | less
        rm "-i" $f
        echo ""
        echo ""
    done
}

# concat all the file with specified extension with beautiful header
mergefile (){
    for f in `ls *.${1}`; do
        (
        echo "/* *********************************" 
        echo " * $f"
        echo " * *********************************/" 
        cat "$f"
        echo ""
        echo ""
        ) >> ${2}
    done
}

# tabular the columns using delimator of one charcter
# Example:
# echo 'messi ,ronaldo  ,david beckham \nwayne ronny,ozil, neymer ' | tabular ','
# messi         , ronaldo     , david beckham 
# wayne ronny   , ozil        , neymer 
tabular (){
    trick_letter='>'
    sed_argument="s/\([^$1]*\) *$1 *\([^$1]*\)/\1 $trick_letter$1 \2/g"
    sed $sed_argument | column -t -s $trick_letter
}

# Add number at the start of each line
# `expand` is to convert tab into space.....
# becasue format of the `cat` output like this
#    1	create the peer server
#    2	cwtf is going on
#
# first "whitespace" is apce, second "whitespace" is tab
# Input:
# create the peer server
# cwtf is going on
# 
# Output:
# 1. create the peer server
# 2. cwtf is going on
addNumber (){
    cat -n | expand | sed -E "s/([ ]+)([1-9]+)([ ]+)(.*)/\2\. \4/g"
}

# remove number in this format: xxx1xxxxx.*xxxxDDDD where xxxx can be empty and DDD is what we want
# " 2. BC" => "BC"
removeNumber (){
    expand | sed "s/\([0-9][0-9]*\) *\.* *\(.*\)/\2/g"  
}

# Upper case of first english letter in each line
firstUpperCase (){
    sed "s/\(^[^a-zA-Z]*\)[aA]/\1A/g;s/\(^[^a-zA-Z]*\)[bB]/\1B/g;s/\(^[^a-zA-Z]*\)[cC]/\1C/g;s/\(^[^a-zA-Z]*\)[dD]/\1D/g;s/\(^[^a-zA-Z]*\)[eE]/\1E/g;s/\(^[^a-zA-Z]*\)[fF]/\1F/g;s/\(^[^a-zA-Z]*\)[gG]/\1G/g;s/\(^[^a-zA-Z]*\)[hH]/\1H/g;s/\(^[^a-zA-Z]*\)[iI]/\1I/g;s/\(^[^a-zA-Z]*\)j/[jJ\1]/g;s/\(^[^a-zA-Z]*\)[kK]/\1K/g;s/\(^[^a-zA-Z]*\)[lL]/\1L/g;s/\(^[^a-zA-Z]*\)[mM]/\1M/g;s/\(^[^a-zA-Z]*\)[nN]/\1N/g;s/\(^[^a-zA-Z]*\)[oO]/\1O/g;s/\(^[^a-zA-Z]*\)[pP]/\1P/g;s/\(^[^a-zA-Z]*\)[qQ]/\1Q/g;s/\(^[^a-zA-Z]*\)[rR]/\1R/g;s/\(^[^a-zA-Z]*\)[sS]/\1S/g;s/\(^[^a-zA-Z]*\)[tT]/\1T/g;s/\(^[^a-zA-Z]*\)[uU]/\1U/g;s/\(^[^a-zA-Z]*\)[vV]/\1V/g;s/\(^[^a-zA-Z]*\)[wW]/\1W/g;s/\(^[^a-zA-Z]*\)[xX]/\1X/g;s/\(^[^a-zA-Z]*\)[yY]/\1Y/g;s/\(^[^a-zA-Z]*\)[zZ]/\1Z/g"
}

# safe remove but removing them to the trash instead of deleting completely
trash (){
    mv "$1" ~/.Trash
}

# Check the content of text file and decide to remove or not
checktxt (){
    for f in `ls`; do
        if [ ! -d "$f" ]; then
            if file "$f" | grep -q "text" ; then
                echo "/* *********************************"
                echo " * $f"
                echo " * *********************************/"
                cat "$f" | less
                rm "-i" $f
                echo ""
                echo ""
            fi
        fi
    done
}


# alias to execute my shell script
alias gmf='sh /Users/Jason/myshellscript/gmf.sh'
alias ows='sh /Users/Jason/myshellscript/lazyshellscript/website.sh'

# generate, upload and back up hexo blog
alias ubh='hexo generate && hexo deploy && hexo backup'

# Reload Zsh Config
alias rzc='source ~/.zshrc'

# Back directory
alias bd='cd ../'
# Next directory
alias nd='cd -'

PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH="$PATH:/Library/TeX/texbin" # pandoc pdf writer
