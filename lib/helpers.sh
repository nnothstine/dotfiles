# ============================================================================
# POSIX-compliant helper scripts
# ============================================================================

# silently determine existence of executable
# $1 name of bin
__nan_has() { command -v "$1" >/dev/null 2>&1; }

__nan_prefer() {
  __nan_has "$1" || {
    [ -n "$SSH_CLIENT" ] && echo "==> WARN: ${1} not found"
    return 1
  }
}

__nan_exec() { ${DRYRUN:+__nan_echo} $@; return ${DRYRUN:+1}; }

# pipe into this to indent
__nan_indent() { sed 's/^/    /'; }

# source a file if it exists
# $1 path to file
__nan_source() { [ -f "$1" ] && . "$1"; }

# require root
__nan_requireroot() {
  [ "$(whoami)" = "root" ] && return 0
  __nan_err "Please run as root, these files go into /etc/**/"
  return 1
}

# require executable
# $1 name of bin
__nan_require() {
  __nan_has "$1" && __nan_status "FOUND: ${1}" && return 0
  __nan_err "MISSING: ${1}"
  __nan_err_ "Please install before proceeding."
  return 1
}

__nan_maybemkdir() {
  if [[ ! -d "$1" ]]; then
    __nan_status "Directory ${1} does not exist."
    if [[ -z "$CI" ]]; then
      read "REPLY?          Create? [y/N] "
      [[ ! $REPLY =~ ^[Yy]$ ]] && return 1
    fi
    mkdir -p -- "$1" && __nan_ok "Created ${1}."
  fi
}

__nan_realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

__nan_same() {
  # http://www.tldp.org/LDP/abs/html/exitcodes.html
  local sourcepath="$1"
  local targetpath="$2"
  if [[ -f "$targetpath" ]] || [[ -d "$targetpath" ]]; then
    local resolvedpath=$(__nan_realpath "$targetpath")
    [[ "$resolvedpath" == "$sourcepath" ]] && {
      __nan_status "${targetpath} already linked to ${resolvedpath}."
      return 0
    }
    __nan_warn "${targetpath} not linked to ${resolvedpath}."
    return 10
  fi
  __nan_status "${targetpath} not found."
  return 20
}

__nan_link() {
  if [[ $1 == '-s' ]]; then
    local dosudo=1
    shift
  fi
  local flags="-svf"
  local dest=${@[-1]}
  local srcs; srcs=( ${@:1:-1} )
  if [[ $dest == */ && ! -d $dest ]]; then
    mkdir -p $dest
  elif [[ ! -d ${dest%/*} ]]; then
    mkdir -p ${dest%/*}
  fi
  for lk in ${srcs[@]}; do
    local src
    case $lk in
      /*) src=$lk ;;
      .)  src="$(__topic_path $TOPIC)" ;;
      *)  src="$(__topic_path $TOPIC)/$lk" ;;
    esac
    if [[ -d $src ]]; then
      if [[ $dest != */ && -d $dest && -L $dest ]]; then
        ${dosudo:+sudo} rm -fv $dest
      fi
    fi
    __nan_exec ${dosudo:+sudo} ln $flags $src $dest
  done
}