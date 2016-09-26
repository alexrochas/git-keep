#!/bin/bash

# get message for branch name
branch_name=$1

# save actual branch
actual_branch=`git rev-parse --abbrev-ref HEAD`

# add all unstaged things
`git add .`

# commit and get SHA1
`git commit -m "HOLD gIT place holder"`
current_sha=`git rev-parse --short=5 --verify HEAD`

# create new branch and move changes
`git checkout -b ${current_sha}_${branch_name}`
`git cherry-pick ${current_sha}`

# back to last branch
`git checkout $actual_branch`

# revert last commit
`git reset --hard HEAD~1`

echo "Holding ${current_sha}_${branch_name}"


