#!/usr/bin/perl -w
print "
    git pull   # update to the cloud

git branch <name>                 # creat branch
git checkout <name>               # swith branch
combined one ==>  git checkout -b <name> # creat and swich to branch

git merge <name>
git branch -d <name>              # delete branch


=======================================================
# stage file
git add newfilename/*
git rm removedfile.txt

# commit staged tracked files
git commit -m \"what changed this time\"

OR two command in one:
git commit -a -m \"your commit message\"

# -a : Tell the command to automatically stage files that have been modified and deleted, but new files you have not told Git about are not affected.
=======================================================

git push origin master (branch name)

# web set pull request (branches--branch name--add pull request)

# git clone
git clone --recursive https://github.com/mfumagalli/ngsTools.git

";
