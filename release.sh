#!/bin/bash

readonly newest_tag=$(git describe --abbrev=0)
git archive --worktree-attribute --format=zip --prefix="eratohoK ver$newest_tag/" $newest_tag > "eratohoK ver$newest_tag.zip"