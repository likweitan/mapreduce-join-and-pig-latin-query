-- Write a Pig Latin query that outputs the login of all users in NY state.

users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);

users_in_NY = FILTER users BY state == 'NY';

login_of_users_in_NY = FOREACH users_in_NY GENERATE login;

STORE login_of_users_in_NY INTO 'hdfs://localhost:9000/group_assignment/1.result' USING PigStorage (',');