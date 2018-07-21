#!/bin/bash

now_branch="version $(git branch --contains | tr -d "*")"

# changelog生成
newest_tag=$(git describe --abbrev=0)
sed -i "2i## $(date +'%Y年%-m月%-d日') ${now_branch}\r\n" ./changelog.md
git log --format=%s  ${newest_tag}...HEAD | grep -i "\(Fix\|UPDATE\|ADD\)" | sort -r | xargs -I{} sed -i -e "3i{}" ./changelog.md
unix2dos changelog.md

# gamebase変更

version_str=$(echo ${now_branch} | sed 's/\([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\)/\1\2\3\3/')
sed -i 's/\(バージョン,\)[0-9]+/\1${version_str}/' ./CSV/gamebase.csv
unix2dos ./CSV/gamebase.csv