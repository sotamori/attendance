from flask import Flask

class Member():
    def __init__(self, name, joinDate):
        self.name = name
        self.joinDate = joinDate

    def __str__(self):
        return "Name : {}\n Join Date : {}" 
        
    def display(self):
        return print()