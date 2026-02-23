#!/usr/bin/env bash

# Purpose: Validates the structural integrity of the repository against the Governance Baseline.
# Inputs: None.
# Outputs: Log messages to stdout/stderr.
# Dependencies: find
# Exit codes:
#  0 - Success
#  1 - Structural or Permission violation
# Documentation: docs/governance-baseline.md

set -euo pipefail
IFS=$'\n\t'

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
    ".markdownlintignore"
    ".gitignore"
    ".env.example"
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
        echo -e "[\033[0;31mERROR\033[0m] Missing required command: $cmd" >&2
        exit 1
    }
}

# --- UI / UX Colors (ANSI 256-bit) ---
log_info()    { echo -e "[\033[38;5;31mINFO\033[0m] $*"; }     # #1585B5 (K'aatech Accessible Blue)
log_warn()    { echo -e "[\033[38;5;214mWARN\033[0m] $*"; }     # #FBCA04 (Amber)
log_error()   { echo -e "[\033[38;5;124mERROR\033[0m] $*" >&2; } # #991B1B (Red)
log_success() { echo -e "[\033[38;5;71mSUCCESS\033[0m] $*"; }   # #4CAF50 (Green)

validate_existence() {
    local exit_code=0
    log_info "Verifying mandatory directories and normative files..."

    for dir in "${REQUIRED_DIRS[@]}"; do
        [[ -d "$dir" ]] || { log_error "Mandatory directory missing: $dir"; exit_code=1; }
    done

    for file in "${REQUIRED_FILES[@]}"; do
        [[ -f "$file" ]] || { log_error "Normative file missing: $file"; exit_code=1; }
    done
    return "$exit_code"
}

validate_executability() {
    local exit_code=0
    log_info "Auditing execution bits across protected zones..."

    # 1. Zone: Required Scripts (+x)
    # We look for files that are NOT executable, ignoring .gitkeep
    local non_execs

    if find scripts/ test/unit/ audit/ hardening/ maintenance/ -name ".gitkeep" | grep -q .; then
        log_warn "Found .gitkeep files in script zones. These are ignored for execution bit audit."
    fi

    non_execs=$(find scripts/ test/unit/ audit/ hardening/ maintenance/ -type f ! -name ".gitkeep" ! -executable)
    if [[ -n "$non_execs" ]]; then
        log_error "The following files MUST be executable (+x):\n$non_execs"
        exit_code=1
    fi

    # 2. Zone: Libraries and Docs (-x) - Executable bit prohibited
    # We look for files that ARE executable, ignoring .gitkeep
    local illegal_execs
    illegal_execs=$(find lib/ test/lib/ docs/ -type f ! -name ".gitkeep" -executable)
    if [[ -n "$illegal_execs" ]]; then
        log_error "Security violation. The following files MUST NOT be executable:\n$illegal_execs"
        exit_code=1
    fi

    return "$exit_code"
}

# --- Main Logic ---

main() {
    log_info "Initiating a structural governance and permissions audit..."

    # Ensure dependencies are met
    require_command "find"

    local final_status=0

    validate_existence || final_status=1
    validate_executability || final_status=1

    if [[ "$final_status" -eq 0 ]]; then
        log_success "✅ Validation successful: The repository complies with the governance contract.."
    else
        log_error "❌ Validation failed: Structural or security inconsistencies were found."
        log_error "Please review the errors listed above and correct any missing permissions or files."
    fi

    exit "$final_status"
}

main "$@"
