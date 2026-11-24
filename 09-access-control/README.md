# 09 Access control as code

If time allows. Roles and grants live in SQL files. Owners approve changes to their own objects.

## Pieces

| Need | How |
|---|---|
| Roles and grants in code | `example.sql` |
| Other teams cannot change your objects | `.github/CODEOWNERS`, one folder per owner |
| Extra warning on risky grants | Policy check `SqlGrantWarn`. Enable it as in 02. |

AI assistants open pull requests like anyone else. The same owner rule applies.

Needs the `poc_customers` table from 02-policy-checks. Deploy that first.

## Try it

1. Copy `example.sql` into `changelogs/seqdatamart/changesets/`.
2. Open a pull request.

Expect: the data team and DBA team must approve.
