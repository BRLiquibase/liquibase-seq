# 01 Automated deployment

Merge a pull request. The change deploys dev, then qa, then prod.

## Two paths, same flow file

| Path | Files | Runs |
|---|---|---|
| GitHub Actions | `.github/workflows/cd.yml`, `deploy.yml` | `flows/liquibase.flowfile.cd.yaml` |
| Argo CD | `argocd-presync-job.yaml`, `Dockerfile` | `flows/liquibase.flowfile.cd.yaml` |

## GitHub Actions

1. Add these GitHub secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `LIQUIBASE_LICENSE_KEY`.
2. Create the AWS secrets: `seq-poc-<database>-<env>` with keys `url`, `username`, `password`. Example: `seq-poc-solstice-dev`.
3. Set the runner label in the workflows.
4. Copy `postgres.sql` or `sqlserver.sql` from this folder into the matching `changesets/` folder. They hold a table, data and a stored procedure or function.
5. Merge to `main`.

Expect: dev deploys, then qa, then prod. Each environment has its own AWS secrets. Set approvers on the `qa` and `prod` environments in GitHub.

## Argo CD

The Job runs before the app rolls out (PreSync hook). If it fails, the rollout stops.

1. Build the image: `docker build -f 01-deployment/Dockerfile -t <registry>/seq-db-changelog:<tag> .`
2. Put `argocd-presync-job.yaml` in the app's manifests. Fill in the placeholders.
3. Sync the app.

Expect: a `seq-db-migrate` Job runs first. Argo CD shows its status.

## Not decided yet

- Drift check in Argo CD needs a place to keep the snapshot. The Job sets `LB_TEST_DRIFT=F` for now. Drift runs in GitHub Actions (see 05).
