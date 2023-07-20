# github-actions
Shared Github actions to run tests, manage semver version information, publish container images, deploy containers and release nuget packages.

## Actions

### build-push-container-image
Builds and pushes a container image to the registry (Docker by default).
The `.csproj` file must contain the `<EnableSdkContainerSupport>true</EnableSdkContainerSupport>` tag.

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
Builds and tests a dotnet solution, posting code coverage results to Codacy.

### pick-environment
Outputs the environment. If the input is not provided, will be generated based on the branch name.

### pick-runner
Outputs the runner name. If the input is not provided, will be generated based on the branch name.

## Shared workflows
All shared workflows are available in `.github/workflows/` path.

### shared-build-deploy-container
Builds, pushes and deploys a container image to Kubernetes.
Uses both `build-push-container-image` and `deploy` actions.
Sample usage with the default behaviour and options:
```yml
deploy-api:
  name: "Deploy API"
  uses: "trakx/github-actions/.github/workflows/shared-build-deploy-container.yml@master"
  with:
    projectFolder: "src/Trakx.SampleService.Api"
    serviceName: "sampleservice-api"
  secrets: inherit
```
More details here:
<https://trakx.atlassian.net/wiki/spaces/development/pages/33390593/Deployment+and+Github+Actions>