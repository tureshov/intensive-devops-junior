#!/bin/bash

# Python Homework 3 Checker
# Usage: ./check_python_homework.sh [student_directory]

echo "================================================"
echo "      PYTHON HOMEWORK 3 AUTOMATIC CHECKER"
echo "================================================"

# Check if directory argument provided
if [ $# -eq 0 ]; then
    HOMEWORK_DIR="."
else
    HOMEWORK_DIR="$1"
fi

echo "Checking Python homework in: $HOMEWORK_DIR"
echo ""

# Initialize scoring
TOTAL_SCORE=0
MAX_SCORE=30

# Check if directory exists
if [ ! -d "$HOMEWORK_DIR" ]; then
    echo "❌ Error: Directory $HOMEWORK_DIR not found!"
    exit 1
fi

cd "$HOMEWORK_DIR"

# Check Python availability
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: python3 not found!"
    exit 1
fi

echo "📋 CHECKING PYTHON TASKS..."
echo "================================================"

# Task 1 Check: Hello World (10 points)
echo "🐍 TASK 1: Hello World Script"
echo "----------------------------------------"
TASK1_SCORE=0

if [ -f "hello.py" ]; then
    echo "✅ File hello.py exists"
    
    # Try to run the script
    OUTPUT=$(python3 hello.py 2>&1)
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo "✅ Script runs without errors"
        ((TASK1_SCORE += 3))
        
        # Check output content
        if echo "$OUTPUT" | grep -qi "Hello.*DevOps.*World"; then
            echo "✅ Contains DevOps greeting"
            ((TASK1_SCORE += 2))
        else
            echo "❌ Missing DevOps greeting"
        fi
        
        if echo "$OUTPUT" | grep -qi "My name is"; then
            echo "✅ Contains name introduction"
            ((TASK1_SCORE += 2))
        else
            echo "❌ Missing name introduction"
        fi
        
        if echo "$OUTPUT" | grep -qi "learning Python"; then
            echo "✅ Mentions learning Python"
            ((TASK1_SCORE += 2))
        else
            echo "❌ Missing Python learning mention"
        fi
        
        if echo "$OUTPUT" | grep -qi "first.*script"; then
            echo "✅ Mentions first script"
            ((TASK1_SCORE += 1))
        else
            echo "❌ Missing first script mention"
        fi
        
    else
        echo "❌ Script has errors:"
        echo "$OUTPUT" | head -3
    fi
else
    echo "❌ File hello.py not found"
fi

echo "Task 1 Score: $TASK1_SCORE/10"
((TOTAL_SCORE += TASK1_SCORE))
echo ""

# Task 2 Check: Lists (10 points)
echo "📝 TASK 2: Working with Lists"
echo "----------------------------------------"
TASK2_SCORE=0

if [ -f "my_list.py" ]; then
    echo "✅ File my_list.py exists"
    
    # Try to run the script
    OUTPUT=$(python3 my_list.py 2>&1)
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo "✅ Script runs without errors"
        ((TASK2_SCORE += 3))
        
        # Check for list operations
        if echo "$OUTPUT" | grep -q "\['Git', 'Docker', 'Python'\]"; then
            echo "✅ Shows initial list correctly"
            ((TASK2_SCORE += 2))
        else
            echo "❌ Initial list not shown correctly"
        fi
        
        if echo "$OUTPUT" | grep -q "Linux.*Kubernetes"; then
            echo "✅ Shows added items"
            ((TASK2_SCORE += 2))
        else
            echo "❌ Added items not shown"
        fi
        
        if echo "$OUTPUT" | grep -q "I have.*5.*tools"; then
            echo "✅ Shows correct count (5 tools)"
            ((TASK2_SCORE += 2))
        else
            echo "❌ Count not shown correctly"
        fi
        
        if echo "$OUTPUT" | grep -q "first tool is.*Git"; then
            echo "✅ Shows first tool correctly"
            ((TASK2_SCORE += 1))
        else
            echo "❌ First tool not shown correctly"
        fi
        
    else
        echo "❌ Script has errors:"
        echo "$OUTPUT" | head -3
    fi
else
    echo "❌ File my_list.py not found"
fi

echo "Task 2 Score: $TASK2_SCORE/10"
((TOTAL_SCORE += TASK2_SCORE))
echo ""

# Task 3 Check: API Call (10 points)
echo "🌐 TASK 3: Simple API Call"
echo "----------------------------------------"
TASK3_SCORE=0

if [ -f "simple_api.py" ]; then
    echo "✅ File simple_api.py exists"
    
    # Check if requests is available
    if python3 -c "import requests" 2>/dev/null; then
        echo "✅ requests module available"
        ((TASK3_SCORE += 1))
    else
        echo "⚠️  requests module not installed (will check fallback)"
    fi
    
    # Try to run the script with timeout
    OUTPUT=$(timeout 15 python3 simple_api.py 2>&1)
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ] || [ $EXIT_CODE -eq 124 ]; then  # 0 = success, 124 = timeout
        echo "✅ Script runs without major errors"
        ((TASK3_SCORE += 4))
        
        # Check output content
        if echo "$OUTPUT" | grep -qi "joke"; then
            echo "✅ Shows joke content"
            ((TASK3_SCORE += 3))
        else
            echo "❌ No joke content found"
        fi
        
        if echo "$OUTPUT" | grep -qi "Getting.*Programming.*Joke"; then
            echo "✅ Shows proper header"
            ((TASK3_SCORE += 1))
        else
            echo "❌ Missing header"
        fi
        
        if echo "$OUTPUT" | grep -qi "Thanks.*API"; then
            echo "✅ Shows closing message"
            ((TASK3_SCORE += 1))
        else
            echo "❌ Missing closing message"
        fi
        
    else
        echo "❌ Script has errors:"
        echo "$OUTPUT" | head -5
    fi
