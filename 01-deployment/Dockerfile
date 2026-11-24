# Image for the Argo CD PreSync Job. Holds the changelogs and flow files.
# Confirm the image tag exists before building.
FROM liquibase/liquibase-secure:6.0.2
COPY changelogs /liquibase/changelogs
COPY flows /liquibase/flows
