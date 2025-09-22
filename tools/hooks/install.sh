#!/usr/bin/env bash
set -euo pipefail
cp tools/hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Pre-commit Hook installiert."
