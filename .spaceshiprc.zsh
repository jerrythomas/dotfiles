# custom color 8-255 with suffix m
# 16 colors uses \e[30m to \e[37m
# replace m with ;3m for italic, ;2m for highcontrast

# Username
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX="┌["
SPACESHIP_USER_SUFFIX="%f"
SPACESHIP_USER_COLOR="33"

# Hostname
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX=@
SPACESHIP_HOST_COLOR="72"
SPACESHIP_HOST_SUFFIX="] "

SPACESHIP_DOCKER_PREFIX="using "
SPACESHIP_DOCKER_COLOR="117"
SPACESHIP_DIR_COLOR="215"

# Prompt
SPACESHIP_CHAR_PREFIX="└❯%F{##4B4DFF}"
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_SUFFIX="%f"

SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  bun           # Bun section
  deno          # Deno section
  ruby          # Ruby section
  python        # Python section
  elm           # Elm section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  java          # Java section
  lua           # Lua section
  dart          # Dart section
  julia         # Julia section
  crystal       # Crystal section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  async         # Async jobs indicator
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

spaceship remove swift
spaceship remove gcloud
spaceship remove elm
spaceship remove elixir
spaceship remove hg
spaceship remove ibmcloud

# Do not truncate path in repos
# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
#spaceship add --before char vi_mode
