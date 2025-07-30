#!/bin/bash

echo "🐍 Quick Check - Task 1: Hello World"
echo "===================================="

if [ ! -f "hello.py" ]; then
    echo "❌ hello.py not found!"
    exit 1
fi

echo "✅ File exists"
echo ""
echo "📤 Testing script output:"
echo "----------------------------------------"

python3 hello.py
EXIT_CODE=$?

echo "----------------------------------------"

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Script ran successfully!"
else
    echo "❌ Script had errors"
fi

echo ""
echo "🔍 Checking if name was personalized:"
if grep -q "\[Your Name\]" hello.py; then
    echo "⚠️  Remember to replace [Your Name] with your actual name!"
else
    echo "✅ Name appears to be personalized"
fi