; SPDX-License-Identifier: AGPL-3.0-or-later
; PLAYBOOK.scm - Operational runbook for finishing-bot
; Media-Type: application/vnd.playbook+scm

(playbook
  (version . "1.0.0")
  (project . "finishing-bot")

  (operations
    (installation
      ((step . 1)
       (action . "Clone repository")
       (command . "git clone git@github.com:hyperpolymath/finishing-bot.git")
       (verify . "Directory exists with .git"))

      ((step . 2)
       (action . "Install Deno")
       (command . "curl -fsSL https://deno.land/install.sh | sh")
       (verify . "deno --version returns version"))

      ((step . 3)
       (action . "Run validation")
       (command . "deno task validate")
       (verify . "Validation report generated")))

    (development
      ((task . "run-tests")
       (command . "deno task test")
       (description . "Run all unit and integration tests"))

      ((task . "format-code")
       (command . "deno task fmt")
       (description . "Format all code using deno fmt"))

      ((task . "lint-code")
       (command . "deno task lint")
       (description . "Lint all code using deno lint"))

      ((task . "build")
       (command . "deno task build")
       (description . "Build for production deployment"))

      ((task . "type-check")
       (command . "deno check src/main.ts")
       (description . "Type-check without running")))

    (deployment
      ((environment . "development")
       (steps
         ("Clone repository"
          "Install dependencies"
          "Run tests"
          "Start development server")))

      ((environment . "staging")
       (steps
         ("Build production bundle"
          "Deploy to staging environment"
          "Run integration tests"
          "Verify health checks")))

      ((environment . "production")
       (steps
         ("Verify all tests pass"
          "Create release tag"
          "Build production bundle"
          "Deploy to production"
          "Monitor for errors"))))

    (troubleshooting
      ((issue . "Validation hangs")
       (symptoms . ("Long running validation" "No output"))
       (diagnosis . ("Check network connectivity" "Verify GitHub token"))
       (resolution . ("Increase timeout" "Refresh token" "Check rate limits")))

      ((issue . "False positives")
       (symptoms . ("Valid files reported as missing"))
       (diagnosis . ("Check file paths" "Verify file permissions"))
       (resolution . ("Update path patterns" "Fix file permissions")))

      ((issue . "GitHub API rate limit")
       (symptoms . ("403 errors" "Rate limit exceeded message"))
       (diagnosis . ("Check remaining rate limit" "Count API calls"))
       (resolution . ("Use authenticated requests" "Add caching" "Batch requests")))))

  (runbook-templates
    (daily-checks
      ("Verify CI/CD workflows passing")
      ("Check for new security advisories")
      ("Review pending validation failures"))

    (weekly-checks
      ("Audit all managed repositories")
      ("Update dependency versions")
      ("Review and close stale issues"))

    (release-checklist
      ("All tests passing")
      ("Documentation updated")
      ("CHANGELOG updated")
      ("Version bumped")
      ("Security scan clean")
      ("Branch protection verified")
      ("Release notes drafted"))))
