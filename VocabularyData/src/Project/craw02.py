'''
Created on 2022年2月17日

@author: collapsar
'''

import downloader, writeLemmaSummary, checkNull,crawThePriority
from urllib.parse import quote
from bs4 import BeautifulSoup as bs
class Spider(object):
    def __init__(self):
        self.downloader=downloader.Downloader()
        self.check=checkNull.CheckNull()
        self.write=writeLemmaSummary.Write()
        self.priority=crawThePriority.CrawThePriority()
    def craw(self):
        data=self.check.checkNull()
        #print(data)
        for row in data:
            id=row["id"]
            abbreviation = row["abbreviation"]
            fullwords = row["fullwords"]
            specificmeaning = row["specificmeaning"]
            #print ("abbreviation=%s,fullwords=%s,age=%s" % (abbreviation, fullwords, specificmeaning ))
            url="https://baike.baidu.com/item/"+quote(fullwords)
            html_doc=self.downloader.download(url)
            try:
                if html_doc:
                #print(html_doc)
                    soup = bs(html_doc,"html.parser")
                    try:
                        text=soup.find("div",class_="lemma-summary").get_text().strip()
                    
                    except:
                        try:
                            text=soup.find("div",class_="main-content").find("div",class_="para").get_text().strip()
                        except:
                            continue
                    priority=self.priority.getThePriority(fullwords)
                    if text:
                        #for tag in soup.find_all("div",class_="lemma-summary"):
                        lemmasummary=text
                        #print(lemmasummary)#测试结果
                        self.write.write(id,lemmasummary, url,priority)
                    elif soup.find("div",class_="main-content").find("div",class_="para"):
                        lemmasummary=soup.find("div",class_="main-content").find("div",class_="para").get_text().strip()
                        #print(lemmasummary)#测试结果
                        self.write.write(id,lemmasummary, url,priority)
            except:
                print("craw failed")   
    
    
if __name__=="__main__":
    obj_spider = Spider()
    obj_spider.craw()
