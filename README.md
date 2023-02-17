# test-gh-actions
This is a repo to test github actions with TFC, as API driven workspaces. On commit, github actions will run terraform on workspace 1, then workspace 2.

Pre-reqs:
Create the following workspaces in TFC:
1-createvpc
2-createvm

Add variable in github TF_API_TOKEN
Add AWS creds as variable set in TFC

When you push code to master branch, github actions will trigger tf to run on workspace 1, then workspace 2. Run destroy by manually initiating in github acitons UI.