#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cp -R "$root/." "$tmp/repo"
verified="$tmp/verified"
mkdir "$verified"
version=1.2.3
commit=0123456789abcdef0123456789abcdef01234567
names=(
  "jackin-${version}-aarch64-apple-darwin.tar.gz"
  "jackin-${version}-x86_64-apple-darwin.tar.gz"
  "jackin-${version}-aarch64-unknown-linux-gnu.tar.gz"
  "jackin-${version}-x86_64-unknown-linux-gnu.tar.gz"
  "jackin-capsule-${version}-aarch64-unknown-linux-gnu.tar.gz"
  "jackin-capsule-${version}-x86_64-unknown-linux-gnu.tar.gz"
  "jackin-desktop-${version}-aarch64-apple-darwin.zip"
)
: > "$tmp/assets.jsonl"
for name in "${names[@]}"; do
  printf 'fixture-%s\n' "$name" > "$verified/$name"
  digest=$(shasum -a 256 "$verified/$name" | awk '{print $1}')
  jq -cn --arg name "$name" --arg sha256 "$digest" '{name:$name,sha256:$sha256}' >> "$tmp/assets.jsonl"
done
jq -Sn --arg source_repository jackin-project/jackin --arg source_ref refs/tags/v$version \
  --arg source_commit "$commit" --arg version "$version" --slurpfile assets "$tmp/assets.jsonl" \
  '{schema:"velnor.package-release.v1",source_repository:$source_repository,source_ref:$source_ref,source_commit:$source_commit,version:$version,assets:$assets}' > "$verified/release-manifest.json"
jq -Sn --arg source_repository jackin-project/jackin --arg source_ref refs/tags/v$version \
  --arg source_digest "$commit" --slurpfile manifest "$verified/release-manifest.json" \
  '{source_repository:$source_repository,source_ref:$source_ref,source_digest:$source_digest,manifest:$manifest[0]}' > "$verified/identity.json"

(
  cd "$tmp/repo"
  VELNOR_VERIFIED_PACKAGE_DIR="$verified" ./scripts/package-update.sh
  shasum -a 256 Formula/jackin.rb Casks/jackin-desktop.rb > "$tmp/first.sha"
  VELNOR_VERIFIED_PACKAGE_DIR="$verified" ./scripts/package-update.sh
  shasum -a 256 -c "$tmp/first.sha"
  grep -F 'version "1.2.3"' Formula/jackin.rb
  grep -F 'version "1.2.3"' Casks/jackin-desktop.rb
  test "$(grep -h -c 'sha256 "[0-9a-f]\{64\}"' Formula/jackin.rb Casks/jackin-desktop.rb | awk '{n+=$1} END{print n}')" -eq 7
)

jq '.assets |= .[0:6]' "$verified/release-manifest.json" > "$tmp/bad.json"
mv "$tmp/bad.json" "$verified/release-manifest.json"
if (cd "$tmp/repo" && VELNOR_VERIFIED_PACKAGE_DIR="$verified" ./scripts/package-update.sh); then
  echo "incomplete release asset set was accepted" >&2
  exit 1
fi
