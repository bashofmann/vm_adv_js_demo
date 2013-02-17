clean_and_checkout() {
  git reset --hard
  git clean -d -f
  git checkout $1
}
TARGETFOLDER=$1
checkout_and_wait() {
  if [ -n "$1" ]; then
    clean_and_checkout "$1"
    clear
    rsync -Pav . /vagrant_data/app
    git log -1 | cat
    read -p "Continue..." F <&2
  fi
}
rm -rf /vagrant_data/app
cd $TARGETFOLDER
clean_and_checkout $2
git log --pretty=format:"%h %n" --reverse | while read i; do checkout_and_wait "$i"; done
clean_and_checkout $2
read -p "End..." F <&2
rm -rf /vagrant_data/app
cd ~
