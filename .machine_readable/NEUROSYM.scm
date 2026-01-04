; SPDX-License-Identifier: AGPL-3.0-or-later
; NEUROSYM.scm - Neurosymbolic configuration for finishing-bot
; Media-Type: application/vnd.neurosym+scm

(neurosym
  (version . "1.0.0")
  (project . "finishing-bot")

  (symbolic-layer
    (validation-rules
      ((rule . "readme-exists")
       (type . "file-existence")
       (paths . ("README.adoc" "README.md"))
       (required . #t)
       (error-message . "Project must have README.adoc or README.md"))

      ((rule . "license-exists")
       (type . "file-existence")
       (paths . ("LICENSE" "LICENSE.md" "LICENSE.txt"))
       (required . #t)
       (error-message . "Project must have a LICENSE file"))

      ((rule . "security-policy-exists")
       (type . "file-existence")
       (paths . ("SECURITY.md" ".github/SECURITY.md"))
       (required . #t)
       (error-message . "Project must have SECURITY.md"))

      ((rule . "workflow-permissions")
       (type . "yaml-property")
       (path . ".github/workflows/*.yml")
       (property . "permissions")
       (required . #t)
       (error-message . "All workflows must declare permissions"))

      ((rule . "actions-sha-pinned")
       (type . "pattern-match")
       (path . ".github/workflows/*.yml")
       (pattern . "uses: .+@[a-f0-9]{40}")
       (required . #t)
       (error-message . "All GitHub Actions must be SHA-pinned")))

    (rule-composition
      ((name . "documentation-complete")
       (rules . ("readme-exists" "license-exists" "security-policy-exists"))
       (strategy . "all-must-pass"))

      ((name . "ci-cd-secure")
       (rules . ("workflow-permissions" "actions-sha-pinned"))
       (strategy . "all-must-pass"))

      ((name . "release-ready")
       (rules . ("documentation-complete" "ci-cd-secure"))
       (strategy . "all-must-pass"))))

  (neural-layer
    (llm-integration
      (enabled . #f)
      (purpose . "natural-language-summaries")
      (model . "local-preferred")
      (fallback . "none")
      (use-cases
        ("Generate human-readable validation reports")
        ("Suggest fixes for common issues")
        ("Explain validation failures")))

    (embeddings
      (enabled . #f)
      (purpose . "semantic-similarity")
      (use-cases
        ("Match issues to known solutions")
        ("Cluster similar validation failures")
        ("Find related documentation"))))

  (hybrid-reasoning
    (symbolic-first . #t)
    (neural-assistance . "optional")
    (explanation-mode . "symbolic-primary")
    (confidence-threshold . 0.95)
    (human-review-threshold . 0.8)))
