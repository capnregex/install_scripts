
host=$(cat ~/.githost)

git_https=https://$host
git_ssh=git@$host


function github_api {
  curl -ks \
    -H "Authorization: token $GHE_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    $API_ROOT/$1
}

function test_github_api_access {
  result=$(github_api 'user')
  if [[ ! $result =~ '"login":' ]]
  then
    echo "Unable to access Github API using a token."
    echo "$result"
    echo "Generate a new access token at "
    echo
    echo "$git_https/settings/tokens/new"
    echo
    echo "at a minimum the token will need"
    echo " [x] public_repo  Access public repositories"
    echo "then set the GHE_TOKEN environment variable in your profile."
    echo "once you have done that, you will need to try again with a new shell"
    exit
  fi
}

function checkout_repo {
  for repo in "$@"
  do
    cd $HOME
    user=${repo%%/*}
    name=${repo##*/}
    url="$git_ssh:$user/$name.git"
    if [ -d $name ] ## if name is a directory
    then
      echo updating $name
      cd $name
      git pull
    else
      echo cloning $name
      git clone $url
    fi
  done
}

function checkout_repo_as {
  repo=$1
  dest=$2
  cd $HOME
  user=${repo%%/*}
  name=${repo##*/}
  url="$git_ssh:$user/$name.git"
  if [ -d $dest ] ## if name is a directory
  then
    echo updating $repo in $dest
    cd $dest
    git pull
  else
    echo cloning $repo to $dest 
    git clone $url $dest
  fi
  cd $HOME
}


