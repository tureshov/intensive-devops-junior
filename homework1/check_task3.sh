#!/bin/bash

echo "🎯 Quick Check - Task 3: Personal Info Script"
echo "=============================================="

if [ ! -f "my_info.sh" ]; then
    echo "❌ my_info.sh not found!"
    exit 1
fi

if [ ! -x "my_info.sh" ]; then
    echo "❌ my_info.sh not executable! Run: chmod +x my_info.sh"
    exit 1
fi

echo "✅ File exists and is executable"
echo ""
echo "📤 Testing script (will provide test input):"
echo "----------------------------------------"
echo -e "TestStudent\nRed" | ./my_info.sh
echo "----------------------------------------"
echo ""
echo "✅ Task 3 basic check completed!"
echo "💡 Run the script manually to test interactively: ./my_info.sh"