#!/bin/bash

# Coverage report script for Flutter packages
# Generates line and branch coverage percentages using lcov

# Don't exit on error - we'll handle errors explicitly
set +e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Coverage exclusion patterns
EXCLUDE_PATTERNS=(
    '*_page.dart'
    '*_body.dart'
    '*_localizations.dart'
    '*_localizations_*.dart'
    '*.g.dart'
    '**/ui/**.dart'
    'gs1/**.dart'
)

# Get the root directory
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

echo -e "${BOLD}${BLUE}Flutter Coverage Report${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "Excluding files: ${YELLOW}${EXCLUDE_PATTERNS[*]}${NC}"
echo ""

# Check if lcov and genhtml are installed
if ! command -v lcov &> /dev/null; then
    echo -e "${YELLOW}Warning: lcov is not installed.${NC}"
    echo "Install with: brew install lcov (macOS) or apt-get install lcov (Linux)"
    echo "Continuing without branch coverage data and HTML reports..."
    echo ""
    HAS_LCOV=false
    HAS_GENHTML=false
else
    HAS_LCOV=true
    if ! command -v genhtml &> /dev/null; then
        echo -e "${YELLOW}Warning: genhtml is not installed.${NC}"
        echo "Install with: brew install lcov (macOS) or apt-get install lcov (Linux)"
        echo "Continuing without HTML reports..."
        echo ""
        HAS_GENHTML=false
    else
        HAS_GENHTML=true
    fi
fi

# Find all packages with test directories
PACKAGES=($(find packages -name "test" -type d -exec dirname {} \; | sort))

if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo -e "${RED}No packages with tests found${NC}"
    exit 1
fi

# Temporary file to store results
RESULTS_FILE=$(mktemp)
trap "rm -f $RESULTS_FILE" EXIT

# Process each package
for PACKAGE_DIR in "${PACKAGES[@]}"; do
    PACKAGE_NAME=$(basename "$PACKAGE_DIR")

    echo -e "${BLUE}Processing${NC} $PACKAGE_NAME..."

    cd "$ROOT_DIR/$PACKAGE_DIR"

    # Clean previous coverage
    rm -rf coverage

    # Run tests with coverage
    if fvm flutter test --coverage --coverage-path=coverage/lcov.info > /dev/null 2>&1; then
        if [ -f "coverage/lcov.info" ]; then
            # Filter out excluded files if lcov is available
            if [ "$HAS_LCOV" = true ]; then
                # Count original files for verification
                ORIGINAL_COUNT=$(grep -c "^SF:" coverage/lcov.info 2>/dev/null || echo "0")

                # Remove excluded files
                lcov --remove coverage/lcov.info \
                    "${EXCLUDE_PATTERNS[@]}" \
                    -o coverage/lcov_filtered.info --quiet 2>&1 | grep -v "^Removing" > /dev/null

                # Use filtered file if it exists, otherwise use original
                if [ -f "coverage/lcov_filtered.info" ]; then
                    LCOV_FILE="coverage/lcov_filtered.info"
                    # Count filtered files to show how many were removed
                    FILTERED_COUNT=$(grep -c "^SF:" coverage/lcov_filtered.info 2>/dev/null || echo "0")
                    REMOVED_COUNT=$((ORIGINAL_COUNT - FILTERED_COUNT))
                    if [ "$REMOVED_COUNT" -gt 0 ]; then
                        echo -e "  ${YELLOW}Filtered out $REMOVED_COUNT file(s)${NC}"
                    fi
                else
                    LCOV_FILE="coverage/lcov.info"
                fi

                SUMMARY=$(lcov --summary "$LCOV_FILE" 2>&1)

                # Extract line coverage percentage
                LINE_PCT=$(echo "$SUMMARY" | grep "lines" | grep -o '[0-9.]*%' | head -1 | tr -d '%' || echo "0.0")

                # Extract branch coverage percentage
                BRANCH_PCT=$(echo "$SUMMARY" | grep "branches" | grep -o '[0-9.]*%' | head -1 | tr -d '%' || echo "0.0")

                # Generate HTML report for this package
                if [ "$HAS_GENHTML" = true ]; then
                    genhtml "$LCOV_FILE" \
                        --output-directory coverage/html \
                        --title "Coverage Report - $PACKAGE_NAME" \
                        --legend \
                        --ignore-errors source \
                        --filter missing \
                        --quiet > /dev/null 2>&1
                fi
            else
                # Fallback: calculate line coverage manually from lcov.info
                TOTAL_LINES=$(grep -c "^DA:" coverage/lcov.info 2>/dev/null || echo "0")
                COVERED_LINES=$(grep "^DA:" coverage/lcov.info 2>/dev/null | grep -v ",0$" | wc -l | tr -d ' ')

                if [ "$TOTAL_LINES" -gt 0 ]; then
                    LINE_PCT=$(awk "BEGIN {printf \"%.1f\", ($COVERED_LINES / $TOTAL_LINES) * 100}")
                else
                    LINE_PCT="0.0"
                fi
                BRANCH_PCT="N/A"
            fi

            # Store results in temp file
            echo "$PACKAGE_NAME|$LINE_PCT|$BRANCH_PCT" >> "$RESULTS_FILE"
        else
            echo -e "${RED}  ✗ No coverage data generated${NC}"
            echo "$PACKAGE_NAME|N/A|N/A" >> "$RESULTS_FILE"
        fi
    else
        echo -e "${RED}  ✗ Tests failed${NC}"
        echo "$PACKAGE_NAME|N/A|N/A" >> "$RESULTS_FILE"
    fi

    cd "$ROOT_DIR"
done

