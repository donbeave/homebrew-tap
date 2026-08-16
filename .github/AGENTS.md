# GitHub workflow guidance

- Keep untrusted pull-request validation read-only, secretless, and isolated on
  GitHub-hosted runners.
- Pin every third-party action to a full commit SHA. Use least privilege,
  bounded concurrency, measured timeouts, and credential-free checkout.
- Install automation tooling through mise; never use Homebrew as a general
  tool installer. `brew` is allowed only where this tap must validate its own
  casks and formulas.
- Package updates are single-writer operations and must never cancel an active
  publication.
