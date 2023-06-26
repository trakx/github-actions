# github-actions
Github action that bumps semver version and adds extended information to it

## Actions

### build-push-container
Builds and push a container image to the registry (Docker by default).
Requires Microsoft.NET.Build.Containers package installed.

### dependabot-automerge
Call this on `pull_request` target events, give it pull request and content write privileges.

### deploy
Create a GitHub deployment, attempts to deploy and update deployment status.
Accepts both `nuget` and `kubernetes` types. If `kubernetes`, will deploy the container image to kubernetes too.

One thing to keep in mind is that to give the token permissions to use the deploy API we need to do that before calling the reusable action.

### get-last-commit
Outputs the last commit SHA. If the target event is `pull_request` outputs the PR commit SHA. Otherwise, will be the last `branch` commit SHA.

### get-tag
Computes the next semver and produces a release tag.

### manual-approval
Used to require manual approval from specific users or org user groups.
It will create an issue where approvers can comment to allow or deny the workflow run.

### publish-nuget
Used to publish nuget packages to the private github nuget repository.

### push-tag
Used to try to retrieve tag as artifact and push it.

### test-dotnet
Build and test a dotnet solution, posting code coverage results to Codacy.

## Shared workflows
All shared workflows are available in `.github/workflows/` path.

### shared-build-deploy-container
Build, Push and Deploy a container image to Kubernetes.
Use both `build-push-container` and `deploy` actions.
