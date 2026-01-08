= finishing-bot: Release Readiness Validator
:toc: macro
:toc-title:
:toclevels: 3
:icons: font
:source-highlighter: pygments
:sectnums:

toc::[]

== Overview
`finishing-bot` is a **release readiness validation bot** in the https://gitlab.com/hyperpolymath[Hyperpolymath] ecosystem. It ensures repositories are **production-ready** by:
- Removing placeholders (e.g., `TODO`, `FIXME`)
- Validating licenses and compliance
- Verifying claims (e.g., documentation accuracy, test coverage)
- Enforcing **reversibility** and **extensibility** in release artifacts

`finishing-bot` is part of the https://gitlab.com/hyperpolymath/gitbot-fleet[Gitbot Fleet] and integrates with `repo-care` for **package manager interface** support.

=== Key Features
- **Placeholder Removal**: Automatically detects and removes or flags placeholders.
- **License Validation**: Ensures all dependencies and project files comply with specified licenses (AGPL-3.0-or-later, MIT, Palimpsest v0.4).
- **Claim Verification**: Cross-checks documentation, tests, and metadata for accuracy.
- **Automated Fixes**: Applies corrections via CI/CD pipelines.
- **Integration**: Works alongside `glambot` (presentation) and `rhodibot` (structural compliance).

== Architecture
`finishing-bot` operates as a standalone bot within the Gitbot Fleet:

[source]
----
                     GITBOT FLEET
   ┌──────────────────────────────────────────┐
   │                                          │
   │  ┌─────────┐  ┌─────────┐  ┌─────────┐  │
   │  │ rhodibot│  │echidna  │  │  oikos  │  │
   │  │(RSR     │  │(verify) │  │(eco/    │  │
   │  │ struct) │  │         │  │ econ)   │  │
   │  └────┬────┘  └────┬────┘  └────┬────┘  │
   │       │            │            │        │
   │       ▼            ▼            ▼        │
   │  ┌─────────────────────────────────────┐ │
   │  │        SHARED CONTEXT LAYER         │ │
   │  └─────────────────────────────────────┘ │
   │       │            │            │        │
   │       ▼            ▼            ▼        │
   │  ┌─────────┐  ┌─────────┐  ┌─────────┐  │
   │  │ glambot │  │ seambot │  │finishing│  │
   │  │(present │  │(integr) │  │  -bot   │  │
   │  │ ation)  │  │         │  │(release)│  │
   │  └─────────┘  └─────────┘  └─────────┘  │
   │                                          │
   └──────────────────────────────────────────┘
----

`finishing-bot` is a **satellite** of `git-dispatcher`, the central coordination hub for Git automation in the Hyperpolymath ecosystem.

== Use Cases
- **Pre-Release Audits**: Validates repositories before tagging/releases.
- **CI/CD Integration**: Runs as a pipeline step to block releases with unresolved issues.
- **Educational Use**: Helps students/teachers ensure project completeness and compliance.
- **Reversibility**: Logs all changes for rollback or review.

== Installation
`finishing-bot` is designed for **GitLab CI/CD** and local use:

1. **Add to your repository**:
   [source,bash]
   -----
   git submodule add https://gitlab.com/hyperpolymath/finishing-bot.git .finishing-bot
   -----

2. **Configure**:
   - Add a `.finishing-bot/config.yml` file:
     [source,yaml]
     -----
     licenses:
       allowed: [AGPL-3.0-or-later, MIT, Palimpsest-v0.4]
       strict: true
     placeholders:
       patterns: [TODO, FIXME, XXX]
       action: remove  # or "flag"
     claims:
       verify_docs: true
       verify_tests: true
     -----

3. **Automate with Just**:
   Include tasks in your `justfile`:
   [source]
   -----
   finishing-audit:
     @cd .finishing-bot && just audit

   finishing-fix:
     @cd .finishing-bot && just fix
   -----

== Usage
Run `finishing-bot` manually or in CI/CD:

[source,bash]
----
# Audit repository
just finishing-audit

# Apply automated fixes
just finishing-fix
----

== Configuration
Customize behavior via `.finishing-bot/config.yml`. See link:CONFIGURATION.adoc[Configuration Guide] for details.

== Documentation
- link:ROADMAP.adoc[Project Roadmap]
- link:CONFIGURATION.adoc[Configuration Guide]
- link:API.adoc[API Reference]
- link:licences/[Licenses]

== Integration with repo-care
`finishing-bot` supports the **package manager interface** project (`repo-care`):
- Validates **Rhodium Standard Repositories (RSR)** compliance.
- Ensures **SHA256/SHA-512** integrity for release artifacts.
- Logs actions to the **knowledge graph** for traceability.

== Automation
All tasks are managed via `just`. Run `just --list` for available commands.

== License
This project is licensed under:
- link:licences/AGPL-3.0-or-later.txt[AGPL-3.0-or-later]
- link:licences/MIT.txt[MIT]
- link:licences/Palimpsest-v0.4.txt[Palimpsest v0.4]

== Community
- link:CODE_OF_CONDUCT.adoc[Code of Conduct]
- link:GOVERNANCE.adoc[Governance]
- link:FUNDING.adoc[Funding & Sponsorship]

== Relationship to Gitbot Fleet
`finishing-bot` is one of several bots in the https://gitlab.com/hyperpolymath/gitbot-fleet[Gitbot Fleet]. For broader repository health, combine with:
- `rhodibot` (structural compliance)
- `glambot` (presentation quality)
- `echidnabot` (mathematical verification)
- `oikos` (ecological standards)
- `seambot` (integration health)

== Security
Security vulnerabilities should be reported via:
- **GitLab Issues** (private) or
- Email: `security@hyperpolymath.org` (PGP encrypted).
See link:SECURITY.adoc[Security Policy] for details.
