#!/bin/bash

# rewrite current commit author/committer date: now +/- hours/minutes

#date 2021-05-20T14:35:48+0200

DATE="$1"
echo "commit date: $DATE"

GIT_COMMITTER_DATE="$DATE" git commit --amend --no-edit --date "$DATE"

git rebase --continue

