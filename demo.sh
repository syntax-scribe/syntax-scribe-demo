#!/bin/bash

# Exit on any error and treat unset variables as errors
set -euo pipefail

# Configuration
readonly DEMO_DIR="${DEMO_DIR:-$HOME/syntax-scribe-demo}"
readonly SOURCE_CODE_DIR="$DEMO_DIR/vueuse"
readonly DOC_DIR="$DEMO_DIR/vueuse-docs"
readonly REPO_URL="https://github.com/vueuse/vueuse.git"

readonly DEFAULT_LICENSE=""

# Function to print colored output
print_status() {
    echo "🚀 $1"
}

print_success() {
    echo "✅ $1"
}

print_error() {
    echo "❌ $1" >&2
}

# Function to check dependencies
check_dependencies() {
    local missing_deps=()
    
    # Check for Python
    if command -v python3 >/dev/null 2>&1; then
        PYTHON_CMD="python3"
        print_success "Python is installed: $(python3 --version)"
    elif command -v python >/dev/null 2>&1; then
        PYTHON_CMD="python"
        print_success "Python is installed: $(python --version)"
    else
        missing_deps+=("python")
    fi
    
    # Check for git
    if ! command -v git >/dev/null 2>&1; then
        missing_deps+=("git")
    fi
    
    # Check for syntax-scribe
    if ! command -v syntax-scribe >/dev/null 2>&1; then
        missing_deps+=("syntax-scribe")
    fi
    
    # Report missing dependencies
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing required dependencies: ${missing_deps[*]}"
        print_error "Please install the missing dependencies and try again."
        exit 1
    fi
}

# Function to setup directories
setup_directories() {
    print_status "Setting up directories"
    
    # Remove existing demo directory if it exists
    if [ -d "$DEMO_DIR" ]; then
        print_status "Removing existing demo directory"
        rm -rf "$DEMO_DIR"
    fi
    
    # Create demo directory
    mkdir -p "$DEMO_DIR"
    cd "$DEMO_DIR"
    
    print_success "Directories setup complete"
}

# Function to clone repository
clone_repository() {
    print_status "Cloning VueUse repository"
    
    if git clone "$REPO_URL"; then
        print_success "Repository cloned successfully"
    else
        print_error "Failed to clone repository"
        exit 1
    fi
}

# Function to run syntax-scribe commands
run_syntax_scribe() {
    print_status "Running syntax-scribe commands"
    
    # Check syntax-scribe version
    print_status "Syntax-scribe version: $(syntax-scribe --version)"
    
    # Set LICENSE variable if not already set
    if [ -z "${LICENSE:-}" ]; then
        print_status "LICENSE variable not set, using default: $DEFAULT_LICENSE"
        LICENSE="$DEFAULT_LICENSE"
    fi
    
    # Document command
    print_status "Running document command"
    if ! syntax-scribe docs document -s "$SOURCE_CODE_DIR" -d "$DOC_DIR/docs" -l "$LICENSE"; then
        print_error "Document command failed"
        exit 1
    fi
    
    # Init command
    print_status "Running init command"
    if ! syntax-scribe docs init -d "$DOC_DIR" -l "$LICENSE" -n "VueUse Documentation"; then
        print_error "Init command failed"
        exit 1
    fi
    
    # Nav command
    print_status "Running nav command"
    if ! syntax-scribe docs nav -d "$DOC_DIR" -l "$LICENSE"; then
        print_error "Nav command failed"
        exit 1
    fi
    
    # Serve command
    print_status "Starting documentation server"
    print_success "Documentation will be served at http://localhost:8000"
    print_success "Press Ctrl+C to stop the server"
    syntax-scribe docs serve -d "$DOC_DIR" -l "$LICENSE"
}

# Function to cleanup on script exit
cleanup() {
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        print_error "Script failed with exit code $exit_code"
    fi
}

# Main execution
main() {
    trap cleanup EXIT
    
    print_status "Starting VueUse documentation generation"
    
    check_dependencies
    setup_directories
    clone_repository
    run_syntax_scribe
    
    print_success "Documentation generation completed successfully!"
}

# Run main function
main "$@"