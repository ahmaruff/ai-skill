#!/usr/bin/env bash
# Sync this repo's skills, commands, and AGENTS.md into opencode's global config.
#
# Usage:
#   bin/sync.sh          create / refresh symlinks, prune stale ones
#   bin/sync.sh --check  report drift only; exit non-zero if anything is out of sync
#
# Override the destination with OPENCODE_CONFIG_DIR (default: ~/.config/opencode).
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}"
CHECK=0
[[ "${1:-}" == "--check" ]] && CHECK=1

if [[ ! -d "$DEST" ]]; then
  echo "opencode config dir not found: $DEST" >&2
  echo "create it first, or set OPENCODE_CONFIG_DIR" >&2
  exit 1
fi

drift=0

link() {
  local src="$1" dst="$2"
  if [[ "$CHECK" == "1" ]]; then
    if [[ -L "$dst" && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
      return 0
    fi
    printf 'drift: %s -> %s\n' "$dst" "$src" >&2
    drift=1
    return 0
  fi
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    printf 'refusing to overwrite non-symlink: %s\n' "$dst" >&2
    return 1
  fi
  ln -sfn "$src" "$dst"
  printf 'linked: %s -> %s\n' "$dst" "$src"
}

# Remove symlinks that point into this repo but whose target no longer exists.
prune() {
  local dir="$1" l target
  for l in "$dir"/*; do
    [[ -L "$l" ]] || continue
    target="$(readlink "$l")"
    [[ "$target" == "$REPO"/* ]] || continue
    [[ -e "$l" ]] && continue
    if [[ "$CHECK" == "1" ]]; then
      printf 'stale: %s\n' "$l" >&2
      drift=1
    else
      rm -f "$l"
      printf 'pruned: %s\n' "$l"
    fi
  done
}

link "$REPO/core/AGENTS.md" "$DEST/AGENTS.md"

for dir in "$REPO"/core/skills/*/; do
  [[ -d "$dir" ]] || continue
  link "${dir%/}" "$DEST/skills/$(basename "$dir")"
done

for f in "$REPO"/core/command/*.md; do
  [[ -e "$f" ]] || continue
  link "$f" "$DEST/command/$(basename "$f")"
done

prune "$DEST/skills"
prune "$DEST/command"

if [[ "$CHECK" == "1" ]]; then
  if [[ "$drift" == "1" ]]; then
    echo "drift detected; run bin/sync.sh" >&2
    exit 1
  fi
  echo "up to date"
fi
