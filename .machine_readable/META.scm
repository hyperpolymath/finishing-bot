; SPDX-License-Identifier: AGPL-3.0-or-later
; META.scm - Architecture decisions and development practices for finishing-bot
; Media-Type: application/meta+scheme

(define meta
  '((architecture-decisions
      ((adr-001
        (title . "Use ReScript for type-safe validation logic")
        (status . "accepted")
        (date . "2026-01-04")
        (context . "Need a type-safe language that compiles to JavaScript for validation checks that can run in Deno and browser contexts")
        (decision . "Use ReScript as primary language with ES6 module output")
        (consequences . ("Type-safe code" "Better refactoring" "Smaller bundle size" "ReScript expertise required")))

      (adr-002
        (title . "Use Deno as runtime instead of Node.js")
        (status . "accepted")
        (date . "2026-01-04")
        (context . "Need a secure runtime for executing validation checks with built-in TypeScript support and modern APIs")
        (decision . "Use Deno for all server-side code and CLI")
        (consequences . ("Built-in security sandbox" "No node_modules" "URL-based imports" "Native TypeScript support")))

      (adr-003
        (title . "Implement validation checks as composable functions")
        (status . "proposed")
        (date . "2026-01-04")
        (context . "Need a flexible architecture for adding new validation checks without modifying core engine")
        (decision . "Each check is a pure function returning a standardized result type")
        (consequences . ("Easy to test" "Easy to compose" "Parallel execution possible" "Clear interfaces")))

      (adr-004
        (title . "Use GitHub App for bot integration")
        (status . "proposed")
        (date . "2026-01-04")
        (context . "Need to integrate with GitHub for automated release validation on PRs and releases")
        (decision . "Create GitHub App with webhook handlers for release events")
        (consequences . ("Fine-grained permissions" "Org-wide installation" "Status check integration" "Webhook management required")))))

    (development-practices
      (code-style
        (formatter . "deno fmt")
        (linter . "deno lint")
        (rescript-formatter . "rescript format")
        (max-line-length . 100)
        (indent . 2))
      (security
        (dependency-scanning . "enabled")
        (secret-scanning . "enabled")
        (sast . "codeql")
        (sbom . "required"))
      (testing
        (unit-test-framework . "deno test")
        (coverage-minimum . 80)
        (integration-tests . "required")
        (property-tests . "recommended"))
      (versioning
        (scheme . "semver")
        (changelog-format . "keep-a-changelog")
        (release-automation . "release-please"))
      (documentation
        (format . "asciidoc")
        (api-docs . "typedoc")
        (readme-required . #t)
        (contributing-required . #t))
      (branching
        (strategy . "github-flow")
        (main-branch . "main")
        (feature-prefix . "feat/")
        (bugfix-prefix . "fix/")))

    (design-rationale
      (why-rescript . "Type safety with JavaScript interop, smaller output than TypeScript")
      (why-deno . "Security-first runtime, no package.json, built-in tooling")
      (why-composable-checks . "Extensibility without modifying core, easier testing")
      (why-github-app . "Better UX than webhooks, fine-grained permissions, status checks"))))
