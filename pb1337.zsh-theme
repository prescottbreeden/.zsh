# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for git_prompt_status()
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

#Success vs Error previous command
ERROR="%{$fg[red]%}%?$reset_color"
STATUS="%(?..${ERROR} )"

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

function custom_status() {
  if [ -z $(parse_git_branch) ]
    then
      echo ""
    else
      echo $(parse_git_dirty)
  fi
}

#Prompt Variables
TIME="%{$reset_color%}[%@]"
DIRECTORY="%{$fg[blue]%}:%{$fg[blue]%}%~"

# Prompt format
PROMPT="${STATUS}${TIME}${DIRECTORY}%{$RESET_COLOR%}
%{$BLUE_BOLD%}>%{$RESET_COLOR%} "
# PROMPT+='%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%} 

# Git info 
RPROMPT='%{$GREEN_BOLD%}$(git_current_branch)$(git_prompt_short_sha) $(git_prompt_status) %{$RESET_COLOR%} %u$(custom_status)'
