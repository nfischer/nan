#!/bin/bash

# Display help for a command, even if there is no man page

VERSION=0.1.0

usage () {
  echo "nan [-hV] <command>"
  echo
  echo "Options:"
  echo "  -h|--help      Print this help dialogue and exit"
  echo "  -V|--version   Print the current version and exit"
}

# Open `less` if it receives non-empty stdin, otherwise fail
lessWrapper() {
  read line || return 1
  (echo "${line}"; cat) | less
}

nan () {
  for opt in "${@}"; do
    case "${opt}" in
      -h|--help)
        usage
        return 0
        ;;
      -V|--version)
        echo "$VERSION"
        return 0
        ;;
    esac
  done

  ## Main
  if [ "$#" -eq 0 ]; then
    usage >&2
    return 2
  fi

  # shellcheck disable=SC1001
  \man "${@}"    2>/dev/null               ||  # Try the man page
  help -m "${@}" 2>/dev/null | lessWrapper ||  # Try the Bash-specific `help` command for builtins
  "${@}" --help  2>/dev/null | lessWrapper ||  # Try the `--help` flag
  "${@}" help    2>/dev/null | lessWrapper ||  # Try the `help` argument
  "${@}" -h      2>/dev/null | lessWrapper ||  # Try the `-h` flag
  {
    echo "Unable to find help information for '${*}'" >&2
    return 1
  }
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f nan
else
  nan "${@}"
  exit $?
fi
