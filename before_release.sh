#!/bin/bash
set -eu

readonly branch_name=$(git symbolic-ref --short HEAD)
readonly version=$(echo ${branch_name} | sed -E -e 's/(release|hotfix)\///g' | grep -w -E "[0-9]+\.[0-9]+\.[0-9]+")
readonly previous_tag=$(git describe --abbrev=0)
while read major minor patch; do
    readonly gamebase_str=$(printf '%d%02d%02d' ${major} ${minor} ${patch})
done < <(echo ${version} | tr '.' ' ')

if [[ "$version" == "" ]]; then
    echo current branch is not release or hotfix
    exit 1
fi

grep "$(date +'%Y年%-m月%-d日') version ${version}" ./changeLog.txt > /dev/null
if [[ $? == 1 ]]; then
    echo create changelog before use this shell
    exit 1
fi

# gamebase変更

sed -i "s/\(バージョン,\)[0-9]\+/\1${gamebase_str}/" ./CSV/gamebase.csv
unix2dos ./CSV/GameBase.csv

git add ./CSV/GameBase.csv
git add ./changeLog.txt

git commit -m '定型作業'


# リリースブランチのFinish
git checkout develop
git merge --no-ff -m "Finish ${version}" ${branch_name}

git checkout master
git merge --no-ff -m "Finish ${version}" ${branch_name}

git tag -a ${version} -m "Finish ${version}"

git push origin develop
git push origin master
git push origin refs/tags/${version}:refs/tags/${version}

# リリース用zipファイルの作成

#full_file_nameはスペースを含むので展開時はクオートすること
readonly full_file_name="eratohoK ver${version}.zip"

git archive \
    --worktree-attribute \
    --format=zip \
    --prefix="eratohoK ver${version}/" \
    ${version}  > "${full_file_name}"

readonly github_release_body=$(sed -e '1i作者は東方の二次創作同人小説を作っています。そちらもよければよろしくお願いします。\n[Pixiv](https://www.pixiv.net/member.php?id=1062514)\n[DLSite](http://www.dlsite.com/maniax/circle/profile/=/maker_id/RG24583.html)\n' temp2.txt)
sed -e "1ieratohoK ver${version}\nhttps://github.com/wamekukyouzin/eratohoK/releases\n\n東方のエロ小説も書いてます\n渋 https://www.pixiv.net/member.php?id=1062514\nDLSite http://www.dlsite.com/maniax/circle/profile/=/maker_id/RG24583.html\n" temp2.txt > shitaraba.md

export GITHUB_USER=wamekukyouzin
export GITHUB_REPO=eratohok
export GITHUB_TOKEN=$(cat ~/git/token.github)

github-release release -t ${version} -c master -d "${github_release_body}"
github-release upload -t ${version} -n "${full_file_name}" -f "${full_file_name}"

git branch -D ${branch_name}
rm temp2.txt
