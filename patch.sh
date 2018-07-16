#!/bin/bash
if [ $# -ne 3 ]; then
    echo "usage patch.sh <archive_tag> <commit_id_from> <commit_id_to>"
    exit 1
fi
git archive --format=zip --prefix="eratohoK $1/" $3 $(git diff --name-only --diff-filter=AMCR $2 $3) -o "eratohoK $1.zip"
