tweets = LOAD 'hdfs://localhost:9000/group_assignment/tweets.csv' USING PigStorage(',') AS (id:chararray, content:chararray, login:chararray);

filtered_tweets = FILTER raw BY (content matches '.*favorite.*');

filtered_tweets_ordered_by_id = ORDER filtered_tweets BY id;

STORE filtered_tweets_ordered_by_id INTO 'hdfs://localhost:9000/group_assignment/2/' USING PigStorage (',');