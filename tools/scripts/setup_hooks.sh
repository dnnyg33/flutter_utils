#!/bin/bash

# Script to install git hooks from the hooks/ directory

HOOKS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/hooks"
GIT_HOOKS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/.git/hooks"

echo "📦 Installing git hooks..."

# Create .git/hooks directory if it doesn't exist
mkdir -p "$GIT_HOOKS_DIR"

# Copy all hooks from hooks/ to .git/hooks/ (skip README and other docs)
for hook in "$HOOKS_DIR"/*; do
  if [ -f "$hook" ]; then
    hook_name=$(basename "$hook")
    # Skip documentation files
    if [[ "$hook_name" == README* ]] || [[ "$hook_name" == *.md ]]; then
      continue
    fi
    cp "$hook" "$GIT_HOOKS_DIR/$hook_name"
    chmod +x "$GIT_HOOKS_DIR/$hook_name"
    echo "✅ Installed $hook_name"
  fi
done

echo "🎉 Git hooks installed successfully!"
