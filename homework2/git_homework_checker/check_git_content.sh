#!/bin/bash

echo "📄 Content Validation Check"
echo "============================"

if [ ! -f "README.md" ]; then
    echo "❌ README.md not found!"
    exit 1
fi

echo "🔍 Analyzing README.md content..."
echo ""

README_CONTENT=$(cat README.md)
SCORE=0

# Check for required sections
echo "📋 Content Requirements:"

if echo "$README_CONTENT" | grep -qi "devops"; then
    echo "✅ Contains DevOps-related content"
    ((SCORE++))
else
    echo "❌ Missing DevOps content"
fi

if echo "$README_CONTENT" | grep -qi -E "(name|about me)"; then
    echo "✅ Contains personal information"
    ((SCORE++))
else
    echo "❌ Missing personal information section"
fi

if echo "$README_CONTENT" | grep -qi -E "(why|motivation|goal)"; then
    echo "✅ Contains motivation/goals"
    ((SCORE++))
else
    echo "❌ Missing motivation or goals"
fi

if echo "$README_CONTENT" | grep -qi -E "(learn|progress|achieve)"; then
    echo "✅ Contains learning objectives"
    ((SCORE++))
else
    echo "❌ Missing learning objectives"
fi

echo ""
echo "📊 Content Score: $SCORE/4"

if [ $SCORE -ge 3 ]; then
    echo "🎉 Great content! Well done!"
elif [ $SCORE -ge 2 ]; then
    echo "👍 Good content, consider adding more details"
else
    echo "📝 Content needs improvement - add more personal information"
fi

echo ""
echo "📏 README Statistics:"
echo "   - Characters: $(wc -c < README.md)"
echo "   - Words: $(wc -w < README.md)"
echo "   - Lines: $(wc -l < README.md)"
echo "   - Markdown headers: $(grep -c '^#' README.md)"