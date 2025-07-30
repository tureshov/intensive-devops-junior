# Python Homework 3: Very Easy Python Tasks 🐍

**Course:** DevOps Fundamentals - Lecture 3 (Python)  
**Due Date:** [Insert your due date]  
**Total Points:** 30 points (10 points per task)  

## 📋 Instructions

1. Create a new directory called `python_homework3`
2. Complete all 3 tasks by creating the specified Python scripts
3. All templates are provided - just copy and test!

### Setup Commands
```bash
# Create homework directory
mkdir python_homework3
cd python_homework3

# Check Python
python3 --version
```

---

## 🎯 Task 1: Hello World (10 points)

**File name:** `hello.py`

**Description:** Create a simple Python script that prints a greeting.

### Expected Output:
```
Hello, DevOps World!
My name is [Your Name]
I am learning Python for DevOps
Today I created my first Python script!
```

### Complete Script (just copy this):
```python
# Task 1: Hello World

print("Hello, DevOps World!")
print("My name is [Your Name]")  # Replace with your real name
print("I am learning Python for DevOps")
print("Today I created my first Python script!")
```

### What you need to do:
1. Create file `hello.py`
2. Copy the code above
3. Change `[Your Name]` to your real name
4. Run: `python3 hello.py`

---

## 🎯 Task 2: Working with Lists (10 points)

**File name:** `my_list.py`

**Description:** Create a script that works with a list of your favorite things.

### Expected Output:
```
My favorite DevOps tools:
['Git', 'Docker', 'Python']

Adding more tools...
My updated list:
['Git', 'Docker', 'Python', 'Linux', 'Kubernetes']

I have 5 favorite tools
My first tool is: Git
My last tool is: Kubernetes
```

### Complete Script (just copy this):
```python
# Task 2: Working with Lists

# Create a list of favorite DevOps tools
my_tools = ["Git", "Docker", "Python"]

print("My favorite DevOps tools:")
print(my_tools)

print()
print("Adding more tools...")

# Add more tools to the list
my_tools.append("Linux")
my_tools.append("Kubernetes")

print("My updated list:")
print(my_tools)

print()
print(f"I have {len(my_tools)} favorite tools")
print(f"My first tool is: {my_tools[0]}")
print(f"My last tool is: {my_tools[-1]}")
```

### What you need to do:
1. Create file `my_list.py`
2. Copy the code above exactly
3. Run: `python3 my_list.py`

---

## 🎯 Task 3: Simple API Call (10 points)

**File name:** `simple_api.py`

**Description:** Make a very simple API call to get a random joke.

### Expected Output:
```
=== Getting a Programming Joke ===

Here's a joke for you:
Why do programmers prefer dark mode?
Because light attracts bugs!

Thanks for using the joke API! 😄
```

### Complete Script (just copy this):
```python
# Task 3: Simple API Call

import requests

print("=== Getting a Programming Joke ===")
print()

try:
    # Call a simple joke API
    response = requests.get("https://official-joke-api.appspot.com/jokes/programming/random")
    
    if response.status_code == 200:
        joke_data = response.json()
        joke = joke_data[0]  # Get first joke
        
        print("Here's a joke for you:")
        print(joke["setup"])
        print(joke["punchline"])
    else:
        print("Sorry, couldn't get a joke right now")
        print("But here's one for you:")
        print("Why do programmers prefer dark mode?")
        print("Because light attracts bugs!")

except:
    # If API fails, show a backup joke
    print("Here's a joke for you:")
    print("Why do programmers prefer dark mode?")
    print("Because light attracts bugs!")

print()
print("Thanks for using the joke API! 😄")
```

### What you need to do:
1. Create file `simple_api.py`
2. Copy the code above exactly
3. Install requests: `pip3 install requests`
4. Run: `python3 simple_api.py`

---

## 📤 How to Submit

### Step 1: Test All Scripts
```bash
cd python_homework3

# Test each script
python3 hello.py
python3 my_list.py
python3 simple_api.py
```

### Step 2: Check Your Files
```bash
# Make sure you have all 3 files
ls -la *.py

# Should show:
# hello.py
# my_list.py
# simple_api.py
```

### Step 3: Submit
- Submit all 3 `.py` files
- Or zip the `python_homework3` folder

---

## 📊 Grading (Very Simple)

### Task 1: Hello World (10 points)
- ✅ Script runs without errors: 5 points
- ✅ Shows personalized greeting: 5 points

### Task 2: Working with Lists (10 points)
- ✅ Script runs and shows list: 5 points
- ✅ Adds items and shows count: 5 points

### Task 3: Simple API Call (10 points)
- ✅ Script runs without crashing: 5 points
- ✅ Shows some kind of output: 5 points

## 💡 Help and Tips

### If you get stuck:

**Problem:** "requests module not found"
**Solution:**
```bash
pip3 install requests
```

**Problem:** Script doesn't run
**Solution:** Make sure you copied the code exactly as shown

**Problem:** API doesn't work
**Solution:** The script has a backup joke, so it will always work

### What you're learning:
- `print()` - display text
- Lists - `append()`, `len()`, indexing
- `requests.get()` - API calls
- `try/except` - error handling
- Variables and f-strings

---

## 🎉 That's It!

This homework is **super easy**! Just copy the templates and run them. 

**Remember:**
- All code is provided
- Just copy, paste, and test
- Change your name in Task 1
- Install requests for Task 3

**Each task teaches:**
1. **Basic Python output** (print)
2. **Lists and basic operations** (append, len, indexing)  
3. **Simple API usage** (requests, JSON)

Good luck! 🚀