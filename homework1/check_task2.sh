#!/bin/bash

echo "🎯 Quick Check - Task 2: File Creator Script"
echo "============================================="

if [ ! -f "create_files.sh" ]; then
    echo "❌ create_files.sh not found!"
    exit 1
fi

if [ ! -x "create_files.sh" ]; then
    echo "❌ create_files.sh not executable! Run: chmod +x create_files.sh"
    exit 1
fi

echo "✅ File exists and is executable"

# Clean up previous test
rm -rf my_project 2>/dev/null

echo ""
echo "📤 Running script:"
echo "----------------------------------------"
./create_files.sh
echo "----------------------------------------"

echo ""
echo "📁 Checking created files:"
if [ -d "my_project" ]; then
    echo "✅ my_project folder created"
    echo "📄 Files in my_project:"
    ls -la my_project/
else
    echo "❌ my_project folder not found!"
fi

echo ""
echo "✅ Task 2 basic check completed!"