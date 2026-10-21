# 🚀 Git & GitHub Hands-on Mastery Lab

Welcome to your personalized **Git & GitHub Learning Project**!

This repository is designed as a **mission-based hands-on lab**. Instead of just reading theory, you will build a project step-by-step while practicing every essential Git command.

---

## 🧠 The Core Mental Model

Before running any commands, understand Git's **4 Areas**:

```
[ Working Directory ]  --->  [ Staging Area (Index) ]  --->  [ Local Repository (.git) ]  --->  [ Remote (GitHub) ]
   (Files you edit)               (git add)                     (git commit)                   (git push)
```

1. **Working Directory:** Where you create and edit files.
2. **Staging Area:** The "preparation room" where you select which changes to include in the next snapshot.
3. **Local Repository:** The saved history of snapshots on your computer.
4. **Remote Repository (GitHub):** The cloud copy where your team collaborates.

---

## 🗺️ Learning Roadmap: 8 Hands-on Missions

- [Mission 1: Initializing & Your First Commit](#mission-1-initializing--your-first-commit)
- [Mission 2: Ignoring Files & Viewing Diffs](#mission-2-ignoring-files--viewing-diffs)
- [Mission 3: Branching & Safe Feature Development](#mission-3-branching--safe-feature-development)
- [Mission 4: The Merge Conflict Challenge](#mission-4-the-merge-conflict-challenge)
- [Mission 5: Time Travel & Undoing Mistakes](#mission-5-time-travel--undoing-mistakes)
- [Mission 6: Stashing Temporary Work](#mission-6-stashing-temporary-work)
- [Mission 7: Connecting to Remote GitHub & Pushing](#mission-7-connecting-to-remote-github--pushing)
- [Mission 8: GitHub Team Workflow (Pull Requests & Fetch/Pull)](#mission-8-github-team-workflow-pull-requests--fetchpull)

---

### Mission 1: Initializing & Your First Commit
**Goal:** Initialize Git in this directory and make your first commit.

1. **Check status of directory:**
   ```bash
   git status
   ```
   *(Notice: "fatal: not a git repository" if not initialized yet)*

2. **Initialize Git:**
   ```bash
   git init
   ```
   *This creates a hidden `.git` folder tracking all your history.*

3. **Check status again:**
   ```bash
   git status
   ```
   *Notice the files are in red under "Untracked files".*

4. **Stage files for commit:**
   ```bash
   git add README.md CHEATSHEET.md
   # Or stage everything with:
   git add .
   ```

5. **Commit the staged changes:**
   ```bash
   git commit -m "feat: initial commit with learning guide and cheatsheet"
   ```

6. **View your commit history:**
   ```bash
   git log --oneline
   ```

---

### Mission 2: Ignoring Files & Viewing Diffs
**Goal:** Learn how to hide sensitive/temporary files and view line-by-line changes.

1. **Create a secret or temporary file:**
   ```bash
   echo "API_KEY=secret_12345" > .env
   echo "cache data" > temp.log
   ```

2. **Create a `.gitignore` file to ignore them:**
   Create a file named `.gitignore` with:
   ```text
   .env
   *.log
   ```

3. **Verify Git ignores them:**
   ```bash
   git status
   ```
   *(Notice `.env` and `temp.log` do NOT appear under untracked files! Only `.gitignore` does.)*

4. **Stage and commit `.gitignore`:**
   ```bash
   git add .gitignore
   git commit -m "chore: add gitignore for environment and log files"
   ```

5. **Inspect modifications before committing:**
   Add a new line to `README.md`, then run:
   ```bash
   git diff
   ```
   *`git diff` shows additions (+) and deletions (-).*

---

### Mission 3: Branching & Safe Feature Development
**Goal:** Create a feature branch, make changes isolated from `main`, and merge it back.

1. **Ensure your default branch is named `main`:**
   ```bash
   git branch -M main
   ```

2. **Create and switch to a new branch:**
   ```bash
   git switch -c feature/user-profile
   # (Alternative older syntax: git checkout -b feature/user-profile)
   ```

3. **Verify which branch you are on:**
   ```bash
   git branch
   ```

4. **Create a new project file on this branch:**
   ```bash
   echo '{"name": "Developer", "skills": ["Git", "GitHub"]}' > profile.json
   ```

5. **Commit your changes on the branch:**
   ```bash
   git add profile.json
   git commit -m "feat: add user profile model"
   ```

6. **Switch back to `main`:**
   ```bash
   git switch main
   ```
   *(Notice: Look in your folder! `profile.json` disappears because it only exists on your feature branch!)*

7. **Merge the feature branch into `main`:**
   ```bash
   git merge feature/user-profile
   ```
   *(Now `profile.json` is safely merged into `main`!)*

8. **Delete the feature branch after merging:**
   ```bash
   git branch -d feature/user-profile
   ```

---

### Mission 4: The Merge Conflict Challenge
**Goal:** Intentionally cause a merge conflict and learn how to resolve it confidently.

1. **Create branch A:**
   ```bash
   git switch -c branch-a
   echo "Color scheme: Dark Mode" > theme.txt
   git add theme.txt
   git commit -m "theme: set dark mode"
   ```

2. **Switch to main and create branch B:**
   ```bash
   git switch main
   git switch -c branch-b
   echo "Color scheme: Light Mode" > theme.txt
   git add theme.txt
   git commit -m "theme: set light mode"
   ```

3. **Merge branch A into main first:**
   ```bash
   git switch main
   git merge branch-a
   ```
   *(Success! Fast-forwarded).*

4. **Now try to merge branch B into main:**
   ```bash
   git merge branch-b
   ```
   *💥 CONFLICT! Git will inform you: "Automatic merge failed; fix conflicts and then commit the result."*

5. **Resolve the conflict:**
   Open `theme.txt`. You will see conflict markers:
   ```text
   <<<<<<< HEAD
   Color scheme: Dark Mode
   =======
   Color scheme: Light Mode
   >>>>>>> branch-b
   ```
   Edit the file to choose the winner (or combine them, e.g., `Color scheme: System Auto (Dark/Light)`), delete the marker lines (`<<<<<<<`, `=======`, `>>>>>>>`).

6. **Finish the merge:**
   ```bash
   git add theme.txt
   git commit -m "merge: resolve theme preference conflict"
   ```

7. **Clean up branches:**
   ```bash
   git branch -d branch-a
   git branch -d branch-b
   ```

---

### Mission 5: Time Travel & Undoing Mistakes
**Goal:** Learn the 4 ways to undo actions without panicking.

1. **Discard unstaged changes in a file:**
   ```bash
   echo "temporary mess" >> profile.json
   git status
   git restore profile.json
   ```
   *`profile.json` is restored to its last committed state.*

2. **Unstage a file you added by mistake:**
   ```bash
   echo "accidental edit" >> profile.json
   git add profile.json
   git restore --staged profile.json
   git restore profile.json
   ```

3. **Revert a past commit safely (creates a new reverse commit):**
   ```bash
   git revert HEAD --no-edit
   ```

4. **Inspect history as a tree graph:**
   ```bash
   git log --oneline --graph --all
   ```

---

### Mission 6: Stashing Temporary Work
**Goal:** Save half-finished work without committing when you suddenly need to switch tasks.

1. **Make an unfinished edit:**
   ```bash
   echo "WIP: writing new feature" >> profile.json
   ```

2. **Stash your work:**
   ```bash
   git stash
   ```
   *Your working directory is now clean again!*

3. **List your stashes:**
   ```bash
   git stash list
   ```

4. **Bring back your saved work:**
   ```bash
   git stash pop
   ```

---

### Mission 7: Connecting to Remote GitHub & Pushing
**Goal:** Link your local repository to GitHub.com.

1. Go to [GitHub.com](https://github.com) and click **New Repository**.
2. Name it `git-mastery-lab` (leave "Initialize with README" **unchecked**).
3. Copy your repository's URL (HTTPS or SSH).
4. Link it locally:
   ```bash
   git remote add origin https://github.com/<YOUR_USERNAME>/git-mastery-lab.git
   ```
5. Verify the remote:
   ```bash
   git remote -v
   ```
6. Push your `main` branch:
   ```bash
   git push -u origin main
   ```

---

### Mission 8: GitHub Team Workflow (Pull Requests & Fetch/Pull)
**Goal:** Practice the standard professional team collaboration pattern.

```
Local Feature Branch  -->  git push  -->  GitHub Feature Branch  -->  Create Pull Request (PR)  -->  Code Review  -->  Merge into main
```

1. **Create a feature branch:**
   ```bash
   git switch -c feature/add-readme-badge
   ```
2. **Make your change and commit:**
   ```bash
   echo "![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)" >> README.md
   git commit -am "docs: add license badge"
   ```
3. **Push the branch to GitHub:**
   ```bash
   git push origin feature/add-readme-badge
   ```
4. **Create a Pull Request (PR) on GitHub.com:**
   - Go to your repo on GitHub.
   - Click **Compare & pull request**.
   - Add title & description, click **Create pull request**.
   - Merge the PR on GitHub.
5. **Sync your local machine with GitHub's updates:**
   ```bash
   git switch main
   git pull origin main
   ```

---

## 🏆 Quick Practice Checklist

- [ ] `git init`
- [ ] `git status`
- [ ] `git add <file>` & `git add .`
- [ ] `git commit -m "message"`
- [ ] `git log --oneline --graph`
- [ ] `git diff`
- [ ] `.gitignore`
- [ ] `git branch` & `git switch -c <name>`
- [ ] `git merge <branch>`
- [ ] Merge conflict resolution
- [ ] `git restore`
- [ ] `git stash` & `git stash pop`
- [ ] `git remote add origin <url>`
- [ ] `git push -u origin main`
- [ ] `git pull` & `git fetch`
- [ ] Pull Requests on GitHub
## Verified Production Notes
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
