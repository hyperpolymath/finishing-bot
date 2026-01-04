; SPDX-License-Identifier: AGPL-3.0-or-later
; STATE.scm - Project state tracking for finishing-bot
; Media-Type: application/state+scheme

(define state
  '((metadata
      (version . "0.1.0")
      (schema-version . "1.0.0")
      (created . "2026-01-04")
      (updated . "2026-01-04")
      (project . "finishing-bot")
      (repo . "github.com/hyperpolymath/finishing-bot"))

    (project-context
      (name . "finishing-bot")
      (tagline . "Release readiness validation and completion assistant")
      (description . "Automated bot validating project release readiness")
      (tech-stack
        (primary . ("ReScript" "Deno"))
        (secondary . ("Rust" "Bash"))
        (infrastructure . ("GitHub Actions" "Docker"))))

    (current-position
      (phase . "inception")
      (overall-completion . 0)
      (components
        ((name . "core-validator") (status . "not-started") (completion . 0))
        ((name . "check-registry") (status . "not-started") (completion . 0))
        ((name . "report-generator") (status . "not-started") (completion . 0))
        ((name . "github-integration") (status . "not-started") (completion . 0))
        ((name . "cli-interface") (status . "not-started") (completion . 0))
        ((name . "bot-service") (status . "not-started") (completion . 0)))
      (working-features . ()))

    (route-to-mvp
      (milestones
        ((id . "m1-foundation") (name . "Foundation") (target-date . "2026-01-31"))
        ((id . "m2-core-checks") (name . "Core Checks") (target-date . "2026-02-28"))
        ((id . "m3-ci-checks") (name . "CI/CD Checks") (target-date . "2026-03-31"))
        ((id . "m4-integration") (name . "GitHub Integration") (target-date . "2026-04-30"))
        ((id . "m5-mvp") (name . "MVP Release") (target-date . "2026-05-31"))))

    (blockers-and-issues
      (critical . ())
      (high ((id . "b1") (description . "Repository empty - needs initialization")))
      (medium . ())
      (low . ()))

    (critical-next-actions
      (immediate ("Initialize project structure" "Create README.adoc"))
      (this-week ("Implement first validation check"))
      (this-month ("Complete foundation milestone")))))
