# 📖 The Ultimate Git & GitHub Command Cheatsheet

A quick-reference guide categorized by everyday development tasks.

---

## 1. Setup & Configuration
| Command | What It Does |
| :--- | :--- |
| `git config --global user.name "Your Name"` | Set your username across all local repositories |
| `git config --global user.email "you@example.com"` | Set your email address across all local repositories |
| `git config --list` | List all current Git configurations |
| `git init` | Initialize a new local Git repository in current folder |
| `git clone <url>` | Download a copy of an existing remote repository |

---

## 2. Basic Snapshotting (Daily Workflow)
| Command | What It Does |
| :--- | :--- |
| `git status` | Check working tree status (untracked, modified, staged files) |
| `git add <file>` | Stage a specific file for the next commit |
| `git add .` | Stage all modified and new files in the current folder |
| `git commit -m "Your message"` | Commit staged snapshot to local repository with a message |
| `git commit -am "Your message"` | Stage tracked modified files and commit in one step |
| `git commit --amend -m "New message"` | Modify the most recent commit message or add forgotten staged files |

---

## 3. Inspecting & Comparing
| Command | What It Does |
| :--- | :--- |
| `git log` | View full commit history |
| `git log --oneline` | Compact 1-line view of commit history with hashes |
| `git log --oneline --graph --all` | ASCII graph representation of branches and merges |
| `git diff` | Show changes between working directory and staging area |
| `git diff --staged` | Show changes between staging area and last commit |
| `git show <commit_hash>` | Show metadata and diff for a specific commit |

---

## 4. Branching & Merging
| Command | What It Does |
| :--- | :--- |
| `git branch` | List all local branches (current branch has `*`) |
| `git branch -a` | List both local and remote tracking branches |
| `git branch <branch-name>` | Create a new branch |
| `git switch <branch-name>` | Switch to an existing branch (modern replacement for `checkout`) |
| `git switch -c <branch-name>` | Create and switch to a new branch in one command |
| `git merge <branch-name>` | Merge specified branch into the currently active branch |
| `git branch -d <branch-name>` | Safely delete a branch (errors if unmerged) |
| `git branch -D <branch-name>` | Force delete a branch even if unmerged |

---

## 5. Undoing Changes & Time Travel
| Command | What It Does |
| :--- | :--- |
| `git restore <file>` | Discard changes in working directory (restore to last commit) |
| `git restore --staged <file>` | Unstage a file (keep the changes in working directory) |
| `git reset --soft HEAD~1` | Undo last commit, but KEEP changes staged |
| `git reset --mixed HEAD~1` | Undo last commit, keep changes in working directory (unstaged) |
| `git reset --hard HEAD~1` | ⚠️ Discard last commit and all associated file changes completely |
| `git revert <commit_hash>` | Create a new commit that safely reverses changes of a previous commit |

---

## 6. Stashing (Pausing Work)
| Command | What It Does |
| :--- | :--- |
| `git stash` | Temporarily save dirty working state without committing |
| `git stash list` | View all stashed entries |
| `git stash pop` | Apply most recent stash and remove it from stash list |
| `git stash apply` | Apply most recent stash but keep it in stash list |
| `git stash drop` | Remove the most recent stash without applying it |

---

## 7. Remote Repositories & GitHub
| Command | What It Does |
| :--- | :--- |
| `git remote add <name> <url>` | Link local repo to a remote (usually named `origin`) |
| `git remote -v` | View configured remote URLs |
| `git push -u <remote> <branch>` | Push branch to remote and set up upstream tracking |
| `git push` | Push committed changes to default tracking upstream branch |
| `git pull` | Fetch changes from remote and merge immediately into current branch |
| `git fetch` | Download new commits/branches from remote without merging |
| `git branch -r` | List remote branches known locally |

---

## 8. Advanced Pro Tools
| Command | What It Does |
| :--- | :--- |
| `git rebase <base-branch>` | Replay current branch commits onto the tip of another branch |
| `git cherry-pick <commit_hash>` | Apply a specific commit from another branch onto current branch |
| `git tag <tag-name>` | Create a lightweight tag (e.g., `v1.0.0`) at current commit |
| `git push origin --tags` | Push all local tags to remote repository |
| `git clean -fd` | Remove untracked files and directories from working directory |
