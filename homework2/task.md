# Git Homework: Create Your DevOps Journey Repository 🚀

**Course:** DevOps Fundamentals - Lecture 2 (Git)  
**Due Date:** [Insert your due date]  
**Total Points:** 20 points  

## 📋 Task Overview

Create your first Git repository that showcases your DevOps learning journey. You will:
1. Create a local Git repository
2. Write a personal README file about yourself and your DevOps motivation
3. Add a .gitignore file
4. Make exactly 2 commits
5. Push to GitHub (optional but recommended)

**Estimated Time:** 30-45 minutes

---

## 🎯 Step-by-Step Instructions

### Step 1: Create Your Repository (5 points)

```bash
# 1. Create a new directory for your project
mkdir my-devops-journey
cd my-devops-journey

# 2. Initialize a Git repository
git init

# 3. Check the status
git status
```

**Expected output:**
```
Initialized empty Git repository in /path/to/my-devops-journey/.git/
On branch main
No commits yet
nothing to commit (create/copy files and use "git add" to track)
```

### Step 2: Create README.md File (5 points)

Create a file called `README.md` with the following content. **Replace the example information with your own details:**

```markdown
# My DevOps Learning Journey 🚀

## About Me
- **Name:** [Your Name]
- **Age:** [Your Age]
- **Location:** [Your City, Country]
- **Background:** [Brief description - student, working professional, career changer, etc.]

## Why I Want to Learn DevOps

[Write 2-3 sentences about why you're interested in DevOps. For example:]
- I want to bridge the gap between development and operations
- I'm excited about automation and making systems more efficient
- I believe DevOps skills will help me in my career growth

## What I Hope to Achieve

- [ ] Master Linux command line
- [ ] Become proficient with Git version control
- [ ] Learn Python for automation
- [ ] Understand CI/CD pipelines
- [ ] Get my first DevOps job

## My Learning Progress

### Completed:
- ✅ Linux Fundamentals
- ✅ Git Basics

### Currently Learning:
- 🔄 Python for DevOps
- 🔄 Docker and Containers

### Next Steps:
- ⏳ Kubernetes
- ⏳ AWS/Cloud Platforms
- ⏳ Monitoring and Logging

---

*"The journey of a thousand miles begins with one step."* - Lao Tzu

**Repository created on:** [Today's Date]
```

**How to create the file:**
```bash
# Using nano editor
nano README.md

# Copy the template above, customize it with your information
# Save: Ctrl+X, then Y, then Enter
```

### Step 3: First Commit (5 points)

```bash
# 1. Add README.md to staging area
git add README.md

# 2. Check status
git status

# 3. Make your first commit
git commit -m "Add personal README with DevOps learning goals"

# 4. Check commit history
git log --oneline
```

**Expected output:**
```
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   README.md

[main (root-commit) abc1234] Add personal README with DevOps learning goals
 1 file changed, 25 insertions(+)
```

### Step 4: Create .gitignore File (3 points)

Create a `.gitignore` file to ignore common files that shouldn't be tracked:

```bash
# Create .gitignore file
nano .gitignore
```

**Content for .gitignore:**
```
# Operating System Files
.DS_Store
Thumbs.db

# Editor Files
.vscode/
.idea/
*.swp
*.swo
*~

# Temporary Files
*.tmp
*.temp
*.log

# Personal Notes (private files)
personal-notes.txt
secrets.txt

# Python Files (for future use)
__pycache__/
*.pyc
*.pyo

# Node.js Files (for future use)
node_modules/
npm-debug.log
```

### Step 5: Second Commit (2 points)

```bash
# 1. Add .gitignore to staging area
git add .gitignore

# 2. Check status
git status

# 3. Make your second commit
git commit -m "Add .gitignore for common file types"

# 4. Check commit history
git log --oneline
```

**Expected output:**
```
abc1234 Add .gitignore for common file types
def5678 Add personal README with DevOps learning goals
```

---

## 🎯 Verification Checklist

Before submitting, verify you have completed everything:

