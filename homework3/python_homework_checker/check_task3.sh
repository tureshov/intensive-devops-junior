#!/bin/bash

echo "🌐 Quick Check - Task 3: Simple API Call"
echo "========================================"

if [ ! -f "simple_api.py" ]; then
    echo "❌ simple_api.py not found!"
    exit 1
fi

echo "✅ File exists"

# Check requests module
echo ""
echo "🔍 Checking requests module:"
if python3 -c "import requests" 2>/dev/null; then
    echo "✅ requests module is installed"
else
    echo "❌ requests module not found!"
    echo "   Install with: pip3 install requests"
    echo ""
fi

echo ""
echo "📤 Testing script (with 10 second timeout):"
echo "----------------------------------------"

timeout 10 python3 simple_api.py
EXIT_CODE=$?

echo "----------------------------------------"

if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Script completed successfully!"
elif [ $EXIT_CODE -eq 124 ]; then
    echo "⚠️  Script timed out (probably waiting for network)"
else
    echo "❌ Script had errors"
fi

echo ""
echo "💡 Note: This script should work even without internet"
echo "   (it has a backup joke built-in)"