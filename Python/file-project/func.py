# Imports
import os
# Functions

def file_create():
    fileName = input("What will the file be called?: ")
    open(fileName, "x")

def file_edit():
    fileName = input("Name of the file to be edited: ")
    note = input("What would you like to add?: ")
    with open(fileName, "a") as f:
        f.write(note)

def file_write():
    fileName = input("Name of the file to be overwritten: ")
    note = input("What is your input: ")
    with open(fileName, "w") as f:
        f.write(note)

def file_read():
    fileName = input("What is the name of the file? (include absolute path if not in cd): ")
    f = open(fileName)
    print(f.read())

def file_del():
    fileName = input("What is the file you're deleting: ")
    if os.path.exists(fileName):
        os.remove(fileName)
    else:
        print("File does not exist.")