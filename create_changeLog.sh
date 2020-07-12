#!/bin/bash
readonly branch_name=$(git symbolic-ref --short HEAD)
readonly version=$(echo ${branch_name} | sed -E -e 's/(release|hotfix)\///g' | grep -w -E "[0-9]+\.[0-9]+\.[0-9]+")
readonly previous_tag=$(git describe --abbrev=0)

git log --format=%s  ${previous_tag}...HEAD | grep -i "\(Fix:\|UPDATE:\|ADD:\|MERGE:\)" | sort > temp.txt

check=$(grep -i "Revert:" temp.txt | sed -E -e 's/Revert: //g')
if [[ "$check" != "" ]]; then
    grep -v "Revert:" temp.txt | grep -v "$(grep -i "Revert:" temp.txt | sed -E -e 's/Revert: //g')" > temp2.txt
else 
    cat temp.txt > temp2.txt
fi

# changelog生成
sed -i "2i## $(date +'%Y年%-m月%-d日') version ${version}\r\n" ./changelog.txt
tac temp.txt | tr "\n" "\\n" | xargs -I{} sed -i -e "3i {}" ./changelog.txt

unix2dos changelog.txt
rm temp.txt
