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

 If you have a previous /buildscripts folder (1-6), otherwise, step 7:

 1. Remove the buildscripts from git's index.
 2. You can squash this commit with 'git rebase -i HEAD~1' and then 's'-key, if you feel up for it.
 3. Make tmp branch and switch to it to place old buildscripts in it
 4. Add buildscripts to this branch
 5. Commit these changes to the tmp branch
 6. Go back to the branch you came from
 
1-6:

```
git rm -r --cached buildscripts
git commit -m "intermediate commit to remove buildscripts from index."
git checkout -b tmp
git add .
git commit -m "branch with buildscripts"
git checkout master
```

 You're done with saving what has been in buildscripts. Now let's add the subtree.
 [More Info](http://www.kernel.org/pub/software/scm/git/docs/howto/using-merge-subtree.html)
 
<ol>
	<li value="7">name the other project "Releases", and fetch.</li>
	<li>prepare for the later step to record the result as a merge.</li>
	<li>read "master" branch of Releases to the subdirectory "buildscripts".</li>
	<li>record the merge result.</li>
</ol>
 
7-10:
 
```
git remote add -f Releases https://haf@github.com/haf/Castle.Releases.git 
git merge -s ours --no-commit Releases/master 
git read-tree --prefix=buildscripts/ -u Releases/master 
git commit -m "Merge Releases project as our subdirectory"
```

 If you have branched off your previous /buildscripts, merge it back in (11-12), otherwise skip this step.

11-12:

```
git merge tmp
git branch -d tmp
```
 
 You have applied the code in Releases! Congrats!
 
 Maintain the result with subsequent merges using the "subtree" strategy:

```
git pull -s subtree Releases master
```