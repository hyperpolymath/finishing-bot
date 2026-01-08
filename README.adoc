= finishing-bot: Release Readiness Validator
:toc:
:toc-title: Contents
:toclevels: 3
:icons: font
:source-highlighter: pygments
:sectnums:

toc::[]

== Overview
`finishing-bot` is a **release readiness validation bot** in the https://gitlab.com/hyperpolymath[Hyperpolymath] ecosystem.
It ensures repositories are **production-ready** by:

- Removing placeholders (e.g., `TODO`, `FIXME`).
- Validating licenses and compliance.
- Verifying claims (e.g., documentation accuracy, test coverage).
- Enforcing **reversibility** and **extensibility** in release artifacts.

Part of the https://gitlab.com/hyperpolymath/gitbot-fleet[Gitbot Fleet], it integrates with `repo-care` for **package manager interface support**.

=== Key Features
- **Placeholder Removal**: Auto-detects/removes or flags placeholders.
- **License Validation**: Ensures compliance with `AGPL-3.0-or-later`, `MIT`, or `Palimpsest v0.4`.
- **Claim Verification**: Cross-checks docs, tests, and metadata.
- **Automated Fixes**: Applies corrections via CI/CD.
- **Integration**: Works with `glambot` (presentation) and `rhodibot` (structural compliance).

---
[subs="verbatim,quotes"]
....
          ┌──────────────────────────────────────────┐
          │                                      │
          │  ┌─────────┐     ┌─────────┐     ┌─────────┐  │
          │  │ rhodibot│     │ echidna │     │  oikos  │  │
          │  │ (RSR    │     │ (verify)│     │ (eco/   │  │
          │  │  struct)│     │         │     │  econ)  │  │
          │  └────┬────┘     └────┬────┘     └────┬────┘  │
          │       │              │              │       │
          │       ▼              ▼              ▼       │
          │  ┌─────────────────────────────────────┐   │
          │  │        SHARED CONTEXT LAYER         │   │
          │  └─────────────────────────────────────┘   │
          │       │              │              │       │
          │       ▼              ▼              ▼       │
          │  ┌─────────┐     ┌─────────┐     ┌─────────┐  │
          │  │ glambot │     │ seambot │     │finishing│  │
          │  │(present-│     │(integr- │     │ -bot    │  │
          │  │ ation)  │     │ ation)  │     │(release)│  │
          │  └─────────┘     └─────────┘     └─────────┘  │
          │                                      │
          └──────────────────────────────────────────┘
....

== Use Cases
- **Pre-Release Audits**: Validates repos before tagging/releases.
- **CI/CD Integration**: Blocks releases with unresolved issues.
- **Educational Use**: Helps students/teachers ensure project completeness.
- **Reversibility**: Logs all changes for rollback/review.

== Installation
For **GitLab CI/CD** or local use:

[source,bash]
----
git submodule add https://gitlab.com/hyperpolymath/finishing-bot.git .finishing-bot
----

=== Configuration
Add `.finishing-bot/config.yml`:
[source,yaml]
----
licenses:
  allowed: [AGPL-3.0-or-later, MIT, Palimpsest-v0.4]
  strict: true
placeholders:
  patterns: [TODO, FIXME, XXX]
  action: remove  # or "flag"
claims:
  verify_docs: true
  verify_tests: true
----

=== Automation with Just
Include in your `justfile`:
[source]
----
finishing-audit:
  @cd .finishing-bot && just audit

finishing-fix:
  @cd .finishing-bot && just fix
----

== Usage
Run manually or in CI/CD:
[source,bash]
----
# Audit repository
just finishing-audit

# Apply fixes
just finishing-fix
----

== Configuration
Customize via `.finishing-bot/config.yml`. See link:CONFIGURATION.adoc[Configuration Guide].

== Documentation
- link:ROADMAP.adoc[Project Roadmap]
- link:CONFIGURATION.adoc[Configuration Guide]
- link:API.adoc[API Reference]
- link:licences/[Licenses]

== Integration with `repo-care`
- Validates **Rhodium Standard Repositories (RSR)** compliance.
- Ensures **SHA256/SHA-512** integrity for release artifacts.
- Logs actions to the **knowledge graph** for traceability.

== License
- link:licences/AGPL-3.0-or-later.txt[AGPL-3.0-or-later]
- link:licences/MIT.txt[MIT]
- link:licences/Palimpsest-v0.4.txt[Palimpsest v0.4]

== Community
- link:CODE_OF_CONDUCT.adoc[Code of Conduct]
- link:GOVERNANCE.adoc[Governance]
- link:FUNDING.adoc[Funding]

== Relationship to Gitbot Fleet
`finishing-bot` is part of the https://gitlab.com/hyperpolymath/gitbot-fleet[Gitbot Fleet].
Combine with:
- `rhodibot` (structural compliance)
- `glambot` (presentation quality)
- `echidnabot` (mathematical verification)
- `oikos` (ecological standards)
- `seambot` (integration health)

== Security
Report vulnerabilities via:
- GitLab Issues (private) or
- Email: `security@hyperpolymath.org` (PGP encrypted).
See link:SECURITY.adoc[Security Policy].
