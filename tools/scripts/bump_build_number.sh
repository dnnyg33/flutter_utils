#!/bin/sh
# bump_build_number.sh
# Increments the build number (+N) in both pubspec.yaml files.
# Usage: ./tools/scripts/bump_build_number.sh

set -e

ROOT_PUBSPEC="pubspec.yaml"
STANDALONE_PUBSPEC="apps/standalone/pubspec.yaml"

# Read current version line from root pubspec
CURRENT_VERSION_LINE=$(grep '^version:' "$ROOT_PUBSPEC")
if [ -z "$CURRENT_VERSION_LINE" ]; then
  echo "ERROR: Could not find 'version:' line in $ROOT_PUBSPEC"
  exit 1
fi

# Extract the version string (e.g., 1.0.0+2)
CURRENT_VERSION=$(echo "$CURRENT_VERSION_LINE" | sed 's/^version:[[:space:]]*//' | sed 's/[[:space:]]*#.*//')
echo "Current version: $CURRENT_VERSION"

# Validate format: X.Y.Z+N
if ! echo "$CURRENT_VERSION" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+$'; then
  echo "ERROR: Version '$CURRENT_VERSION' does not match expected format X.Y.Z+N"
  exit 1
fi

# Extract parts
SEMVER=$(echo "$CURRENT_VERSION" | cut -d'+' -f1)
BUILD_NUMBER=$(echo "$CURRENT_VERSION" | cut -d'+' -f2)

# Increment
NEW_BUILD_NUMBER=$((BUILD_NUMBER + 1))
NEW_VERSION="${SEMVER}+${NEW_BUILD_NUMBER}"
echo "New version: $NEW_VERSION"

# Update root pubspec.yaml (preserves inline comment)
sed -i.bak "s|^version:.*|version: ${NEW_VERSION} #This needs to stay in sync with the version in standalone/pubspec.yaml|" "$ROOT_PUBSPEC"
rm -f "${ROOT_PUBSPEC}.bak"

# Update standalone pubspec.yaml (preserves inline comment)
sed -i.bak "s|^version:.*|version: ${NEW_VERSION} #this needs to stay in sync with the version in the root pubspec.yaml|" "$STANDALONE_PUBSPEC"
rm -f "${STANDALONE_PUBSPEC}.bak"

# Validate updates
ROOT_UPDATED=$(grep '^version:' "$ROOT_PUBSPEC" | sed 's/^version:[[:space:]]*//' | sed 's/[[:space:]]*#.*//')
STANDALONE_UPDATED=$(grep '^version:' "$STANDALONE_PUBSPEC" | sed 's/^version:[[:space:]]*//' | sed 's/[[:space:]]*#.*//')

if [ "$ROOT_UPDATED" != "$NEW_VERSION" ]; then
  echo "ERROR: Root pubspec update failed. Expected '$NEW_VERSION', got '$ROOT_UPDATED'"
  exit 1
fi

if [ "$STANDALONE_UPDATED" != "$NEW_VERSION" ]; then
  echo "ERROR: Standalone pubspec update failed. Expected '$NEW_VERSION', got '$STANDALONE_UPDATED'"
  exit 1
fi

echo "Successfully bumped build number: $CURRENT_VERSION -> $NEW_VERSION"
