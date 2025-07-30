#!/bin/bash

echo "🔧 Quick Check - Git Repository Structure"
echo "========================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not a Git repository! Run 'git init' first."
    exit 1
fi

echo "✅ Git repository detected"
echo ""

# Check required files
echo "📁 Checking required files:"

if [ -f "README.md" ]; then
    echo "✅ README.md exists"
    echo "   Size: $(wc -c < README.md) bytes"
    echo "   Lines: $(wc -l < README.md) lines"
else
    echo "❌ README.md missing!"
fi

if [ -f ".gitignore" ]; then
    echo "✅ .gitignore exists"
    echo "   Rules: $(grep -v '^#' .gitignore | grep -v '^$' | wc -l) ignore rules"
else
    echo "❌ .gitignore missing!"
fi

echo ""
echo "📝 Git Status:"
git status --porcelain

echo ""
echo "📋 Commit Count: $(git rev-list --count HEAD 2>/dev/null || echo "0")"

if [ "$(git rev-list --count HEAD 2>/dev/null || echo "0")" -eq 2 ]; then
    echo "✅ Perfect! Exactly 2 commits as required."
else
    echo "⚠️  Should have exactly 2 commits."
fi

echo ""
echo "🌟 Remote Status:"
if git remote -v | grep -q origin; then
    echo "✅ Remote 'origin' configured:"
    git remote -v
else
    echo "📝 No remote configured (GitHub bonus available)"
fi