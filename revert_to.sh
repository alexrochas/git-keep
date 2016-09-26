#!/bin/bash

# hold actual branch
actual_branch=`git rev-parse --abbrev-ref HEAD`

# checkout to stashed branch
git checkout $1

# get HEAD commit
commit_to_apply_sha=`git rev-parse --short=5 --verify HEAD`

# back to original branch
git checkout $actual_branch

# apply commit
git cherry-pick $commit_to_apply_sha

# revert to unstaged files
git reset --soft HEAD~1
git reset HEAD .

# delete stashed branch
git branch -D $1

echo "Done!"
