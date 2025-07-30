# Homework 1: Linux Basic Bash Scripts (Easy Level) 📝

**Course:** DevOps Fundamentals - Lecture 1 (Linux)  
**Due Date:** [Insert your due date]  
**Total Points:** 30 points (10 points per task)  

## 📋 Instructions

1. Create a new directory called `homework1` in your home directory
2. Complete all 3 tasks by creating the specified bash scripts
3. Make sure all scripts are executable (`chmod +x script_name.sh`)
4. Test each script to ensure it works correctly

### Setup Commands
```bash
# Create homework directory
mkdir ~/homework1
cd ~/homework1

# Check you're in the right place
pwd
```

---

## 🎯 Task 1: Welcome Script (10 points)

**File name:** `welcome.sh`

**Description:** Create a simple script that displays a welcome message and shows some basic information.

### Requirements:
- Display "Welcome to Linux!" message
- Show today's date
- Show your username
- Display "Have a great day!" message

### Expected Output:
```
Welcome to Linux!
Today is: Mon Dec 11 14:30:25 2023
Hello, student!
Have a great day!
```

### Complete Script Template:
```bash
#!/bin/bash

# Task 1: Welcome Script
echo "Welcome to Linux!"
echo "Today is: $(date)"
echo "Hello, $(whoami)!"
echo "Have a great day!"
```

### What you need to do:
1. Create the file `welcome.sh`
2. Copy the template above into the file
3. Make it executable: `chmod +x welcome.sh`
4. Run it: `./welcome.sh`

---

## 🎯 Task 2: File Creator Script (10 points)

**File name:** `create_files.sh`

**Description:** Create a script that makes some files and folders, then shows what was created.

### Requirements:
- Create a folder called `my_project`
- Create 3 empty files: `file1.txt`, `file2.txt`, `file3.txt`
- Show the contents of the `my_project` folder

### Expected Output:
```
Creating project folder...
Creating files...
Done! Here's what was created:
file1.txt
file2.txt
file3.txt
```

### Complete Script Template:
```bash
#!/bin/bash

# Task 2: File Creator Script
echo "Creating project folder..."
mkdir my_project

echo "Creating files..."
touch my_project/file1.txt
touch my_project/file2.txt
touch my_project/file3.txt

echo "Done! Here's what was created:"
ls my_project/
```

### What you need to do:
1. Create the file `create_files.sh`
2. Copy the template above into the file
3. Make it executable: `chmod +x create_files.sh`
4. Run it: `./create_files.sh`

---

## 🎯 Task 3: Personal Info Script (10 points)

**File name:** `my_info.sh`

**Description:** Create a script that asks for your name and favorite color, then displays them nicely.

### Requirements:
- Ask user "What is your name?"
- Ask user "What is your favorite color?"
- Display both answers in a nice message

### Expected Output:
```
What is your name? John
What is your favorite color? blue

Nice to meet you, John!
Your favorite color is blue.
```

### Complete Script Template:
```bash
#!/bin/bash

# Task 3: Personal Info Script
read -p "What is your name? " name
read -p "What is your favorite color? " color

echo ""
echo "Nice to meet you, $name!"
echo "Your favorite color is $color."
```

### What you need to do:
1. Create the file `my_info.sh`
2. Copy the template above into the file
3. Make it executable: `chmod +x my_info.sh`
4. Run it: `./my_info.sh`

---

## 📤 How to Submit

### Step 1: Test All Scripts
```bash
cd ~/homework1

# Test each script
./welcome.sh
./create_files.sh
./my_info.sh
```

### Step 2: Check Your Files
```bash
# Make sure you have all 3 scripts
ls -la *.sh

# Should show:
# welcome.sh
# create_files.sh  
# my_info.sh
```

### Step 3: Submit
- **Option 1:** Submit all 3 `.sh` files
- **Option 2:** Zip the homework1 folder and submit

---

## 📊 Grading (Very Simple)

### Task 1: Welcome Script (10 points)
- ✅ Script runs without errors: 5 points
- ✅ Shows all required messages: 5 points

### Task 2: File Creator Script (10 points)
- ✅ Creates folder and files: 5 points
- ✅ Lists the created files: 5 points

### Task 3: Personal Info Script (10 points)
- ✅ Asks for user input: 5 points
- ✅ Displays the information: 5 points

## 💡 Help and Tips

### If you get stuck:

**Problem:** "Permission denied" when running script
**Solution:** 
```bash
chmod +x script_name.sh
```

**Problem:** Script doesn't work
**Solution:** Check that you copied the template exactly as shown

**Problem:** Can't create the file
**Solution:** Use nano to create and edit:
```bash
nano welcome.sh
# Copy the template, then press Ctrl+X, Y, Enter to save
```

### Commands You Need to Know:
- `mkdir` - create folder
- `touch` - create empty file  
- `echo` - display text
- `date` - show current date
- `whoami` - show username
- `read` - get user input
- `ls` - list files
- `chmod +x` - make script executable

---

## 🎉 That's It!

This homework is designed to be **very easy**. If you can copy the templates and run the commands, you'll get full points! 

**Remember:** 
- All templates are provided
- Just copy, paste, and test
- Ask for help if needed

Good luck! 🚀