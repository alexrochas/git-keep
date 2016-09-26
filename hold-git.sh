#!/bin/bash

if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	echo "Git not found! Install? (y/n) \c"
	read
	if "$REPLY" = "y"; then
		sudo apt-get install git
	fi
else
	echo "Updating README.md"
fi

# get message for branch name
case $1 in
    -m | --message )    shift
						message=$1 | sed -e "s/\s/\_/g"
                        ;;
esac

# save actual branch
actual_branch=`git rev-parse --abbrev-ref HEAD`

# add all unstaged things
`git add .`

# commit and get SHA1
`git commit -m "HOLD gIT place holder"`
current_sha=`git rev-parse --short=5 --verify HEAD`

# create new branch and move changes
if [ -z "${message}" ]; then
	branch_name=$current_sha
else
	branch_name="${current_sha}_${message}"
fi
`git checkout -b $branch_name`
`git cherry-pick ${current_sha}`

# back to last branch
`git checkout $actual_branch`

# revert last commit
`git reset --hard HEAD~1`

echo "Holding ${current_sha}_${branch_name}"


