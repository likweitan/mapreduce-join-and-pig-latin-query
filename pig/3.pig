users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);
tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:long, content:chararray, login:chararray);

users_join_tweets = JOIN tweets BY login, users BY login;

STORE users_join_tweets INTO 'hdfs://localhost:9000/group_assignment/3.result' USING PigStorage (',');