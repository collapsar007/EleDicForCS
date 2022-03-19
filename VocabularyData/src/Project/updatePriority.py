'''
更新priority
'''
from Project import downloader,readdata, writeLemmaSummary,crawThePriority
from urllib.parse import quote
from bs4 import BeautifulSoup as bs
import pymysql
class Spider(object):
    def __init__(self):
        self.downloader=downloader.Downloader()
        self.read=readdata.ReadData()
        self.write=writeLemmaSummary.Write()
        self.priority=crawThePriority.CrawThePriority()
        
    def updatePriority(self):
        data=self.read.readData(1)
        #print(data)
        db = pymysql.connect("localhost","root","root","db_sys" ,use_unicode=True, charset="utf8")
        cursor = db.cursor()
        for row in data:
            id=row["id"]
            abbreviation = row["abbreviation"]
            fullwords = row["fullwords"]
            specificmeaning = row["specificmeaning"]
            url="https://baike.baidu.com/item/"+quote(specificmeaning)
            print(specificmeaning)
            html_doc=self.downloader.download(url)
            #try:
            if html_doc:
                priority=self. priority.getThePriority(specificmeaning)
                print(priority)
                sql="UPDATE t_vocabulary set priority= '%d' where id='%d'" % (priority,id)
                try:
                    cursor.execute(sql)
                    db.commit()
                    print("插入数据成功")
                except:
                    db.rollback()
                    print("插入数据失败")
        db.close()

if __name__=="__main__":
    obj_spider = Spider()
    obj_spider.updatePriority()
