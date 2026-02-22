#!/usr/bin/env bash

# Purpose: Validates the structural integrity of the repository against the Governance Baseline.
# Inputs: None.
# Outputs: Log messages to stdout/stderr.
# Dependencies: find, grep
# Exit codes:
#  0 - Success
#  1 - Generic error or structural violation

set -euo pipefail

# --- Configuration (Constants) ---
readonly REQUIRED_DIRS=(
    ".github"
    "audit"
    "hardening"
    "maintenance"
    "scripts"
    "test"
    "lib"
    "docs"
)
readonly REQUIRED_FILES=(
    ".pre-commit-config.yaml"
    "commitlint.config.cjs"
    "release-please-config.json"
    ".release-please-manifest.json"
    ".editorconfig"
    "docs/governance-baseline.md"
    "docs/versioning.md"
    "docs/setup-checklist.md"
)

# --- Functions ---

# Validate required binaries
require_command() {
    local cmd="$1"
    command -v "$cmd" >/dev/null 2>&1 || {
        echo "ERROR: Missing required command: $cmd" >&2
        exit 1
    }
}

log_info() {
    echo -e "[\033[0;32mINFO\033[0m] $*"
}

log_error() {
    echo -e "[\033[0;31mERROR\033[0m] $*" >&2
}

validate_directories() {
    local exit_code=0
    local dir
    for dir in "${REQUIRED_DIRS[@]}"; do
        if [[ -d "$dir" ]]; then
            log_info "Mandatory directory present: $dir"
        else
            log_error "Mandatory directory missing: $dir"
            exit_code=1
        fi
    done
    return "$exit_code"
}

validate_files() {
    local exit_code=0
    local file
    for file in "${REQUIRED_FILES[@]}"; do
        if [[ -f "$file" ]]; then
            log_info "Normative file present: $file"
        else
            log_error "Normative file missing: $file"
            exit_code=1
        fi
    done
    return "$exit_code"
}

validate_executability() {
    local exit_code=0

    # scripts/ must be executable
    # We use find with -mindepth 1 to avoid checking the directory itself
    if find scripts/ -mindepth 1 -type f ! -executable | grep -q .; then
        log_error "Found non-executable files in scripts/"
        exit_code=1
    fi

    # lib/ must NOT be executable
    if find lib/ -mindepth 1 -type f -executable | grep -q .; then
        log_error "Found executable files in lib/ (Forbidden by Governance)"
        exit_code=1
    fi

    return "$exit_code"
}

# --- Main Logic ---

main() {
    log_info "Starting structural validation..."

    # Ensure dependencies are met
    require_command "find"
    require_command "grep"

    local final_status=0

    validate_directories || final_status=1
    validate_files || final_status=1
    validate_executability || final_status=1

    if [[ "$final_status" -eq 0 ]]; then
        log_info "Structural validation passed successfully."
    else
        log_error "Structural validation failed."
    fi

    exit "$final_status"
}

main "$@"
