#!/usr/bin/env bash

# Git & GitHub Mastery Lab - Progress Checker
# Run this anytime using: ./verify.sh

echo "=========================================="
echo " 🔍 Git & GitHub Mastery Lab: Progress"
echo "=========================================="

# Check 1: Git repository initialized
if [ -d ".git" ]; then
    echo "✅ [Mission 1] Git repository initialized"
else
    echo "❌ [Mission 1] Git repository not initialized yet (run: git init)"
    exit 0
fi

# Check 2: First commit made
if git rev-parse HEAD >/dev/null 2>&1; then
    COMMIT_COUNT=$(git rev-list --count HEAD)
    echo "✅ [Mission 1] Commits found in repository ($COMMIT_COUNT commit(s))"
else
    echo "❌ [Mission 1] No commits found yet (run: git add . && git commit -m 'initial commit')"
    exit 0
fi

# Check 3: .gitignore configured
if [ -f ".gitignore" ]; then
    echo "✅ [Mission 2] .gitignore exists"
else
    echo "⚪ [Mission 2] .gitignore not created yet"
fi

# Check 4: Main branch naming
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
echo "ℹ️  Current active branch: $CURRENT_BRANCH"

# Check 5: Branching practice (check for more than 1 commit or branch history)
BRANCH_COUNT=$(git branch | wc -l | tr -d ' ')
echo "ℹ️  Local branches count: $BRANCH_COUNT"

# Check 6: Remote configured
REMOTE_URL=$(git remote get-url origin 2>/dev/null)
if [ -n "$REMOTE_URL" ]; then
    echo "✅ [Mission 7] Remote 'origin' configured: $REMOTE_URL"
else
    echo "⚪ [Mission 7] Remote 'origin' not linked yet (see Mission 7 in README.md)"
fi

echo "=========================================="
echo "Tip: Open README.md to follow step-by-step missions!"
echo "=========================================="
