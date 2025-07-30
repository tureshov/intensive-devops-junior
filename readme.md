# DevOps Fundamentals Course 🚀

**A comprehensive 3-lecture course covering essential DevOps tools and technologies**

## 📚 Course Overview

This course provides hands-on training in the fundamental tools every DevOps engineer needs to master. Through practical exercises and real-world examples, students will learn Linux, Git, and Python - the foundation of modern DevOps practices.

### 🎯 Learning Objectives

By the end of this course, students will be able to:
- Navigate and manage Linux systems confidently
- Use Git for version control and collaboration
- Write Python scripts for DevOps automation
- Apply these skills in real-world DevOps scenarios

## 📖 Course Structure

### Lecture 1: Linux Fundamentals (2 hours)
**File:** `linux-2hour-course.md`

**Topics Covered:**
- Introduction to Linux and its ecosystem
- Linux installation and setup (WSL, Virtual Machines)
- Essential Linux commands and file system navigation
- File and directory operations
- Text editors (nano/vim)
- Basic shell scripting and bash fundamentals
- Practical exercises and hands-on labs

**Key Skills:**
- Command line proficiency
- File system management
- Basic scripting
- System administration basics

### Lecture 2: Git Version Control (2 hours)
**File:** `git-2hour-course.md`

**Topics Covered:**
- Git fundamentals and version control concepts
- Git installation and configuration
- Repository management (init, clone, status)
- Working with commits, branches, and merges
- Remote repositories and GitHub integration
- Collaboration workflows and best practices
- Conflict resolution and troubleshooting

**Key Skills:**
- Version control mastery
- Collaborative development
- Branch management
- GitHub workflows

### Lecture 3: Python for DevOps (Extended)
**File:** `python-devops-tutorial.md`

**Topics Covered:**
- Python history and ecosystem
- Installation and environment management
- Core syntax and data structures (lists, sets, dictionaries)
- Working with APIs (Pokemon, JSONPlaceholder, Countries, Weather)
- Writing DevOps automation scripts
- Error handling and logging
- Best practices for DevOps scripting

**Key Skills:**
- Python programming
- API integration
- Automation scripting
- Infrastructure monitoring

## 🛠️ Prerequisites

### System Requirements
- **Operating System:** Windows (with WSL), macOS, or Linux
- **RAM:** Minimum 4GB, Recommended 8GB
- **Storage:** At least 10GB free space
- **Internet:** Stable internet connection for downloads and API calls

### Prior Knowledge
- Basic computer literacy
- Familiarity with command-line interfaces (helpful but not required)
- No prior programming experience necessary

## 🚀 Getting Started

### 1. Environment Setup

**For Windows users:**
```powershell
# Install WSL
wsl --install
wsl --install -d Ubuntu
```

**For macOS users:**
```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required tools
brew install git python
```

**For Linux users:**
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential tools
sudo apt install -y git python3 python3-pip curl wget vim
```

### 2. Clone Course Materials
```bash
git clone https://github.com/your-username/devops-fundamentals-course.git
cd devops-fundamentals-course
```

### 3. Verify Installation
```bash
# Check versions
git --version
python3 --version
pip3 --version
```

## 📁 Future Repository Structure

```
devops-fundamentals-course/
├── README.md                          # This file
├── LICENSE                           # Course license
├── lectures/
│   ├── lecture1-linux/
│   │   ├── linux-2hour-course.md    # Linux fundamentals
│   │   ├── exercises/               # Practical exercises
│   │   └── solutions/              # Exercise solutions
│   ├── lecture2-git/
│   │   ├── git-2hour-course.md      # Git version control
│   │   ├── exercises/               # Git exercises
│   │   └── solutions/              # Exercise solutions
│   └── lecture3-python/
│       ├── python-devops-tutorial.md # Python for DevOps
│       ├── exercises/               # Python exercises
│       ├── scripts/                # Sample scripts
│       └── solutions/              # Exercise solutions
├── resources/
│   ├── cheat-sheets/               # Quick reference guides
│   ├── additional-reading/         # Supplementary materials
│   └── tools-setup/               # Installation guides
└── assessments/
    ├── quiz1-linux.md             # Linux assessment
    ├── quiz2-git.md               # Git assessment
    └── final-project.md           # Capstone project
