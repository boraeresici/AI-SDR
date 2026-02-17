#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

errors=0

required_sections=(
  "# Purpose"
  "# Trigger Rules"
  "# Required Inputs"
  "# Input Completion Questions"
  "# Output Contract"
  "# Workflow"
  "# Decision Rules"
  "# Quality Gates"
  "# Handoff Contract"
  "# Anti-Patterns"
  "# Prompt Snippets"
  "# Spec Compatibility"
)

for f in skills/*/SKILL.md; do
  echo "Validating $f"

  # Frontmatter: must exist and only include name, description
  if [[ "$(sed -n '1p' "$f")" != "---" ]]; then
    echo "ERROR: $f missing starting frontmatter delimiter"
    errors=$((errors + 1))
    continue
  fi

  fm="$(awk 'NR==1 && $0=="---" {fm_in=1; next} fm_in && $0=="---" {exit} fm_in {print}' "$f")"
  if [[ -z "$fm" ]]; then
    echo "ERROR: $f has empty frontmatter"
    errors=$((errors + 1))
  fi

  extra_keys="$(printf '%s\n' "$fm" | sed -n 's/^\([a-zA-Z0-9_-]*\):.*/\1/p' | rg -v '^(name|description)$' || true)"
  if [[ -n "$extra_keys" ]]; then
    echo "ERROR: $f has unsupported frontmatter keys: $(echo "$extra_keys" | tr '\n' ' ')"
    errors=$((errors + 1))
  fi

  for key in name description; do
    if ! printf '%s\n' "$fm" | rg -q "^${key}:\s*.+"; then
      echo "ERROR: $f missing frontmatter key: $key"
      errors=$((errors + 1))
    fi
  done

  # Required section presence + order
  prev_line=0
  for section in "${required_sections[@]}"; do
    line="$(rg -n "^${section}$" "$f" | head -n1 | cut -d: -f1 || true)"
    if [[ -z "$line" ]]; then
      echo "ERROR: $f missing section: $section"
      errors=$((errors + 1))
      continue
    fi
    if (( line <= prev_line )); then
      echo "ERROR: $f section order invalid at: $section"
      errors=$((errors + 1))
    fi
    prev_line=$line
  done

  # Output contract must reference artifact path convention
  if ! rg -q 'artifacts/YYYY-MM-DD/' "$f"; then
    echo "ERROR: $f missing artifacts path convention (artifacts/YYYY-MM-DD/...)"
    errors=$((errors + 1))
  fi

  # Required navigation headings in markdown outputs
  if ! rg -q 'Next Skill' "$f"; then
    echo "ERROR: $f missing Next Skill heading requirement"
    errors=$((errors + 1))
  fi
  if ! rg -q 'Suggested Command' "$f"; then
    echo "ERROR: $f missing Suggested Command heading requirement"
    errors=$((errors + 1))
  fi

  # Recommended policy checks promoted by repository standards
  if ! rg -q 'Standalone template:' "$f"; then
    echo "ERROR: $f missing Standalone template prompt snippet"
    errors=$((errors + 1))
  fi
  if ! rg -q '^Skill Version: v[0-9]+\.[0-9]+\.[0-9]+' "$f"; then
    echo "ERROR: $f missing Skill Version marker (Skill Version: vX.Y.Z)"
    errors=$((errors + 1))
  fi
  if ! rg -q '^# Handoff Validation Checklist$' "$f"; then
    echo "ERROR: $f missing Handoff Validation Checklist section"
    errors=$((errors + 1))
  fi

done

if (( errors > 0 )); then
  echo "Validation failed with $errors issue(s)."
  exit 1
fi

echo "All skills validated successfully."
