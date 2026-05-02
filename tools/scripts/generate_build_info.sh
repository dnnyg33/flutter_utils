#!/bin/bash

# Generates a Dart file containing build-time metadata (currently: the git branch).
#
# Resolution order for the branch name:
#   1. $CI_COMMIT_REF_NAME (set by GitLab CI)
#   2. $GIT_BRANCH (manual override)
#   3. `git rev-parse --abbrev-ref HEAD`
#
# The output file is gitignored and regenerated on `melos bootstrap`, via the
# `gen:build-info` melos script, and by the post-checkout git hook.

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUTPUT="$REPO_ROOT/packages/settings/lib/src/general_settings/build_info.g.dart"

BRANCH="${CI_COMMIT_REF_NAME:-${GIT_BRANCH:-}}"
if [ -z "$BRANCH" ]; then
  BRANCH="$(git -C "$REPO_ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")"
fi

# Escape single quotes for safe embedding in a Dart single-quoted string literal.
ESCAPED_BRANCH="${BRANCH//\'/\\\'}"

mkdir -p "$(dirname "$OUTPUT")"
cat > "$OUTPUT" <<EOF
// GENERATED FILE. DO NOT EDIT MANUALLY.
// Regenerate via: melos gen:build-info

const String kGitBranch = '$ESCAPED_BRANCH';
EOF

echo "✅ Wrote $OUTPUT (GIT_BRANCH='$BRANCH')"
