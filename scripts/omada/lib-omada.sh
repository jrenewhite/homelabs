#!/usr/bin/env bash
# Shared helpers for TP-Link Omada standalone gateway SSH CLI.
# shellcheck shell=bash

OMADA_HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../lib.sh
source "$OMADA_HERE/../lib.sh"

omada_need_deps() {
  need_cmd ssh
  need_cmd expect
}

omada_read_password_with_retry() {
  local __var="$1"
  local host="$2"
  local user="$3"
  local stdin_mode="$4"
  read_password "$__var" "Router password for ${user}@${host}: " "$stdin_mode"
}

omada_run_sequence() {
  # Usage:
  #   omada_run_sequence HOST USER PORT PASSWORD TIMEOUT COMMAND...
  #
  # Return:
  #   0  success / session completed
  #   10 authentication rejected
  #   other expect/ssh failure
  local host="$1" user="$2" port="$3" password="$4" timeout="$5"
  shift 5
  local commands=("$@")

  local payload=""
  local cmd
  for cmd in "${commands[@]}"; do
    payload+="${cmd}"$'\034'
  done

  OMADA_HOST="$host" \
  OMADA_USER="$user" \
  OMADA_PORT="$port" \
  OMADA_PASSWORD="$password" \
  OMADA_TIMEOUT="$timeout" \
  OMADA_COMMANDS="$payload" \
  expect <<'EXPECT_EOF'
set timeout $env(OMADA_TIMEOUT)
log_user 1

set host $env(OMADA_HOST)
set user $env(OMADA_USER)
set port $env(OMADA_PORT)
set password $env(OMADA_PASSWORD)
set raw $env(OMADA_COMMANDS)
set commands [split $raw "\034"]

spawn ssh \
  -p $port \
  -o StrictHostKeyChecking=accept-new \
  -o UserKnownHostsFile=$env(HOME)/.ssh/known_hosts \
  -o PreferredAuthentications=password,keyboard-interactive \
  -o PubkeyAuthentication=no \
  -o NumberOfPasswordPrompts=1 \
  -o ConnectTimeout=$timeout \
  $user@$host

set authenticated 0
expect {
  -re "(?i)permission denied|authentication failed|access denied" {
    exit 10
  }
  -re "(?i)password:" {
    send -- "$password\r"
    exp_continue
  }
  -re {([>#])\s*$} {
    set authenticated 1
  }
  timeout {
    exit 11
  }
  eof {
    exit 12
  }
}

if {!$authenticated} {
  exit 13
}

foreach cmd $commands {
  if {$cmd eq ""} {
    continue
  }
  send -- "$cmd\r"
  expect {
    -re "(?i)permission denied|authentication failed|access denied" {
      exit 10
    }
    -re {Continue\?.*\(Y/N\)} {
      send -- "Y\r"
      exp_continue
    }
    -re {([>#])\s*$} {
      # ready for the next command
    }
    timeout {
      # Some commands (notably reboot) deliberately drop the connection.
      if {[string match -nocase "*reboot*" $cmd]} {
        exit 0
      }
      exit 14
    }
    eof {
      if {[string match -nocase "*reboot*" $cmd]} {
        exit 0
      }
      exit 15
    }
  }
}

send -- "exit\r"
after 100
exit 0
EXPECT_EOF
}

omada_with_password_retries() {
  # Usage:
  #   omada_with_password_retries HOST USER PORT TIMEOUT STDIN_MODE COMMAND...
  local host="$1" user="$2" port="$3" timeout="$4" stdin_mode="$5"
  shift 5
  local commands=("$@")
  local password=""
  local attempt status

  for attempt in 1 2 3; do
    omada_read_password_with_retry password "$host" "$user" "$stdin_mode" ||
      die "No router password available"

    set +e
    omada_run_sequence \
      "$host" "$user" "$port" "$password" "$timeout" \
      "${commands[@]}"
    status=$?
    set -e

    unset password

    if (( status == 0 )); then
      return 0
    fi

    if (( status == 10 )); then
      printf 'Router authentication rejected (attempt %s/3).\n' "$attempt" >&2
      continue
    fi

    die "Omada SSH CLI session failed (exit $status)"
  done

  die "Router password rejected 3 times"
}

omada_parse_common_args() {
  # Populates OMADA_* globals and leaves command-specific args in OMADA_REST.
  OMADA_HOST=""
  OMADA_USER=""
  OMADA_PORT=22
  OMADA_TIMEOUT=8
  OMADA_PASSWORD_STDIN=0
  OMADA_REST=()

  while (( $# )); do
    case "$1" in
      -H|--host) OMADA_HOST="${2:?Missing value}"; shift 2 ;;
      -u|--user) OMADA_USER="${2:?Missing value}"; shift 2 ;;
      -P|--port) OMADA_PORT="${2:?Missing value}"; shift 2 ;;
      --timeout) OMADA_TIMEOUT="${2:?Missing value}"; shift 2 ;;
      --password-stdin) OMADA_PASSWORD_STDIN=1; shift ;;
      *) OMADA_REST+=("$1"); shift ;;
    esac
  done

  [[ -n "$OMADA_HOST" && -n "$OMADA_USER" ]] ||
    die "--host and --user are required"
}
