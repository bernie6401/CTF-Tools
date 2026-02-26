sudo apt update;
sudo apt upgrade -y;
sudo apt install curl zsh gawk git vim gcc make binutils npm binwalk exiftool -y;
chsh -s /bin/zsh;
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
echo '
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/sbk6401/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall


source ~/.zplug/init.zsh

# zplug plugins
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions", defer:2

if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
        
                echo; zplug install
        else
                echo
        fi
fi

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
' >> ~/.zshrc;
wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py;
git clone https://github.com/longld/peda.git ~/peda
git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb
sudo apt install gdb -y;
echo '
set disassembly-flavor intel

define gef
        source ~/.gdbinit-gef.py

        #### gef
        # gef setting
        gef config dereference.max_recursion 2
        gef config context.layout "regs code args source memory stack trace"
        gef config context.nb_lines_backtrace 3
        gef config context.redirect /dev/pts/2
end

define peda
        source ~/peda/peda.py
        source ~/Pwngdb/pwngdb.py
        source ~/Pwngdb/angelheap/gdbinit.py

        define hook-run
        python
import angelheap
angelheap.init_angelheap()
end
        end
end' >> ~/.gdbinit

sudo npm install -g tldr
# For CTF
sudo apt install  nmap steghide -y;

echo '
# >>> conda initialize >>>
# !! Contents within this block are managed by "conda init" !!
__conda_setup="$("/home/sbk6401/anaconda3/bin/conda" "shell.bash" "hook" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sbk6401/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sbk6401/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sbk6401/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Customize your own settings below
conda config --set auto_activate_base false
source ~/anaconda3/bin/activate CTF
cd /mnt/d/CTF-Tools/
alias ll="ls -al"
alias cdctf="cd /mnt/d/CTF/"
alias cdtrash="cd /mnt/d/Downloads/Trash"
alias gccc="gcc -Wl,--dynamic-linker=/usr/src/glibc/glibc_dbg/elf/ld.so -g"
alias cdtool="cd /mnt/d/CTF-Tools/"
' >> ~/.zshrc

echo "alias cleantmp=\"find . -name '*:Zone.Identifier' -type f -delete\"" >> ~/.zshrc

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

source ~/.zshrc
