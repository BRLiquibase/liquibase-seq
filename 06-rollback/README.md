# 06 Rollback

Three ways back. Use QA.

## 1. Undo the last deployment

```
liquibase rollback-one-update --force
```

## 2. Undo one change from the middle of a release

```
liquibase rollback-one-changeset --changeset-id=ddl_add_col_b --changeset-author=yourname --changeset-path=<path of the file you copied> --force
```

Only that change is undone. The others stay.

## 3. Test rollback on every deploy

Set `LB_TEST_ROLLBACK=T`. The flow deploys, rolls back, deploys again. It never runs in PROD.
The dev job in `deploy.yml` turns this on.

## Try it

1. Copy `example.sql` into `changelogs/solstice/changesets/` and deploy to QA.
2. Run option 2 for `ddl_add_col_b`.
3. Run `liquibase history`.

Expect: `ddl_add_col_a` and `ddl_add_col_c` still applied. `ddl_add_col_b` gone.

## When Argo CD reverts the app

The schema does not change. The older app version has fewer changesets, so nothing runs.
The database stays ahead of the app. To roll the schema back, run option 1 or 2 first.

## Data loss

Rollback of a dropped column cannot bring the data back. The policy checks in 02 warn first.
