#git misc

#CLEAN
git clean -n #show what would be and would not be removed with "git clean -f"

#DIFF
git diff --binary HEAD > tempPatch.diff #create a diff patch
git diff <commit1>:path/file <commit2>:otherpath/otherfile #make a diff between two arbitrary files in different revisions
git diff --cached <file>|empty #diff of files in index
git diff -p #see complete diffs of commits

#PATCHING
git diff --no-prefix > patchfile #generate the patch
patch -p0 < patchfile #apply the patch
patch -p1 < patchfile #apply the patch if --no-prefix wasn't used

git format-patch -1 <commit> #generate a patch from 1 commit, it generate a .patch file
git format-patch --no-prefix -1 <commit> --not app/ #generate a patch from 1 commit and not excludes the app/ folder, use path -p0
git am file.patch #applies the previous patch file and commit the changes
git apply file.patch #applies the patch and don't commit

#crazy things
git hash-object -w <path/file> #returns the SHA1 of the object
git reflog

#GENERAL
The inverse of 'git add <file>' is 'git reset HEAD -- <file>' not 'git rm <file>'
git rm --cached <filename> #If you want to keep a file, but not have it in the next revision
git ls-files -o --exclude-standard #show untracked files
git show-ref --hash $branch_name #show two different SHA1s if local and remote are in different commit

#PLUMBING
test <sha1-A> = $(git merge-base <sha1-A> <sha1-B>) #determine if merging sha1-B into sha1-A is achievable as a fast forward; non-zero exit status is false.

#ADDING
git add <file1> <file2> ...
  add <file1>, <file2>, etc... to the project

git add <dir>
  add all files under directory <dir> to the project, including subdirectories

git add .
  add all files under the current directory to the project

git rm <file1> <file2> ...
  remove <file1>, <file2>, etc... from the project

git rm $(git ls-files --deleted)
  remove all deleted files from the project

git rm --cached <file1> <file2> ...
  commits absence of <file1>, <file2>, etc... from the project

#Staging
#-------

git add <file1> <file2> ...
git stage <file1> <file2> ...
  add changes in <file1>, <file2> ... to the staging area (to be included in
  the next commit

git add -p
git stage --patch
  interactively walk through the current changes (hunks) in the working
  tree, and decide which changes to add to the staging area.

git add -i
git stage --interactive
  interactively add files/changes to the staging area. For a simpler
  mode (no menu), try `git add --patch` (above)


#Cherry-Picking
#--------------

git cherry-pick [--edit] [-n] [-m parent-number] [-s] [-x] <commit>
  selectively merge a single commit from another local branch
  Example: git cherry-pick 7300a6130d9447e18a931e898b64eefedea19544

#fcsk

gitk --all $( git fsck | awk '/dangling commit/ {print $3}' ) #recover a lost stash //thanks David Padilla

###### 12. Storing/Retrieving from the File System
$ echo "Foo" | git hash-object -w --stdin #51fc03a9bb365fae74fd2bf66517b30bf48020cb
$ git tag myfile 51fc03a9bb365fae74fd2bf66517b30bf48020cb
$ git cat-file blob myfile