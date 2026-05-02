#!/usr/bin/env python3
"""
Generate AI-powered release notes from git commits.

Usage: python3 tools/scripts/generate_release_notes.py <branch_name>
Environment: ANTHROPIC_API_KEY_CI must be set
"""

import sys
import subprocess
import json
import os
import re
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError


def get_commits(base_branch="develop"):
    """
    Get list of commits on current branch vs base branch.

    Args:
        base_branch: Branch to compare against (default: develop)

    Returns:
        List of commit strings in format "hash subject"

    Raises:
        subprocess.CalledProcessError: If git command fails
    """
    try:
        # Get commits from base_branch to HEAD
        result = subprocess.run(
            ["git", "log", f"{base_branch}..HEAD", "--format=%h %s"],
            capture_output=True,
            text=True,
            check=True
        )

        commits = [line.strip() for line in result.stdout.strip().split("\n") if line.strip()]
        return commits

    except subprocess.CalledProcessError as e:
        print(f"❌ Error getting commits: {e.stderr}")
        raise


def call_claude_api(commits):
    """
    Call Claude API to generate release notes summary.

    Args:
        commits: List of commit strings

    Returns:
        API response text with bullet points

    Raises:
        Exception: If API call fails
    """
    api_key = os.environ.get("ANTHROPIC_API_KEY_CI")
    if not api_key:
        raise Exception("ANTHROPIC_API_KEY_CI environment variable not set")

    # Build prompt
    commit_list = "\n".join(commits)
    prompt = f"""Analyze these git commits from a feature branch and generate up to 5 brief bullet points summarizing the main highlights.

Focus on user-facing changes, new features, bug fixes, and significant improvements. Keep each bullet point concise (one line).

Commits:
{commit_list}

Format: Return only the bullet points as markdown (start each line with "- ").
"""

    # Build API request
    url = "https://api.anthropic.com/v1/messages"
    headers = {
        "x-api-key": api_key,
        "anthropic-version": "2023-06-01",
        "content-type": "application/json"
    }

    data = {
        "model": "claude-sonnet-4-5-20250929",
        "max_tokens": 500,
        "temperature": 0.7,
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ]
    }

    try:
        # Make request
        request = Request(
            url,
            data=json.dumps(data).encode("utf-8"),
            headers=headers
        )

        with urlopen(request, timeout=30) as response:
            response_data = json.loads(response.read().decode("utf-8"))

        # Extract text from response
        content = response_data.get("content", [])
        if content and len(content) > 0:
            return content[0].get("text", "")

        raise Exception("Empty response from Claude API")

    except HTTPError as e:
        error_body = e.read().decode("utf-8")
        raise Exception(f"API request failed: {e.code} {e.reason}\n{error_body}")

    except URLError as e:
        raise Exception(f"Network error: {e.reason}")

    except Exception as e:
        raise Exception(f"API call failed: {str(e)}")


def parse_bullets(response_text, max_bullets=5):
    """
    Parse bullet points from API response.

    Args:
        response_text: Raw API response text
        max_bullets: Maximum number of bullets to return (default: 5)

    Returns:
        List of bullet point strings (without leading "- ")

    Raises:
        Exception: If no valid bullets found
    """
    # Extract lines starting with "- "
    lines = response_text.strip().split("\n")
    bullets = []

    for line in lines:
        line = line.strip()
        # Match markdown bullets: "- text" or "* text"
        if line.startswith("- ") or line.startswith("* "):
            bullet_text = line[2:].strip()
            if bullet_text:
                bullets.append(bullet_text)

    if not bullets:
        raise Exception("No valid bullet points found in API response")

    # Truncate to max_bullets
    bullets = bullets[:max_bullets]

    return bullets


