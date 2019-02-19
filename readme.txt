Q: How to start new development cycle?
* Create a new branch for the development project in project repo, the branch named likes "feature/xxx".
* Increase version number of projects which is your developing in "Configuration" project.
* When your projects development is done, crete PR to "develop" branch.
* Create new git tag for the "Configuration" project, the name likes "uapi/xxx.
* Create new "rc branch" based on "develop", the branch name likes "rc/xxx".
* Modify configuration in (cfgBranch=xxx) in your projects build script (setup-env.sh) to point to new Configuration project tag.
* When all tests is passed, then create new git "release branch" based on rc branch, the branch pattern is "v[major verion].[minor verion].x".
* Create new git tag to point "release branch", name likes "v[major verion].[minor verion].0"
* Remove "rc/xxx" branch in "project repo".

Q: How to fix issue on released project?
* Create a new branch based on git "release branch" in project repo, the name likes "bugfix/xxx".
* Create new branch based on git tagged "Configuration" project, the branch name likes "bugfix/xxx".
* Increse version number of projects which is your developing in "Configuration" project.
* Modify configuration in (cfgBranch=xxx) in your projects build script (setup-env.sh) to point to new Configuration project branch.
* When you finish development, you should create PR to "release branch".
* Create new git tag for "Configuration" project based on the branch which is created on step 2.
* Modify configuration in (cfgBranch=xxx) in your projects build script (setup-env.sh) to point to new tag in "Configuration repo".
* Remove "bugfix/xxx" branch on both "project repo" and "configuration repo". 
