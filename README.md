# Castle Releases

A getting-started tutorial in git form. 

## What it does:

It lets you add a subtree to `/buildscripts` which contains:

 * nice-to-have rake/albacore tasks which haven't been merged with a release of albacore yet
   * ilmerge
   * ilmerge config
 * environment configuration through tasks (e.g. `env:release` or for 'product'-type releases: `env:rc[3]`)
 * utility scripts for copying
 * utility scripts for http://nvie.com/posts/a-successful-git-branching-model/
 * resharper naming conventions for the castle project
 * this readme
 
## How to use:

 If you have a previous /buildscripts folder, otherwise, step 6:

 1. Remove the buildscripts from git's index.
 2. You can squash this commit with 'git rebase -i HEAD~1' and then 's'-key, if you feel up for it.
 3. Make tmp branch and switch to it to place old buildscripts in it
 4. Add buildscripts to this branch
 5. Go back to the branch you came from
 
1-5:
```
$ git rm -r --cached buildscripts
$ git commit -m "intermediate commit to remove buildscripts from index."
$ git checkout -b tmp
$ git add . ; git commit -m "branch with buildscripts"
$ git checkout master
```

 You're done with saving what has been in buildscripts.
 
 6. name the other project "Releases", and fetch. 
 7. prepare for the later step to record the result as a merge.
 8. read "master" branch of Releases to the subdirectory "buildscripts".
 9. record the merge result.
 
 10. merge back what you had before merging the subtree. possible 'git merge -s ours tmp
 11. remove the tmp branch.

6-11 
```
$ git remote add -f Releases https://haf@github.com/haf/Castle.Releases.git 
$ git merge -s ours --no-commit Releases/master 
$ git read-tree --prefix=buildscripts/ -u Releases/master 
$ git commit -m "Merge Releases project as our subdirectory" 
$ git merge tmp
$ git branch -d tmp
```
 
 You have applied the code in Releases! Congrats!
 
 Maintain the result with subsequent merges using the "subtree" strategy:

```
$ git pull -s subtree Releases master
```