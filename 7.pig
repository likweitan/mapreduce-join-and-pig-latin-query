users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);
tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:chararray, content:chararray, login:chararray);

users_join_tweets = JOIN users BY login LEFT, tweets BY login;

login_group = GROUP users_join_tweets BY (login, name);
number_of_tweets = FOREACH login_group GENERATE group, COUNT(users_join_tweets.id) as number;
no_tweets = FILTER number_of_tweets BY number == 0;
no_tweets_names = FOREACH no_tweets GENERATE group.name;

STORE at_least_two_tweets_names INTO 'hdfs://localhost:9000/group_assignment/7.result';