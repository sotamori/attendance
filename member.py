from flask import Flask

class Member():
    def __init__(self, name, joinDate):
        self.name = name
        self.joinDate = joinDate


    def display(self):
        return self.name, self.joinDate