else
    echo "❌ File simple_api.py not found"
fi

echo "Task 3 Score: $TASK3_SCORE/10"
((TOTAL_SCORE += TASK3_SCORE))
echo ""

# Check code content for learning assessment
echo "🔍 CODE QUALITY CHECK:"
echo "----------------------------------------"

# Check if students modified templates appropriately
if [ -f "hello.py" ]; then
    if grep -q "\[Your Name\]" hello.py; then
        echo "⚠️  Task 1: Student didn't replace [Your Name] placeholder"
    else
        echo "✅ Task 1: Name placeholder was replaced"
    fi
fi

# Check for required imports
if [ -f "simple_api.py" ]; then
    if grep -q "import requests" simple_api.py; then
        echo "✅ Task 3: Contains required import"
    else
        echo "❌ Task 3: Missing requests import"
    fi
fi

echo ""

# Final Results
echo "================================================"
echo "             FINAL RESULTS"
echo "================================================"
echo "Task 1 (Hello World):        $TASK1_SCORE/10"
echo "Task 2 (Working with Lists): $TASK2_SCORE/10"
echo "Task 3 (Simple API Call):    $TASK3_SCORE/10"
echo "----------------------------------------"
echo "TOTAL SCORE:                 $TOTAL_SCORE/$MAX_SCORE"

# Calculate percentage
PERCENTAGE=$((TOTAL_SCORE * 100 / MAX_SCORE))
echo "PERCENTAGE:                  $PERCENTAGE%"

# Grade assignment
if [ $PERCENTAGE -ge 90 ]; then
    GRADE="A"
elif [ $PERCENTAGE -ge 80 ]; then
    GRADE="B"
elif [ $PERCENTAGE -ge 70 ]; then
    GRADE="C"
elif [ $PERCENTAGE -ge 60 ]; then
    GRADE="D"
else
    GRADE="F"
fi

echo "LETTER GRADE:                $GRADE"
echo "================================================"

# Generate detailed report
cat > python_grade_report.txt << EOF
PYTHON HOMEWORK 3 GRADE REPORT
==============================
Student Directory: $HOMEWORK_DIR
Check Date: $(date)

DETAILED SCORES:
- Task 1 (Hello World): $TASK1_SCORE/10
- Task 2 (Working with Lists): $TASK2_SCORE/10
- Task 3 (Simple API Call): $TASK3_SCORE/10

TOTAL: $TOTAL_SCORE/30 ($PERCENTAGE%)
GRADE: $GRADE

FILES FOUND:
$(ls -la *.py 2>/dev/null || echo "No Python files found")

PYTHON VERSION:
$(python3 --version 2>/dev/null || echo "Python 3 not available")

EOF

echo ""
echo "📄 Detailed report saved to: python_grade_report.txt"

# Return appropriate exit code
if [ $TOTAL_SCORE -ge 21 ]; then  # 70% pass rate
    echo "🎉 PASSED"
    exit 0
else
    echo "❌ NEEDS IMPROVEMENT"
    exit 1
fi