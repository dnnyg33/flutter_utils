# Git Hooks

This directory contains git hook templates that can be tracked in version control and installed by developers on their local machines.

## Available Hooks

### pre-push

**Purpose:** Automatically generates AI-powered release notes from commit history when pushing feature branches.

**Behavior:**
- ✅ Runs on feature branches only (skips `develop` and `main`)
- 📝 Analyzes all commits on the current branch vs. `develop`
- 🤖 Uses Claude API to generate up to 5 concise bullet points
- 📄 Updates `RELEASE_NOTES.txt` with a branch-specific section
- 🔄 Amends the commit to include the updated release notes
- ⚠️ Warns and skips if `ANTHROPIC_API_KEY` is not set (doesn't block push)
- ⏭️ Skips if Python 3 is not available

**Requirements:**
- Python 3
- `ANTHROPIC_API_KEY_CI` environment variable (optional, but needed for functionality)
- `tools/scripts/generate_release_notes.py` (included in repository)

## Installation

Run the installation script from the repository root:

```bash
./tools/scripts/setup_hooks.sh
```

This will:
1. Copy hook templates from `hooks/` to `.git/hooks/`
2. Make them executable
3. Display setup instructions

## Setup (Optional)

To enable the pre-push release notes automation:

1. **Get an API key:**
   - Visit https://console.anthropic.com
   - Generate an API key

2. **Set environment variable:**
   ```bash
   export ANTHROPIC_API_KEY_CI=sk-ant-...
   ```

3. **Make it permanent (add to your shell config):**
   - For bash: Add to `~/.bashrc` or `~/.bash_profile`
   - For zsh: Add to `~/.zshrc`

   ```bash
   echo 'export ANTHROPIC_API_KEY_CI=sk-ant-...' >> ~/.zshrc
   source ~/.zshrc
   ```

   **Note:** This uses `ANTHROPIC_API_KEY_CI` instead of `ANTHROPIC_API_KEY` to avoid conflicts with Claude Code, which uses the same environment variable name.

## Manual Installation

If you prefer to install hooks manually:

```bash
# Copy hook to git hooks directory
cp hooks/pre-push .git/hooks/pre-push

# Make executable
chmod +x .git/hooks/pre-push
```

## Disabling Hooks

To temporarily disable a hook:

```bash
# Rename the hook
mv .git/hooks/pre-push .git/hooks/pre-push.disabled
```

To skip a hook for a single push:

```bash
git push --no-verify
```

## Updating Hooks

When hooks are updated in the repository:

1. Pull the latest changes
2. Re-run the installation script:
   ```bash
   ./tools/scripts/setup_hooks.sh
   ```

## Documentation

For more details about the release notes automation:
- See `scripts/README.md` - Full setup and usage guide
- See `CLAUDE.md` - Git hooks section with workflow details

## Notes

- Hooks in `.git/hooks/` are **not** tracked by git (by design)
- This `hooks/` directory **is** tracked, serving as a template repository
- Each developer must install hooks on their local machine
- The pre-push hook is designed to be non-blocking - it will warn but not prevent pushes if requirements are missing
