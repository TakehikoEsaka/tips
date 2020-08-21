from selenium import webdriver
browser = webdriver.Firefox()
browser.implicitly_wait(10) # 要素がみつかるまで待機する.

# todo
# githubチュートリ触る：https://kurozumi.github.io/selenium-python/navigating.html
# element = browser.find_element_by_xpath("//*[text()=\"ログイン\"]").click() # テキストで検索したい時.（inputのvalue値などはこれでは取得できない）
# ?? element_idで検索する方法もあり。
# ?? どうやってelement_idを調べるか
# ?? classで他に同じ名前がないか調べる方法はないか？？
from time import sleep

def login(base_url):
    browser.get(base_url) # アップロード用のデモサイト
    browser.find_element_by_name("login_id").send_keys("admin") # nameで指定
    browser.find_element_by_name("password").send_keys("admin")
    search = browser.find_elements_by_class_name("btn-primary") #hmtlのxpathを使ってエレメントを取ってくる（find_element_by_xpathなら１つだけ値をもってくる）
    print(search)
    search[0].click() 

def add_pdf(file_id, file_name):
    browser.find_element_by_class_name("btn-outline-secondary").click()
    browser.find_element_by_class_name("input-sm").send_keys(file_id)
    search = browser.find_element_by_class_name("custom-file-input")
    search.send_keys(file_name) # send_keyでOSのファイルブラウザーにフォーカスが当たってしまうのを回避
    browser.find_element_by_class_name("btn-primary").click()
    sleep(180)

login(base_url = 'http://127.0.0.1:5000/bc/')

import glob
import os
file_names = glob.glob("/home/keisoku/Desktop/esaka/docker/盤集計pdf_本番環境/pdf/*")
for i, file_name in enumerate(file_names):
    file_id = os.path.splitext(os.path.basename(file_name))[0]
    print(file_id)
    print(file_name)
    add_pdf(file_id, file_name)