```bash
# Check your repository status
git status

# Should show: "nothing to commit, working tree clean"

# Check your commit history
git log --oneline

# Should show exactly 2 commits

# Check your files
ls -la

# Should show: README.md, .gitignore, and .git/ directory
```

**Your final directory should look like:**
```
my-devops-journey/
├── .git/                    # Git repository data
├── .gitignore              # Ignore rules
└── README.md               # Your personal information
```

---

## 🌟 Bonus: Push to GitHub (Optional - Extra 5 points)

If you want to showcase your work online:

### Option 1: Using GitHub Web Interface

1. Go to [github.com](https://github.com) and create account (if you don't have one)
2. Click "New Repository"
3. Name it: `my-devops-journey`
4. **Don't** initialize with README (we already have one)
5. Click "Create Repository"

### Option 2: Push Your Local Repository

```bash
# Add GitHub as remote origin (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/my-devops-journey.git

# Push your commits to GitHub
git push -u origin main

# Verify remote connection
git remote -v
```

**Note:** You'll need to enter your GitHub username and personal access token.

---

## 📤 Submission Requirements

### What to Submit:

**Option 1: Local Repository**
- Zip your `my-devops-journey` folder
- Make sure `.git` folder is included
- Submit the zip file

```bash
# Create submission zip
cd ..
zip -r my-devops-journey-submission.zip my-devops-journey/
```

**Option 2: GitHub Repository**
- Submit the GitHub repository URL
- Example: `https://github.com/yourusername/my-devops-journey`

### Submission Checklist:
- [ ] Repository has exactly 2 commits
- [ ] README.md contains personal information and DevOps motivation
- [ ] .gitignore file is present and properly configured
- [ ] All files are properly committed
- [ ] (Bonus) Repository is pushed to GitHub

---

## 📊 Grading Rubric

### Repository Creation (5 points)
- ✅ Git repository initialized correctly: 3 points
- ✅ Proper directory structure: 2 points

### README.md File (5 points)
- ✅ File exists and is committed: 2 points
- ✅ Contains personal information: 2 points
- ✅ Includes DevOps motivation and goals: 1 point

### First Commit (5 points)
- ✅ README.md properly added and committed: 3 points
- ✅ Appropriate commit message: 2 points

### .gitignore and Second Commit (5 points)
- ✅ .gitignore file created with appropriate content: 2 points
- ✅ Second commit made correctly: 2 points
- ✅ Good commit message for .gitignore: 1 point

### Bonus: GitHub Push (5 points)
- ✅ Repository successfully pushed to GitHub: 3 points
- ✅ Repository is publicly accessible: 2 points

**Total Possible Points:** 25 points (20 base + 5 bonus)

---

## 💡 Common Issues and Solutions

### Problem: "Permission denied" when pushing to GitHub
**Solution:** 
- Use Personal Access Token instead of password
- Generate token at: Settings → Developer settings → Personal access tokens

### Problem: "Repository not found" on GitHub
**Solution:**
- Make sure repository name matches exactly
- Check if repository is public
- Verify GitHub username in URL

### Problem: Commit message errors
**Solution:**
- Keep messages under 50 characters
- Use present tense: "Add file" not "Added file"
- Be descriptive but concise

### Problem: .gitignore not working
**Solution:**
- Make sure filename starts with dot: `.gitignore`
- File should be in root directory of repository
- No spaces in filename

---

## 🎉 Success Criteria

You've successfully completed this task when:

1. ✅ You have a Git repository with exactly 2 commits
2. ✅ Your README.md tells your personal DevOps story
3. ✅ Your .gitignore prevents unwanted files from being tracked
4. ✅ You can navigate your Git history with `git log`
5. ✅ (Bonus) Your repository is live on GitHub for the world to see!

**Congratulations!** You've just created your first meaningful Git repository and started documenting your DevOps journey! 🚀

---

## 📚 What You Learned

- Git repository initialization (`git init`)
- Adding files to staging area (`git add`)
- Making commits with messages (`git commit -m`)
- Checking repository status (`git status`)
- Viewing commit history (`git log`)
- Creating and using `.gitignore` files
- (Bonus) Pushing to remote repositories (`git push`)
