#!/bin/bash

# rewrite current commit author/committer date: now +/- hours/minutes

#date -d "16:00 410 minutes"

HOUR="$1"
MIN="$2"

DATE=$(date -d "$HOUR $MIN minutes")
echo "commit date: $DATE"

#GIT_COMMITTER_DATE="$DATE" git commit --amend --no-edit --date "$DATE"

#git rebase --continue

