# MapReduce and Pig Latin Query

To get some hands on experience with the pig/latin language and capabilities, you will implement a few
different queries -- aggregating content from two different collections. For you to have a better appreciation
for the features provided by Pig Latin, you will also implement a join between the two collections we provide
using both MapReduce and Pig Latin.

As input you will read from two CSV files that contain descriptions about users and tweets, respectively will
be upload into your blackboard (each group will have different users and tweets file).

Each line in the user collection contains login, name and state from a specific user. Each line in the
collection of tweets has the tweet id, content, and a reference to the user who wrote that tweet.

Here are the problems you will solve:

1. Write a Pig Latin query that outputs the login of all users in NY state.
2. Write a Pig Latin query that returns all the tweets that include the word 'favorite', ordered by tweet
   id.
3. Write the equivalent join using Pig Latin.
4. Write a Pig Latin query that returns the number of tweets for each user name (not login). You should
   output one user per line, in the following format: user_name, number_of_tweets
5. Write a Pig Latin query that returns the number of tweets for each user name (not login), ordered
   from most active to least active users. You should output one user per line, in the following format:
   user_name, number_of_tweets
6. Write a Pig Latin query that returns the name of users that posted at least two tweets. You should
   output one user name per line.
7. Write a Pig Latin query that returns the name of users that posted no tweets. You should output
   one user name per line.
