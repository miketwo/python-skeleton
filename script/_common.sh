#!/usr/bin/env bash
set -euo pipefail

script_dir="$(
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1
  pwd -P
)"
root_dir="$(cd -- "$script_dir/.." >/dev/null 2>&1 && pwd -P)"

cd "$root_dir"

# Keep tool caches inside the repo so running under a filesystem sandbox works.
export UV_CACHE_DIR="${UV_CACHE_DIR:-$root_dir/.uv-cache}"

die() {
  echo "error: $*" 1>&2
  exit 1
}

need_cmd() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1 || die "missing '$cmd' in PATH"
}

ensure_uv() {
  if ! command -v uv >/dev/null 2>&1; then
    cat 1>&2 <<'EOF'
error: 'uv' is required but was not found in PATH.

Install uv:
  https://docs.astral.sh/uv/getting-started/installation/
EOF
    exit 1
  fi
}

sync_deps() {
  ensure_uv

  # Create/sync the project venv at `./.venv` and include the `dev` extra.
  # `uv sync --dev` refers to dependency-groups, not PEP 621 extras.
  # For local development, allow `uv` to update `uv.lock` if needed.
  # For CI, ensure the lockfile is respected and not modified.
  if [[ "${CI:-}" != "" ]]; then
    uv sync --extra dev --frozen --locked
  else
    uv sync --extra dev
  fi

  # Some environments can end up with non-executable venv entrypoints; fix up if needed.
  # This is safe even if the files don't exist.
  chmod +x .venv/bin/ruff .venv/bin/ptw 2>/dev/null || true
}
