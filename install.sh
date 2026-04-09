#!/usr/bin/env bash
# install.sh — symlink selected commands into ~/.claude/commands/
#
# Run this once after cloning. Re-run after adding new commands you want global.
# Only promotes the commands you explicitly list here — nothing is automatic.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_COMMANDS="$HOME/.claude/commands"

mkdir -p "$CLAUDE_COMMANDS"

symlink_command() {
  local src="$1"
  local name="$(basename "$src")"
  local dest="$CLAUDE_COMMANDS/$name"

  if [ -L "$dest" ]; then
    echo "  already linked: $name"
  elif [ -e "$dest" ]; then
    echo "  skipped (file exists, not a symlink): $name"
  else
    ln -s "$src" "$dest"
    echo "  linked: $name → $dest"
  fi
}

echo "Linking commands to $CLAUDE_COMMANDS..."

# --- agent-skills commands (examples — add more from agent-skills/.claude/commands/) ---
symlink_command "$REPO_DIR/agent-skills/.claude/commands/spec.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/plan.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/build.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/test.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/review.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/ship.md"
# symlink_command "$REPO_DIR/agent-skills/.claude/commands/code-simplify.md"

# --- graphify ---
symlink_command "$REPO_DIR/graphify/graphify/skill.md"
# Note: graphify also requires `pip install graphifyy && graphify install`
# See graphify/README.md for full setup.

# --- custom skills (add your own below) ---
# symlink_command "$REPO_DIR/skills/my-skill/SKILL.md"

echo ""
echo "Done. Run 'ls $CLAUDE_COMMANDS' to see all active commands."
echo "To remove a link: rm $CLAUDE_COMMANDS/<name>"
