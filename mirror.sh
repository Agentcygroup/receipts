#!/usr/bin/env bash
set -euo pipefail
# args: <repo-name> <sha> <local-repo-dir>
repo="$1"; sha="$2"; src="$3"
dest="Agentcygroup/$repo/$sha"
mkdir -p "$dest"
cp -r "$src/receipts/." "$dest/" 2>/dev/null || true
git add "$dest"
git -c user.email=ci@x -c user.name=ci commit -q -m "receipts: $repo@$sha" || true
git push origin main
