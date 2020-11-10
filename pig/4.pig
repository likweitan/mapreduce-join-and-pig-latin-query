users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);
tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:chararray, content:chararray, login:chararray);

users_join_tweets = JOIN tweets BY login, users BY login;

name_group = GROUP users_join_tweets BY name;
number_of_tweets = FOREACH name_group GENERATE group, COUNT(users_join_tweets.id);

STORE number_of_tweets INTO 'hdfs://localhost:9000/group_assignment/4.result' USING PigStorage (',');