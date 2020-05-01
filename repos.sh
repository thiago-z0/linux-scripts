#!/bin/bash
repos=$(cat repos_list.txt)

echo "** Script Start **"

read -p "Directory name: " dir_name
read -p "Bitbucket Workspace: " bit_workspace
read -p "Bitbucket User: " bitbucket_user
read -s -p "Bitbucket password: " bitbucket_password

cd ~
mkdir $dir_name
cd $dir_name

echo -e "\nStarting Clone..."

for repo in $repos; do
  expect -c "
        spawn git clone https://${bitbucket_user}@bitbucket.org/${bit_workspace}/${repo}.git
        expect \"Password for 'https://${bitbucket_user}@bitbucket.org':\"
        send \"${bitbucket_password}\r\"
        interact
        "
  cd $repo
  expect -c "
        spawn git checkout develop
        sleep 2
        spawn git pull origin develop
        expect \"Password for 'https://${bitbucket_user}@bitbucket.org':\"
        send \"${bitbucket_password}\r\"
        interact
        "
  if [ -f "package.json" ]; then
    yarn
  else
    echo "--"
  fi
  cd ..
done

echo -e "\n ** Done! 🚀 **"