echo ""
echo -e "${BOLD}${BLUE}Coverage Summary${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Print table header
printf "${BOLD}%-25s | %15s | %15s${NC}\n" "Package" "Line Coverage" "Branch Coverage"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Print results sorted by package name
SORTED_RESULTS=$(mktemp)
sort "$RESULTS_FILE" > "$SORTED_RESULTS"

while IFS='|' read -r PACKAGE_NAME LINE_PCT BRANCH_PCT; do
    # Skip empty lines
    [ -z "$PACKAGE_NAME" ] && continue

    # Color code based on coverage percentage
    if [ "$LINE_PCT" != "N/A" ] && [ -n "$LINE_PCT" ]; then
        LINE_VAL=$(echo "$LINE_PCT" | awk '{printf "%.0f", $1}' 2>/dev/null || echo "0")
        if [ "$LINE_VAL" -ge 80 ]; then
            LINE_COLOR=$GREEN
        elif [ "$LINE_VAL" -ge 60 ]; then
            LINE_COLOR=$YELLOW
        else
            LINE_COLOR=$RED
        fi
        LINE_DISPLAY="${LINE_PCT}%"
    else
        LINE_COLOR=$NC
        LINE_DISPLAY="N/A"
    fi

    if [ "$BRANCH_PCT" != "N/A" ] && [ -n "$BRANCH_PCT" ]; then
        BRANCH_VAL=$(echo "$BRANCH_PCT" | awk '{printf "%.0f", $1}' 2>/dev/null || echo "0")
        if [ "$BRANCH_VAL" -ge 80 ]; then
            BRANCH_COLOR=$GREEN
        elif [ "$BRANCH_VAL" -ge 60 ]; then
            BRANCH_COLOR=$YELLOW
        else
            BRANCH_COLOR=$RED
        fi
        BRANCH_DISPLAY="${BRANCH_PCT}%"
    else
        BRANCH_COLOR=$NC
        BRANCH_DISPLAY="N/A"
    fi

    printf "%-25s | ${LINE_COLOR}%15s${NC} | ${BRANCH_COLOR}%15s${NC}\n" \
        "$PACKAGE_NAME" "$LINE_DISPLAY" "$BRANCH_DISPLAY"
done < "$SORTED_RESULTS"

rm -f "$SORTED_RESULTS"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Calculate overall coverage
if [ "$HAS_LCOV" = true ]; then
    echo -e "${BLUE}Calculating overall coverage...${NC}"

    # Combine all filtered lcov files
    COMBINED_LCOV="$ROOT_DIR/coverage/combined.info"
    mkdir -p "$ROOT_DIR/coverage"
    rm -f "$COMBINED_LCOV"

    for PACKAGE_DIR in "${PACKAGES[@]}"; do
        # Prefer filtered file if it exists, otherwise use original
        if [ -f "$PACKAGE_DIR/coverage/lcov_filtered.info" ]; then
            cat "$PACKAGE_DIR/coverage/lcov_filtered.info" >> "$COMBINED_LCOV"
        elif [ -f "$PACKAGE_DIR/coverage/lcov.info" ]; then
            cat "$PACKAGE_DIR/coverage/lcov.info" >> "$COMBINED_LCOV"
        fi
    done

    if [ -f "$COMBINED_LCOV" ]; then
        OVERALL_SUMMARY=$(lcov --summary "$COMBINED_LCOV" 2>&1)
        OVERALL_LINE=$(echo "$OVERALL_SUMMARY" | grep "lines" | grep -o '[0-9.]*%' | head -1 | tr -d '%' || echo "0.0")
        OVERALL_BRANCH=$(echo "$OVERALL_SUMMARY" | grep "branches" | grep -o '[0-9.]*%' | head -1 | tr -d '%' || echo "N/A")

        # Validate branch coverage value
        if [ -z "$OVERALL_BRANCH" ] || [ "$OVERALL_BRANCH" = "N/A" ]; then
            OVERALL_BRANCH="N/A"
            BRANCH_DISPLAY="N/A"
        else
            BRANCH_DISPLAY="${OVERALL_BRANCH}%"
        fi

        echo ""
        echo -e "${BOLD}Overall Project Coverage:${NC}"
        echo -e "  Lines:    ${GREEN}${OVERALL_LINE}%${NC}"
        echo -e "  Branches: ${GREEN}${BRANCH_DISPLAY}${NC}"

        # Note: Overall HTML report not generated due to multi-package structure
        # Individual package HTML reports are available (see below)
    fi
fi

echo ""
echo -e "${GREEN}✓ Coverage report complete${NC}"

# Display HTML report locations if generated
if [ "$HAS_GENHTML" = true ]; then
    echo ""
    echo -e "${BOLD}${BLUE}HTML Coverage Reports:${NC}"

    # Overall report
    if [ -f "$ROOT_DIR/coverage/html/index.html" ]; then
        echo -e "  ${GREEN}●${NC} Overall: ${BLUE}http://localhost:63342/fishbowl/coverage/html/index.html${NC}"
    fi

    # Package reports
    for PACKAGE_DIR in "${PACKAGES[@]}"; do
        PACKAGE_NAME=$(basename "$PACKAGE_DIR")
        if [ -f "$PACKAGE_DIR/coverage/html/index.html" ]; then
            echo -e "  ${GREEN}●${NC} $PACKAGE_NAME: ${BLUE}http://localhost:63342/fishbowl/packages/$PACKAGE_NAME/coverage/html/index.html${NC}"
        fi
    done
fi

echo ""

# Legend
echo -e "${BOLD}Legend:${NC}"
echo -e "  ${GREEN}●${NC} >= 80% (Good)"
echo -e "  ${YELLOW}●${NC} >= 60% (Fair)"
echo -e "  ${RED}●${NC} < 60% (Needs Improvement)"
echo ""