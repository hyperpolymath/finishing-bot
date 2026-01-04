; SPDX-License-Identifier: AGPL-3.0-or-later
; ECOSYSTEM.scm - Ecosystem positioning for finishing-bot
; Media-Type: application/vnd.ecosystem+scm

(ecosystem
  (version . "1.0.0")
  (name . "finishing-bot")
  (type . "release-tooling")
  (purpose . "Validates project release readiness against hyperpolymath standards")

  (position-in-ecosystem
    (category . "devops-automation")
    (layer . "ci-cd-tooling")
    (scope . "cross-project")
    (maturity . "incubating"))

  (related-projects
    ((name . "gitvisor")
     (relationship . "sibling-standard")
     (integration . "Consumes gitvisor state for repository context")
     (notes . "Both tools enforce hyperpolymath repository standards"))

    ((name . "robot-repo-bot")
     (relationship . "sibling-standard")
     (integration . "Shares validation check definitions")
     (notes . "robot-repo-bot focuses on creation, finishing-bot on completion"))

    ((name . "robot-repo-cleaner")
     (relationship . "sibling-standard")
     (integration . "Uses similar workflow validation logic")
     (notes . "Cleaner removes issues, finishing-bot validates readiness"))

    ((name . "rhodium-standard-repositories")
     (relationship . "specification")
     (integration . "Implements RSR compliance checks")
     (notes . "RSR defines what finishing-bot validates"))

    ((name . "git-eco-bot")
     (relationship . "sibling-standard")
     (integration . "Coordinates on repository ecosystem standards")
     (notes . "Eco-bot manages ecosystem, finishing-bot validates releases"))

    ((name . "januskey")
     (relationship . "potential-consumer")
     (integration . "May use finishing-bot for release validation")
     (notes . "Security-focused project requiring strict release validation"))

    ((name . "bunsenite")
     (relationship . "potential-consumer")
     (integration . "Configuration validation on release")
     (notes . "Nickel configs need validation before release"))

    ((name . "openssf-scorecard")
     (relationship . "inspiration")
     (integration . "Implements similar security checks")
     (notes . "Scorecard methodology informs security validation")))

  (what-this-is
    ("Release readiness validation bot for hyperpolymath projects")
    ("Automated checker for documentation completeness")
    ("CI/CD pipeline validator for security and quality")
    ("GitHub integration for PR and release checks")
    ("CLI tool for local validation before release"))

  (what-this-is-not
    ("Not a CI/CD system - integrates with existing CI")
    ("Not a code linter - focuses on project-level concerns")
    ("Not a test runner - validates that tests exist and pass")
    ("Not a deployment tool - validates readiness for deployment")
    ("Not a security scanner - validates that scanning is configured")))
