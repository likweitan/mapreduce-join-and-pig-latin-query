-- Write a Pig Latin query that outputs the login of all users in NY state.

users = LOAD 'hdfs://localhost:9000/group_assignment/users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);

-- Use the FILTER command to remove all records with a state which is not NY.
users_in_NY = FILTER users BY state == 'NY';

-- Use the FOREACH-GENERATE command to project login field from relation users_in_NY to relation login_of_users_in_NY.
login_of_users_in_NY = FOREACH users_in_NY GENERATE login;

-- Use the default Pig output function to store the results.
STORE login_of_users_in_NY INTO 'hdfs://localhost:9000/group_assignment/1.result' USING PigStorage (',');