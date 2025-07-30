#!/bin/bash

echo "🎯 Quick Check - Task 1: Welcome Script"
echo "========================================"

if [ ! -f "welcome.sh" ]; then
    echo "❌ welcome.sh not found!"
    exit 1
fi

if [ ! -x "welcome.sh" ]; then
    echo "❌ welcome.sh not executable! Run: chmod +x welcome.sh"
    exit 1
fi

echo "✅ File exists and is executable"
echo ""
echo "📤 Testing output:"
echo "----------------------------------------"
./welcome.sh
echo "----------------------------------------"
echo ""
echo "✅ Task 1 basic check completed!"