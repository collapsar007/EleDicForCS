# EleDicForCS

###############系统名称
计算机专业词典系统

###############系统说明
该系统用于查询计算机专业词汇，包括词汇缩写，全称，中文，及具体说明，为计算机专业人群学习或想了解相关知识的人群提供便利。

###############系统安装运行要求
1.下载并安装Eclipse并配置好JDK环境
Eclipse下载：https://www.eclipse.org/downloads/
JDK下载：https://www.oracle.com/java/technologies/downloads/#java8
2.下载并安装Mysql数据库，使用前请导入sb_sys.sql（数据库结构文件）或者db_sys_data.sql（带有测试数据的数据库文件）进MySQL，并设置如下：
（1）数据库端口：3306
（2）数据库名：db_sys
（3）数据库用户名：root
（4）数据库密码：123456
3.运行login.jsp进入登录界面进行系统使用
4.如想要自行进行爬取数据，需安装配置Python，下载re，pymysql，request，bs4等模块
  运行crowTheData.py,crow02.py,crow01.py进行数据爬取
  
##############系统使用说明
 使用查询功能无需登录，使用查询以外如反馈功能或管理功能需登录相应账号取得相应权限登录，账号可注册取得

##############代码结构
//系统开发代码结构
.
│  .classpath
│  .project
│  
├─.metadata
│  │  .lock
│  │  .log
│  │  version.ini
│  │  
│  ├─.mylyn
│  │  │  repositories.xml.zip
│  │  │  tasks.xml.zip
│  │  │  
│  │  ├─.taskListIndex
│  │  │      segments_1
│  │  │      write.lock
│  │  │      
│  │  └─contexts
│  └─.plugins
│      ├─org.eclipse.core.resources
│      │  ├─.history
│      │  ├─.root
│      │  │  │  1.tree
│      │  │  │  
│      │  │  └─.indexes
│      │  │          history.version
│      │  │          properties.index
│      │  │          properties.version
│      │  │          
│      │  └─.safetable
│      │          org.eclipse.core.resources
│      │          
│      ├─org.eclipse.core.runtime
│      │  └─.settings
│      │          org.eclipse.ajdt.ui.prefs
│      │          org.eclipse.core.resources.prefs
│      │          org.eclipse.egit.core.prefs
│      │          org.eclipse.jdt.ui.prefs
│      │          org.eclipse.jsch.core.prefs
│      │          org.eclipse.m2e.discovery.prefs
│      │          org.eclipse.mylyn.context.core.prefs
│      │          org.eclipse.mylyn.monitor.ui.prefs
│      │          org.eclipse.mylyn.tasks.ui.prefs
│      │          org.eclipse.ui.editors.prefs
│      │          org.eclipse.ui.ide.prefs
│      │          org.eclipse.ui.workbench.prefs
│      │          org.springframework.ide.eclipse.imports.prefs
│      │          org.springsource.ide.eclipse.commons.configurator.prefs
│      │          org.springsource.ide.eclipse.commons.core.prefs
│      │          org.springsource.ide.eclipse.commons.frameworks.core.prefs
│      │          org.springsource.ide.eclipse.commons.ui.prefs
│      │          org.springsource.ide.eclipse.dashboard.ui.prefs
│      │          
│      ├─org.eclipse.debug.core
│      ├─org.eclipse.e4.workbench
│      │      workbench.xmi
│      │      
│      ├─org.eclipse.emf.common.ui
│      ├─org.eclipse.jdt.core
│      │      assumedExternalFilesCache
│      │      externalFilesCache
│      │      javaLikeNames.txt
│      │      nonChainingJarsCache
│      │      variablesAndContainers.dat
│      │      
│      ├─org.eclipse.jdt.ui
│      │      dialog_settings.xml
│      │      OpenTypeHistory.xml
│      │      QualifiedTypeNameHistory.xml
│      │      
│      ├─org.eclipse.m2e.logback.configuration
│      │      0.log
│      │      logback.1.13.0.20190716-1624.xml
│      │      
│      ├─org.eclipse.mylyn.bugzilla.core
│      ├─org.eclipse.mylyn.context.core
│      │  └─contexts
│      ├─org.eclipse.mylyn.tasks.ui
│      ├─org.eclipse.tips.ide
│      │      dialog_settings.xml
│      │      
│      ├─org.eclipse.ui
│      │      dialog_settings.xml
│      │      
│      ├─org.eclipse.ui.ide
│      │      dialog_settings.xml
│      │      
│      ├─org.eclipse.ui.intro
│      │      introstate
│      │      
│      ├─org.eclipse.ui.workbench
│      │      dialog_settings.xml
│      │      workingsets.xml
│      │      
│      ├─org.eclipse.userstorage.oauth
│      ├─org.eclipse.wst.server.core
│      ├─org.springframework.ide.eclipse.aop.core
│      │      .state
│      │      
│      ├─org.springframework.ide.eclipse.beans.core.metadata
│      │  ├─metadata
│      │  │      .state
│      │  │      
│      │  └─properties
│      │          .state
│      │          
│      ├─org.springframework.ide.eclipse.boot
│      │  └─installs
│      ├─org.springframework.ide.eclipse.boot.dash
│      ├─org.springsource.ide.eclipse.commons.frameworks.core
│      └─org.springsource.ide.eclipse.dashboard.ui
│          └─feeds
│              ├─dashboard.feeds.blogs
│              │      -549550714.xml
│              │      
│              └─dashboard.feeds.update
│                      -1223306788.xml
│                      
├─.settings
│      .jsdtscope
│      org.eclipse.core.resources.prefs
│      org.eclipse.jdt.core.prefs
│      org.eclipse.wst.common.component
│      org.eclipse.wst.common.project.facet.core.xml
│      org.eclipse.wst.jsdt.ui.superType.container
│      org.eclipse.wst.jsdt.ui.superType.name
│      
├─build
│  └─classes
│      └─com
│          ├─bean
│          │      Admin.class
│          │      Feedback.class
│          │      User.class
│          │      Vocabulary.class
│          │      
│          ├─dao
│          │      AdminDAO.class
│          │      FeedbackDAO.class
│          │      UserDAO.class
│          │      VocabularyDAO.class
│          │      
│          ├─filter
│          │      LoginFilter.class
│          │      
│          ├─servlet
│          │      LoginServlet.class
│          │      SearchServlet.class
│          │      UserFeedbackServlet.class
│          │      
│          └─tools
│                  ConnDB.class
│                  
├─src
│  └─com
│      ├─bean
│      │      Admin.java
│      │      Feedback.java
│      │      User.java
│      │      Vocabulary.java
│      │      
│      ├─dao
│      │      AdminDAO.java
│      │      FeedbackDAO.java
│      │      UserDAO.java
│      │      VocabularyDAO.java
│      │      
│      ├─filter
│      │      LoginFilter.java
│      │      
│      ├─servlet
│      │      LoginServlet.java
│      │      SearchServlet.java
│      │      UserFeedbackServlet.java
│      │      
│      └─tools
│              ConnDB.java
│              
└─WebContent
    │  admin01.jsp
    │  admin02.jsp
    │  index.jsp
    │  index2.jsp
    │  login.jsp
    │  modal.jsp
    │  register.jsp
    │  userAdd.jsp
    │  userFeedback.jsp
    │  
    ├─bootstrap
    │  ├─css
    │  │      bootstrap-theme.css
    │  │      bootstrap-theme.css(1).map
    │  │      bootstrap-theme.min.css
    │  │      bootstrap-theme.min.css.map
    │  │      bootstrap.css
    │  │      bootstrap.css.map
    │  │      bootstrap.min.css
    │  │      bootstrap.min.css.map
    │  │      
    │  ├─fonts
    │  │      glyphicons-halflings-regular.eot
    │  │      glyphicons-halflings-regular.svg
    │  │      glyphicons-halflings-regular.ttf
    │  │      glyphicons-halflings-regular.woff
    │  │      glyphicons-halflings-regular.woff2
    │  │      
    │  └─js
    │          bootstrap-table.js
    │          bootstrap.js
    │          bootstrap.min.js
    │          npm.js
    │          
    ├─css
    │      bootstrap-table.min.css
    │      login.css
    │      
    ├─images
    │      background.jpg
    │      
    ├─jquery
    │      jquery-3.2.1.js
    │      jquery-3.2.1.min.js
    │      jquerysession.js
    │      
    ├─js
    │      admin01.js
    │      admin02.js
    │      ajax.js
    │      checkLoginStatus.js
    │      index.js
    │      json.js
    │      json2.js
    │      json3.js
    │      login.js
    │      
    ├─META-INF
    │      MANIFEST.MF
    │      
    └─WEB-INF
        │  web.xml
        │  
        └─lib
                commons-beanutils-1.7.0.jar
                commons-collections-3.1.jar
                commons-lang-2.5.jar
                commons-logging.jar
                ezmorph-1.0.6.jar
                json-lib-2.3-jdk15.jar
                json.jar
                jstl.jar
                mysql-connector-java-5.1.40-bin.jar
                standard.jar
//后台数据爬取代码结构
.
│  .project
│  .pydevproject
│  
├─.vscode
│      launch.json
│      settings.json
│      
└─src
    └─Project
        │  checkNull.py
        │  craw01.py
        │  craw02.py
        │  crawTheData.py
        │  crawThePriority.py
        │  downloader.py
        │  readdata.py
        │  updatePriority.py
        │  writeLemmaSummary.py
        │  __init__.py
        │  
        └─__pycache__
                checkNull.cpython-36.pyc
                checkNull.cpython-37.pyc
                crawThePriority.cpython-36.pyc
                crawThePriority.cpython-37.pyc
                downloader.cpython-36.pyc
                downloader.cpython-37.pyc
                readdata.cpython-36.pyc
                readdata.cpython-37.pyc
                writeLemmaSummary.cpython-36.pyc
                writeLemmaSummary.cpython-37.pyc
                __init__.cpython-36.pyc
                
