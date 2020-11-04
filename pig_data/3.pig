users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);
tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:chararray, content:chararray, login:chararray);

users_join_tweets = JOIN users BY login, tweets BY login;

STORE users_join_tweets INTO 'hdfs://localhost:9000/group_assignment/3.result' USING PigStorage (',');