from flask import Flask
from urllib.request import urlopen
from bs4 import BeautifulSoup
from member import Member

app = Flask(__name__)

@app.route("/")
def main(self):
    '''
    メンバー取得
    '''
    member = Member("Sota, Mori", "2015/04/01")

    '''
    表作成
    '''

    '''
    メンバー表示
    '''
    return member.display