'''
爬取‘计算机专业英语词汇’百度百科页面上的内容，爬取缩略词、英文词汇、中文解释,存入数据库
'''
from urllib import request
from bs4 import BeautifulSoup as bs
import re
import pymysql
from urllib.parse import quote
class CrawTheData(object):
    def __init__(self):
        print("CrawTheData创建成功")
        
    def write(self):
        resp = request.urlopen("https://baike.baidu.com/item/"+quote("计算机专业英语词汇"))
        html_doc=resp.read().decode("utf-8")
        
        soup = bs(html_doc,"html.parser")
        try:
            db = pymysql.connect(host="localhost", user="root", password="123456", database="db_sys",charset="utf8")
            print("数据库连接成功")
        except pymysql.Error as e:
            print("数据库连接失败："+str(e))

        #db = pymysql.connect("localhost","root","123456","db_sys" ,use_unicode=True, charset="utf8")
        cursor = db.cursor()
        info_list = soup.find('div', class_="content").find_all(class_="para")[3:]
        # for i in info_list:
        #     print(i.text)
        for content in info_list:
            #print(content.get_text());
            content=content.text
            abb=re.match(r'[^()]*(?=\()',content)
            if abb is not None:
                abbreviation=abb.group().strip()
            #abbreviation=abb.group()
            #print(abbreviation)
    
            fullwords = re.compile(r'(?<=\()[^()]*(?=\))').findall(content)
            if len(fullwords) == 0:
                pass
            else:
                fullwords = fullwords[0].strip()#不保留括号  
            print(fullwords)
            specificmeaning=re.compile(r'[\u4e00-\u9fa5]+').findall(content)
            if len(specificmeaning) == 0:
                pass
            else:
                specificmeaning = specificmeaning[0].strip()
            print(specificmeaning)
            
            sql = "INSERT INTO t_vocabulary(abbreviation,fullwords,specificmeaning) \
                 VALUES ('%s', '%s','%s')" % \
                 (abbreviation,fullwords,specificmeaning)
            try:
                cursor.execute(sql)
                db.commit()
                print("插入数据成功")
            except Exception as e:
                db.rollback()
                print("插入数据失败",str(e))
        db.close()

#主程序测试函数
if __name__=="__main__":
    obj = CrawTheData()
    obj.write()