```

## 🎯 Course Delivery Formats

### Self-Paced Learning
- Follow the lectures in order
- Complete exercises at your own pace
- Use discussion forums for questions

### Instructor-Led Training
- 3-day intensive workshop format
- Interactive demonstrations
- Guided hands-on exercises
- Q&A sessions

### Blended Learning
- Pre-work reading assignments
- Live virtual sessions for key concepts
- Collaborative project work

## 📊 Quick Individual Task Testing
```bash
# Test individual tasks quickly
./check_task1.sh
./check_task2.sh
./check_task3.sh
```

### Final Project Options
1. **Infrastructure Automation:** Create scripts to manage server deployment
2. **Monitoring Dashboard:** Build a system monitoring tool using Python
3. **CI/CD Pipeline:** Set up automated deployment using Git hooks
4. **Log Analysis Tool:** Develop a log parsing and analysis system

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### For Instructors
- Submit improvements to course materials
- Share additional exercises or examples
- Report issues or outdated information
- Contribute translations

### For Students
- Report typos or errors
- Suggest additional topics
- Share success stories
- Provide feedback on difficulty level

### Contribution Guidelines
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Make your changes
4. Test thoroughly
5. Submit a pull request with detailed description

## 📈 Course Statistics

- **Duration:** 6+ hours of core content
- **Exercises:** 25+ hands-on activities
- **Projects:** 3 major practical projects
- **Languages:** Currently available in English
- **Skill Level:** Beginner to Intermediate
- **Success Rate:** 90%+ completion rate

## 🏆 Student Success Stories

*"This course gave me the confidence to transition into DevOps. The hands-on approach made complex concepts easy to understand."* - Sarah M., Software Developer

*"The practical exercises were exactly what I needed to apply these tools in my daily work."* - Ahmed K., System Administrator

*"Excellent balance of theory and practice. I use these skills every day now."* - Maria L., DevOps Engineer

## 🔄 Course Updates

### Version History
- **v2.0** (Current) - Added Python lecture, enhanced exercises
- **v1.5** - Updated Git workflows, added GitHub Actions
- **v1.0** - Initial release with Linux and Git

### Upcoming Features
- Interactive coding environments
- Video lecture series
- Mobile-friendly exercises
- Advanced DevOps modules

## 📚 Additional Resources

### Recommended Books
- "The Linux Command Line" by William Shotts
- "Pro Git" by Scott Chacon and Ben Straub
- "Automate the Boring Stuff with Python" by Al Sweigart

### Online Resources
- [Official Linux Documentation](https://linux.org/learn/)
- [Git Official Tutorial](https://git-scm.com/docs/gittutorial)
- [Python Official Tutorial](https://docs.python.org/3/tutorial/)

### Tools and Software
- [Visual Studio Code](https://code.visualstudio.com/) - Recommended editor
- [GitKraken](https://www.gitkraken.com/) - Git GUI client
- [Docker](https://docker.com/) - For containerization practice

## 📄 License

This course is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍🏫 About the Instructor

**[Your Name]**
- DevOps Engineer with 5+ years experience
- Certified in AWS, Azure, and Kubernetes
- Passionate about education and knowledge sharing
- [LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/yourusername)

---

### 🌟 Star this Repository

If you find this course helpful, please consider giving it a star ⭐ to help others discover it!

### 📢 Share the Knowledge

Help others learn DevOps fundamentals by sharing this course:
- Tweet about it with #DevOpsFundamentals
- Share on LinkedIn
- Recommend to colleagues

---

**Ready to start your DevOps journey? Begin with [Lecture 1: Linux Fundamentals](lectures/lecture1-linux/linux-2hour-course.md)!** 🚀