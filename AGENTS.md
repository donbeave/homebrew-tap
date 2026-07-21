# AGENTS.md — homebrew-tap

Homebrew formulae and casks for jackin❯. **This repo is public.** Every `brew install jackin`, `brew install jackin@preview`, or future `brew install --cask jackin-usage-menu-bar` reads exactly what's in `Formula/*.rb` or `Casks/*.rb`. Poisoning a formula or cask is a supply-chain attack on every downstream user.

Treat every commit here as a change to software that will run on other people's machines.

## Threat model

Unlike a secrets-rich repo, the surface here is narrow but sharp:

1. **Artifact integrity** — for formulas and casks, `url` + `sha256` together define what gets installed. If they mismatch or either is manipulated, users get arbitrary code. A mismatch is catastrophic because `brew` trusts the sha256 blindly.
2. **Mutable ref anchoring** — formulas and casks must pin to immutable references (tagged release archive, full commit SHA in `/archive/<sha>.tar.gz`, or a release asset attached to an immutable tag). A URL pointing at a branch HEAD or a floating "latest" asset allows silent tampering upstream.
3. **Automation hijack** — the preview formula is auto-bumped by CI in the `jackin` repo. If that automation's token leaks, attackers push poisoned previews. The blast radius covers every user on the `@preview` channel. The first native cask must never be auto-merged by a secrets-bearing job.
4. **Upstream tag immutability** — stable formula and cask pins depend on protected tags. If tags aren't protected on `jackin`, a force-move silently changes what users install next.
5. **Native app casks** — a macOS cask that ships a signed app is only as trustworthy as post-fetch checks (Developer ID signature, notarization staple, universal slices, bundle ID, minimum OS) and human review of structural cask changes.

## Hard rules (do not break these)

1. **Never change `url` without recomputing `sha256` in the same commit** (formulas and casks). A mismatched pair is the single most catastrophic packaging bug.
2. **Never commit a formula or cask whose `url` targets a mutable ref** (branch HEAD, `main`, floating "latest"). Only tagged release archives, full commit SHAs, or immutable tagged release assets are acceptable.
3. **Never hand-edit `Formula/jackin-preview.rb`.** This file is owned by CI in the `jackin` repo. Manual edits here are either a mistake or an attempt to bypass the automation — both warrant a PR review and confirmation from the original bumper.
4. **Never commit credentials.** There should be none in this repo at all. If the credential scan below ever fires, something is very wrong — rotate and investigate.
5. **Cask-specific:** a cask may reference only an immutable tagged release asset; the cask `sha256` must equal the release `.sha256` sidecar; after fetch, verify Developer ID signature, notarization staple, bundle ID, universal slices, and minimum OS. Structural cask changes (token, app path, caveats, install strategy) require human review. Only mechanical version/SHA bumps may later use auto-merge — the first cask never auto-merges.

## Required pre-commit checks

Run all three before every `git commit`:

```bash
# 1. What's staged? Anything surprising?
git status --porcelain

# 2. For any changed formula or cask, verify url/sha256 pair via brew
#    (null-delimited so paths with spaces are safe)
git diff --cached --name-only -z -- 'Formula/*.rb' 'Casks/*.rb' |
  while IFS= read -r -d '' f; do
    if [[ "$f" == Formula/* ]]; then
      brew fetch --retry --force "./$f" || { echo "FAIL: $f"; exit 1; }
    elif [[ "$f" == Casks/* ]]; then
      brew fetch --cask --retry --force "./$f" || { echo "FAIL: $f"; exit 1; }
    fi
  done

# 3. Defense-in-depth credential scan — should always be empty
git diff --cached --name-only -z | xargs -0 -r \
  grep -l -iE "ghp_|gho_|ghs_|ghr_|github_pat_|BEGIN [A-Z ]*PRIVATE KEY|aws_access_key_id|aws_secret_access_key|bearer [a-z0-9-]{20,}" 2>/dev/null
```

