users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);
tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:long, content:chararray, login:chararray);

users_join_tweets = JOIN tweets BY login, users BY login;

login_group = GROUP users_join_tweets BY (users::login, name);
number_of_tweets = FOREACH login_group GENERATE group, COUNT(users_join_tweets) as number;
at_least_two_tweets = FILTER number_of_tweets BY number > 1;
at_least_two_tweets_names = FOREACH at_least_two_tweets GENERATE group.name;

STORE at_least_two_tweets_names INTO 'hdfs://localhost:9000/group_assignment/6.result';