Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White


alias cdwork="cd ~/Desktop/Workspace"


parse_git() {
	git status &> /tmp/temp_1
	cat /tmp/temp_1 | grep "fatal: Not a git repository" > /tmp/temp_1_err
	if [ ! -s /tmp/temp_1_err ]
	then
		cat /tmp/temp_1 | grep "nothing to commit" > /tmp/temp_2
		cat /tmp/temp_1 | grep "Changes not staged" > /tmp/temp_3
		cat /tmp/temp_1 | grep "ahead of" > /tmp/temp_4
		cat /tmp/temp_1 | grep "Changes to be committed" > /tmp/temp_5
		cat /tmp/temp_1 | grep "behind" > /tmp/temp_6
		if [ -s /tmp/temp_4 ]
		then
			if [ -s /tmp/temp_3 ]
			then
				commit="$BRed (Commits: $(cat /tmp/temp_4 | rev | cut -d " " -f	2 | rev) | modified: $(cat /tmp/temp_1 | grep modified | wc -l))"
				status="$BRed (ahead-by | unstaged-changes)"
			elif [ -s /tmp/temp_5 ]
			then
				commit="$BYellow (Commits: $(cat /tmp/temp_4 | rev | cut -d " " -f 2 | rev))"
				status="$BBlue (ahead-by | staged-changes)"
			else
				commit="$BYellow (Commits: $(cat /tmp/temp_4 | rev | cut -d " " -f 2 | rev))"
				status="$BYellow (ahead-by)"
			fi
		elif [ -s /tmp/temp_5 ]
		then
			commit="$BBlue (-)"
			status="$BBlue (staged-changes)"
		elif [ -s /tmp/temp_3 ]
		then
			commit="$BRed (-)"
			status="$BRed (unstaged-changes)"
		elif [ -s /tmp/temp_6 ]
		then
			commit="$BRed (Commits: $(cat /tmp/temp_6 | cut -d "," -f 1 | rev | cut -d " " -f 2 | rev))"
			status="$BRed (behind-by)"
		else
			commit="$BGreen (Commits: 0)"
			status="$BGreen (up-to-date)"
		fi

		case $1 in
			status)
				echo -e $status
				;;
			commit)
				echo -e $commit
				;;
			branch)
				branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
				echo -e $branch
				;;
			*)
				echo "Null"
				;;
		esac
	else
		echo -e "$BGreen (~)"
	fi
	rm -f /tmp/temp_* > /dev/null
}

parse_git_status1() {
	echo [$1]
}

extract()
{
      if [ -f $1  ] ; then
          case $1 in
              *.tar.bz2)
                  tar xvjf $1    ;;
              *.tar.gz)
                  tar xvzf $1    ;;
              *.bz2)
                  bunzip2 $1     ;;
              *.rar)
                  unrar x $1       ;;
              *.gz)
                  gunzip $1      ;;
              *.tar)
                  tar xvf $1     ;;
              *.tbz2)
                  tar xvjf $1    ;;
              *.tgz)
                  tar xvzf $1    ;;
              *.zip)
                  unzip $1       ;;
              *.Z)
                  uncompress $1  ;;
              *.7z)
                  7z x $1        ;;
              *)
                  echo "don't know how to extract '$1'..." ;;
          esac
      else
          echo "'$1' is not a valid file!"
      fi
}

# export PATH="/opt/homebrew/bin:$PATH"

# PS1="\n\[$BWhite\][\$?][\!] \[$Cyan\][\u] \[$Green\][\w] \[$BYellow\]\$(parse_git branch)\[$Color_Off\] [\T] [\d] \n$ "

PS1="\n\[$BWhite\][\$?] \[$Cyan\][\u] \[$Green\][\w] \[$BYellow\]\$(parse_git branch)\[$Color_Off\] [\T] [\d] \n$ "

# export PS1="\u@\h:\w [\d \t] \\$ \[$(tput sgr0)\]"

