# 例えばfind("/home/keisoku/デスクトップ/tmp_data_esaka/project/")で実行
# 参考：https://note.nkmk.me/python-os-basename-dirname-split-splitext/

import os
import shutil

def find(search_path):
    i = 0
    for root, dirs, files in os.walk(search_path): #os.walkでファイルの検索が可能
        for file in files:
            _, ext = os.path.splitext(file) #拡張子を取ってきたい時はos.path.splitext()
            if "pdf" in ext:
                print(os.path.join(root, file)) #ディレクトリとファイル名をくっつけたいときはos.path.join()
                copy_file(os.path.join(root, file), i)
                i = i + 1
                
def copy_file(org_path, i):
    copied_path = "/home/keisoku/デスクトップ/tmp_data_esaka/本番機_pdf/" + str(i) + ".pdf"
    #copied_path = "/home/keisoku/デスクトップ/tmp_data_esaka/本番機_pdf/" + str(os.path.basename(org_path)) # basenameで拡張子付きファイル名取得可能
    shutil.copy(org_path, "/home/keisoku/デスクトップ/tmp_data_esaka/本番機_pdf/" + str(i) + ".pdf")
    print(copied_path)
