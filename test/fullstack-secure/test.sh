#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

checkCommon

# Test SSH server is installed
check "sshd" which sshd

# Test Node.js and npm for HTML/web development
check "node" node --version
check "npm" npm --version

# Test web servers
check "http-server" which http-server
check "serve" which serve
check "live-server" which live-server

# Test encryption tools
check "openssl" openssl version
check "gpg" gpg --version
check "pass" which pass
check "age" which age

# Test token directory creation and permissions
check "token-dir" bash -c '[ -d "${containerWorkspaceFolder:-/workspaces/$(basename $(pwd))}/.tokens" ]'

# Test environment variables
check "TOKEN_DIR" bash -c '[ ! -z "$TOKEN_DIR" ]'

# Report result
reportResults
