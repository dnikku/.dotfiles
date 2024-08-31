#!/usr/bin/env bash

set -x

PR_NAME=vpc-bastion

function fetch_repo() {
    git remote add ${PR_NAME} https://github.com/arvato-systems-vpc/${PR_NAME}.git

    # git fetch --no-tags ${PR_NAME}
    git fetch ${PR_NAME} ${PR_NAME}
}

function ls_f() {
    git ls-files -s |
     sed -E "/\t(modules|\.github)\//! s_\t\"*_&modules/vpc-bastion/_"
}

function prefix_subdir() {
  # prefix all files with 'modules/$PR_NAME'
  git filter-branch -f --prune-empty --index-filter \
    'git ls-files -s |
     sed -E "/\t(modules|\.github)\//! s_\t\"*_&modules/vpc-bastion/_" |

    GIT_INDEX_FILE=$GIT_INDEX_FILE.new  git update-index --index-info &&
    test -f "$GIT_INDEX_FILE.new" && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE" || touch "$GIT_INDEX_FILE"' ${PR_NAME}
}

function replace_root() {
  ROOT_COMMIT=$(git rev-list --max-parents=0 ${PR_NAME})

  # duplicate root commit
  git br -D reset0;  git co reset1 -b reset0; git cherry-pick $ROOT_COMMIT

  # delete all replaces
  git replace -l | xargs git replace -d

  # replace <root> -> reset0
  git replace --graft $ROOT_COMMIT reset0
}


function run_all_steps() {
  clean_all
  fetch_repo

  git co ${PR_NAME}/${PR_NAME} -b ${PR_NAME}
  prefix_subdir

  git remote remove ${PR_NAME}

  git co $PR_NAME; replace_root
}

function clean_all() {
  git co -f develop;

  git remote remove $PR_NAME
  git br -D $PR_NAME
  git br -D reset0
}

# ls_f
# run_all_steps
clean_all
# git co $PR_NAME; replace_root
