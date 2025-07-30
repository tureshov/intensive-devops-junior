#!/bin/bash

echo "📝 Quick Check - Task 2: Working with Lists"
echo "==========================================="

if [ ! -f "my_list.py" ]; then
    echo "❌ my_list.py not found!"
    exit 1
fi

echo "✅ File exists"
echo ""
echo "📤 Testing script output:"
echo "----------------------------------------"

OUTPUT=$(python3 my_list.py 2>&1)
EXIT_CODE=$?

echo "$OUTPUT"
echo "----------------------------------------"

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Script ran successfully!"
    
    echo ""
    echo "🔍 Checking list operations:"
    
    if echo "$OUTPUT" | grep -q "Git.*Docker.*Python"; then
        echo "✅ Shows initial tools"
    else
        echo "❌ Initial tools not shown properly"
    fi
    
    if echo "$OUTPUT" | grep -q "5.*tools"; then
        echo "✅ Shows correct final count"
    else
        echo "❌ Final count not correct"
    fi
    
else
    echo "❌ Script had errors"
fi