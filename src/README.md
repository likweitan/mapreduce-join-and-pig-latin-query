# How to compile Mapreduce Program

Before compiling your first hadoop program, please see the instructions on how to run the WordCount Example.

Set the HADOOP_CLASSPATH:

```
C:\Users\likwe>hadoop classpath
C:\hadoop-3.3.0\etc\hadoop;C:\hadoop-3.3.0\share\hadoop\common;C:\hadoop-3.3.0\share\hadoop\common\lib\*;C:\hadoop-3.3.0\share\hadoop\common\*;C:\hadoop-3.3.0\share\hadoop\hdfs;C:\hadoop-3.3.0\share\hadoop\hdfs\lib\*;C:\hadoop-3.3.0\share\hadoop\hdfs\*;C:\hadoop-3.3.0\share\hadoop\yarn;C:\hadoop-3.3.0\share\hadoop\yarn\lib\*;C:\hadoop-3.3.0\share\hadoop\yarn\*;C:\hadoop-3.3.0\share\hadoop\mapreduce\*

C:\Users\likwe>set HADOOP_CLASSPATH=%HADOOP_CLASSPATH%;C:\hadoop-3.3.0\etc\hadoop;C:\hadoop-3.3.0\share\hadoop\common;C:\hadoop-3.3.0\share\hadoop\common\lib\*;C:\hadoop-3.3.0\share\hadoop\common\*;C:\hadoop-3.3.0\share\hadoop\hdfs;C:\hadoop-3.3.0\share\hadoop\hdfs\lib\*;C:\hadoop-3.3.0\share\hadoop\hdfs\*;C:\hadoop-3.3.0\share\hadoop\yarn;C:\hadoop-3.3.0\share\hadoop\yarn\lib\*;C:\hadoop-3.3.0\share\hadoop\yarn\*;C:\hadoop-3.3.0\share\hadoop\mapreduce\*
```

Compile:

```
C:\Users\likwe>javac -classpath %CLASSPATH% -d /Join *.java
```

Create JAR:

```
C:\Users\likwe>jar -cvf Join.jar -C /Join   / .
```
