'''
检查lemmasummary字段为空的记录，返回记录id，abbreviation,fullwords,specificmeaning；

'''
import pymysql
class CheckNull(object):
    def checkNull(self):
        data=[]
        try:
            db = pymysql.connect(host="localhost", user="root", password="123456", database="db_sys",charset="utf8")
            print("数据库连接成功")
        except pymysql.Error as e:
            print("数据库连接失败："+str(e))
        #db=pymysql.connect("localhost","root","root","db_sys",use_unicode=True,charset="utf8")
        cursor=db.cursor()
        sql="select id,abbreviation,fullwords,specificmeaning from t_vocabulary where lemmasummary is null or lemmasummary=''"
        #sql="select id,abbreviation,fullwords,specificmeaning from t_vocabulary where priority is null"
        try:
            cursor.execute(sql)
            results=cursor.fetchall()
            #print(results)
            for row in results:
                id=row[0]
                abbreviation = row[1]
                fullwords = row[2]
                specificmeaning = row[3]
                
                word={"id":id,"abbreviation":abbreviation,"fullwords":fullwords,"specificmeaning":specificmeaning}
                #print(word)
                data.append(word)
                
            #print(data)
            return data
        except:
            print ("Error: unable to fecth data")
            return None
        db.close() 

if __name__=="__main__":
    obj_readdata=CheckNull()
    print(obj_readdata.checkNull())
