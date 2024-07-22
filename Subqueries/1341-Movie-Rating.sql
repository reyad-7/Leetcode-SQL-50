-- your task is to find the name of the user who has rated the greatest number of movies.
--       Find the movie name with the highest average rating in February 2020.

-- The first part of the query finds the user who has rated the most movies.
(
    select u.name as results
    from Users u
    join MovieRating m on u.user_id = m.user_id
    group by u.user_id
    -- Order by the count of ratings in descending order.
    -- In case of a tie, order by the user's name lexicographically.
    order by count(*) desc, u.name
    -- Limit the result to retrieve the only first user.
    limit 1
)
UNION All 
-- The second part of the query finds the movie with the highest average rating in February 2020.
(
    select a.title as results
    from Movies a
    join MovieRating b on a.movie_id = b.movie_id
    -- Filter ratings to only include those from February 2020.
    where DATE_FORMAT(created_at, "%Y-%m") = "2020-02"
    group by a.movie_id
    -- Order by the average rating in descending order.
    -- In case of a tie, order by the movie's title lexicographically.
    order by avg(b.rating) desc, a.title
    -- Limit the result to retrieve the only first movie.
    limit 1
);

-- Explanation:
-- The first part of the query identifies the user who has rated the greatest number of movies.
-- It groups the ratings by user ID, counts the number of ratings for each user, and orders the results
-- to find the user with the highest count. In case of a tie, it sorts by user name lexicographically
-- and limits the result to one user.

-- The second part of the query finds the movie with the highest average rating in February 2020.
-- It filters ratings to include only those from February 2020, groups the ratings by movie ID,
-- calculates the average rating for each movie, and orders the results to find the movie with the highest
-- average rating. In case of a tie, it sorts by movie title lexicographically and limits the result to one movie.


-- NOTE : we use union all not just union as there is a case where the user name is the same as the movie title in this case the output will be just only one name but we want both user name and movie title 