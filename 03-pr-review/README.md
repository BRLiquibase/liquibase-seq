# 03 Pull request review

Every pull request gets one comment with the SQL to apply and the policy check result.
Reviewers approve from the pull request.

## What does it

| Piece | File |
|---|---|
| Comment with SQL and check results | `.github/workflows/ci.yml` (step "Post summary") |
| Who must approve | `.github/CODEOWNERS` |
| Block merge until checks pass and owners approve | GitHub ruleset (steps below) |

## Set up

1. Replace the team names in `.github/CODEOWNERS`.
2. In GitHub: Settings, Rules, New branch ruleset, target `main`.
3. Turn on: Require a pull request, Require review from Code Owners, Require status checks (`check`).

Expect: a pull request that touches `changelogs/solstice/` needs the DBA team and the dev lead.
A pull request that touches `changelogs/seqdatamart/` needs the DBA team and the data team.
