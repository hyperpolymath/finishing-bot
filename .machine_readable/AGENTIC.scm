; SPDX-License-Identifier: AGPL-3.0-or-later
; AGENTIC.scm - AI agent patterns for finishing-bot
; Media-Type: application/vnd.agentic+scm

(agentic
  (version . "1.0.0")
  (project . "finishing-bot")

  (agent-capabilities
    (primary-function . "Validate project release readiness")
    (autonomy-level . "semi-autonomous")
    (human-oversight . "required-for-releases")
    (decision-scope . "validation-and-reporting"))

  (interaction-patterns
    ((pattern . "validate-on-pr")
     (trigger . "pull-request-opened")
     (action . "run-validation-suite")
     (output . "status-check-and-comment")
     (human-action . "review-and-merge"))

    ((pattern . "validate-on-release")
     (trigger . "release-created")
     (action . "run-full-validation")
     (output . "release-notes-annotation")
     (human-action . "publish-or-fix"))

    ((pattern . "cli-validation")
     (trigger . "developer-command")
     (action . "local-validation-run")
     (output . "terminal-report")
     (human-action . "fix-issues-before-push"))

    ((pattern . "scheduled-audit")
     (trigger . "cron-schedule")
     (action . "audit-all-repos")
     (output . "dashboard-update")
     (human-action . "prioritize-fixes")))

  (agent-constraints
    (never-auto-merge . #t)
    (never-modify-code . #t)
    (never-push-changes . #t)
    (require-human-approval-for . ("releases" "breaking-changes"))
    (max-retries . 3)
    (timeout-minutes . 10))

  (validation-checks
    (documentation
      ("README.adoc or README.md exists")
      ("LICENSE file present")
      ("SECURITY.md present")
      ("CONTRIBUTING.md present")
      ("CHANGELOG.md updated"))
    (code-quality
      ("Tests exist and pass")
      ("Coverage meets threshold")
      ("No security vulnerabilities")
      ("Linting passes"))
    (ci-cd
      ("Workflows have permissions")
      ("Actions are SHA-pinned")
      ("SPDX headers present")
      ("Security scanning enabled"))
    (repository
      ("Branch protection enabled")
      ("Signed commits required")
      ("Description matches README")
      ("Topics configured")))

  (mcp-integration
    (server-type . "tool-provider")
    (tools-exposed
      ("validate-project")
      ("check-readiness")
      ("generate-report")
      ("list-issues"))
    (resources-exposed
      ("validation-results")
      ("check-definitions")
      ("project-status"))))
