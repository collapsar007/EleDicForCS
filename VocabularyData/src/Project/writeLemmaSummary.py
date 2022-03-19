'''
Created on 2022年2月12日

@author: collapsar
'''
#coding=utf-8
import re
import pymysql
class Write(object):
    def write(self,id,lemma,address,priority):
        try:
            db = pymysql.connect(host="localhost", user="root", password="123456", database="db_sys",charset="utf8")
            print("数据库连接成功")
        except pymysql.Error as e:
            print("数据库连接失败："+str(e))
        cursor = db.cursor()
        sql="UPDATE t_vocabulary set lemmasummary='%s',address='%s',priority= '%d' \
        where id='%d'" % (lemma,address,priority,id)
        try:
            cursor.execute(sql)
            db.commit()
            print("插入数据成功")
        except:
            db.rollback()
            print("插入数据失败")
        db.close()


