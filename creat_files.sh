#!/bin/bash

# Task 2: File Creator Script
echo "creating project folder..."
mkdir my_project

echo "creating files..."
touch my_project1/file1.txt
touch my_project1/file2.txt
touch my_project1/file3/txt

echo "done! Here's what was created:"
ls my_project1/
