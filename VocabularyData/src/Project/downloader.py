'''
网页下载器，判断爬取的网页是否有效，有效则返回爬取的网页的文档树
'''
import urllib.request

class Downloader(object):
    def download(self,url):
        if url is None:
            return None
        
        response=urllib.request.urlopen(url)
        #if response.getcode()!=200:#判断是否请求成功
        #    return None
        url=response.geturl()
        if url == "https://baike.baidu.com/error.html":
            print("爬取失败")
            return None
        #print(url)
        return response.read().decode("utf-8")
if __name__=="__main__":
    obj_downloader=Downloader()
    print(obj_downloader.download("https://baike.baidu.com/item/Python/407313"))