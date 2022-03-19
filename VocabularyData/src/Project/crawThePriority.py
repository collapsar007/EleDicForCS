'''
Created on 2022年2月19日

@author: collapsar
'''
import requests
from bs4 import BeautifulSoup as bs
import re
class CrawThePriority(object):
    def __init__(self):
        print("爬取priority")
        
    def getThePriority(self,word):
        try:
            headers = {
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                'Accept-Encoding': 'gzip, deflate, compress',
                'Accept-Language': 'en-us;q=0.5,en;q=0.3',
                'Cache-Control': 'max-age=0',
                'Connection': 'keep-alive',
                'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:22.0) Gecko/20100101 Firefox/22.0'
                }
            url = 'http://www.baidu.com.cn/s?wd=' + word
            html = requests.get(url=url,headers=headers)
            soup = bs(html.content,"html.parser")
            result=soup.find("div",id="content_left").find("div",class_="xpath-log").get("data-op")
            s=eval(result)
            priority=int(eval(result)['y'],16)
            #print(int(s["y"],16))
            return priority
        except:
            return 1#爬取不到默认为1
#主程序测试函数
if __name__ == '__main__':
    object1=CrawThePriority()
    print (object1.getThePriority('计算机专业英语词汇'))