def update_release_notes(branch_name, bullets):
    """
    Update RELEASE_NOTES.txt with new branch section.

    If branch section exists, replace it. Otherwise, prepend new section.

    Args:
        branch_name: Name of the feature branch
        bullets: List of bullet point strings

    Raises:
        Exception: If file operations fail
    """
    release_notes_path = "RELEASE_NOTES.txt"

    # Build new section
    section_header = f"## Feature: {branch_name}"
    section_content = section_header + "\n"
    for bullet in bullets:
        section_content += f"- {bullet}\n"
    section_content += "\n"

    # Read existing content
    try:
        with open(release_notes_path, "r") as f:
            existing_content = f.read()
    except FileNotFoundError:
        # File doesn't exist, create with new section
        with open(release_notes_path, "w") as f:
            f.write(section_content)
        print(f"✅ Created {release_notes_path} with new section")
        return

    # Check if branch section already exists
    section_pattern = re.compile(
        rf"^## Feature: {re.escape(branch_name)}$",
        re.MULTILINE
    )

    if section_pattern.search(existing_content):
        # Replace existing section
        # Find section boundaries (from ## Feature: branch to next ## or empty line after bullets)
        lines = existing_content.split("\n")
        new_lines = []
        in_section = False
        section_found = False
        empty_line_seen = False

        for i, line in enumerate(lines):
            if line == section_header.strip():
                # Start of our section - replace it
                if not section_found:
                    new_lines.append(section_content.rstrip())
                    section_found = True
                in_section = True
                empty_line_seen = False
            elif in_section:
                # We're in the section we want to replace
                if line.startswith("##"):
                    # Another feature section found - stop replacing
                    in_section = False
                    new_lines.append(line)
                elif line.strip() == "":
                    # Empty line - mark it but keep scanning
                    empty_line_seen = True
                elif empty_line_seen:
                    # Non-empty line after empty line - section ended
                    in_section = False
                    if empty_line_seen:
                        new_lines.append("")  # Add the empty line
                    new_lines.append(line)
                    empty_line_seen = False
                # else: content line in our section - skip (we're replacing)
            else:
                # Outside our section - keep line
                new_lines.append(line)

        updated_content = "\n".join(new_lines)

        with open(release_notes_path, "w") as f:
            f.write(updated_content)

        print(f"✅ Updated existing section in {release_notes_path}")

    else:
        # Prepend new section
        updated_content = section_content + existing_content

        with open(release_notes_path, "w") as f:
            f.write(updated_content)

        print(f"✅ Prepended new section to {release_notes_path}")


def main():
    """Main entry point."""
    if len(sys.argv) != 2:
        print("Usage: python3 generate_release_notes.py <branch_name>")
        sys.exit(1)

    branch_name = sys.argv[1]
    print(f"Generating release notes for branch: {branch_name}")

    # Get commits
    try:
        commits = get_commits("develop")
    except subprocess.CalledProcessError:
        print("❌ Failed to get commits from git")
        sys.exit(1)

    if not commits:
        print("ℹ️  No commits found on branch (vs develop), skipping")
        sys.exit(0)

    print(f"Found {len(commits)} commits")

    # Call Claude API
    try:
        print("🤖 Calling Claude API...")
        response = call_claude_api(commits)
        print("✅ API call successful")
    except Exception as e:
        print(f"❌ API call failed: {e}")
        sys.exit(1)

    # Parse bullets
    try:
        bullets = parse_bullets(response)
        print(f"✅ Parsed {len(bullets)} bullet points:")
        for i, bullet in enumerate(bullets, 1):
            print(f"  {i}. {bullet}")
    except Exception as e:
        print(f"❌ Failed to parse bullets: {e}")
        sys.exit(1)

    # Update RELEASE_NOTES.txt
    try:
        update_release_notes(branch_name, bullets)
    except Exception as e:
        print(f"❌ Failed to update RELEASE_NOTES.txt: {e}")
        sys.exit(1)

    print("🎉 Release notes generated successfully!")
    sys.exit(0)


if __name__ == "__main__":
    main()