`brew fetch` / `brew fetch --cask` downloads the archive and verifies its sha256 against what the package declares. A failure means either the archive changed upstream (investigate for tampering) or the committed sha256 is wrong (recompute from source).

## Upstream tag protection

Every formula pins to an artifact on `github.com/jackin-project/jackin`. That repo's rulesets must be intact for these formulas to remain trustworthy. Verify periodically:

```bash
gh api repos/jackin-project/jackin/rulesets --jq '[.[] | {name, target, enforcement}]'
```

Expected (as of 2026-04-16, applied via `jackin-github-terraform` Terraform config):

```json
[
  {"name": "protect-main", "target": "branch", "enforcement": "active"},
  {"name": "protect-tags", "target": "tag",    "enforcement": "active"}
]
```

The `protect-tags` ruleset covers `~ALL` tag names with `non_fast_forward = true` and `deletion = true` — so no tag can be force-moved or deleted once created. Keep checking it even while the stable formula is disabled; it matters again when jackin publishes its first stable release.

## Who commits here

Most commits are automated (CI in `jackin` bumps `Formula/jackin-preview.rb` on every build — 400+ commits to date). Manual commits should be rare and should:

- Update the stable `Formula/jackin.rb` only when intentionally changing the disabled stable placeholder or publishing the first stable formula (preview is CI-managed)
- Go through a PR even though no reviewer is required by the ruleset
- Carry a descriptive Conventional Commits message

## Conventions

- Branch naming: `chore/*`, `feat/*`, `fix/*`
- Commit messages: see [Commit Messages](#commit-messages) section below
- `main` is the primary branch
- All changes go through PR (required by the self-referential ruleset)

## Merge boundary for native casks (Plan 003)

Required check name before merging any cask PR (especially the first
`Casks/jackin-usage-menu-bar.rb`):

- **`cask-validation / Cask validation`** (workflow `cask-validation.yml`)

If the repository ruleset is managed outside this repo (for example
`jackin-github-terraform`), configure that ruleset to require the check above
before merge. Do not enable auto-merge for the first cask. Mechanical
version/SHA bumps may receive auto-merge later only after human approval of
the structural cask.

```bash
# Read back rulesets (may be owned externally):
gh api repos/jackin-project/homebrew-tap/rulesets --jq '[.[] | {name, target, enforcement}]'
```

## What this does NOT protect against

- A compromised `jackin` release process upstream — if the archive is tampered with *before* sha256 is computed and committed here, this repo can't catch it. Mitigation lives in `jackin`'s release pipeline.
- A compromised `jackin-project` org owner force-moving a tag — mitigated by upstream tag rulesets, not by this repo.
- Ruby-level malice in formula or cask code (e.g., `install` doing something unexpected) — out of scope here; relies on PR review and `brew audit` / cask-validation sanity checks.

## Commit Messages

All commits in this repository MUST follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

Subject format: `<type>[optional scope][!]: <description>`

Allowed types:

| Type       | Use for                                                |
| ---------- | ------------------------------------------------------ |
| `feat`     | New user-visible feature                               |
| `fix`      | Bug fix                                                |
| `docs`     | Documentation-only change                              |
| `style`    | Formatting, whitespace; no logic change                |
| `refactor` | Internal restructuring; no behavior change             |
| `perf`     | Performance improvement                                |
| `test`     | Adding or updating tests                               |
| `build`    | Build system, tooling, dependencies                    |
| `ci`       | CI configuration                                       |
| `chore`    | Routine maintenance (release, merge, deps)             |
| `revert`   | Reverts a prior commit                                 |

Scope is optional but encouraged when it clarifies the change area.

Breaking changes use `!` after the type/scope (`feat!:` or `feat(api)!:`) and include a `BREAKING CHANGE:` footer in the body.

PR squash-merge: the PR title becomes the commit subject, so PR titles must also follow this convention.

**Exception**: the 91+ release-bot commits matching `jackin@preview <version>+<sha>` (auto-generated by upstream `jackin` CI) are exempt from this format — they embed a SHA cross-reference back to the originating jackin build and the format is fixed by the bot.
