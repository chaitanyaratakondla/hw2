# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!
# student note: Ran rails generate model for movie, person and role in terminal
# student note: Inserted columns into db/migrate files for all 3 of above
# student note: Updated apps/models with belongs_to and has_many
# student note: ran db:migrate to create development.sqlite3 and data file. Ran rails runner data.rb to check layout of table

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

#starting with persons table

person = Person.new
person.name = "Christopher Nolan"
person.save

person = Person.new
person.name = "Christian Bale"
person.save

person = Person.new
person.name = "Michael Caine"
person.save

person = Person.new
person.name = "Liam Neeson"
person.save

person = Person.new
person.name = "Katie Holmes"
person.save

person = Person.new
person.name = "Gary Oldman"
person.save

person = Person.new
person.name = "Heath Ledger"
person.save

person = Person.new
person.name = "Aaron Eckhart"
person.save

person = Person.new
person.name = "Maggie Gyllenhaal"
person.save

person = Person.new
person.name = "Tom Hardy"
person.save

person = Person.new
person.name = "Joseph Gordon-Levitt"
person.save

person = Person.new
person.name = "Anne Hathway"
person.save

# Values for movies table

director = Person.where({name: "Christopher Nolan"})[0]
movie = Movie.new({
    title: "Batman Begins",
    year_of_release: 2005,
    rating: "PG-13",
    person_id: director.id
})
movie.save

movie = Movie.new({
    title: "The Dark Knight",
    year_of_release: 2008,
    rating: "PG-13",
    person_id: director.id
})
movie.save

movie = Movie.new({
    title: "The Dark Knight Rises",
    year_of_release: 2012,
    rating: "PG-13",
    person_id: director.id
})
movie.save

# Values for roles table

moviename = Movie.where({title: "Batman Begins"})[0]

actorname = Person.where({name: "Christian Bale"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Bruce Wayne"
})
role.save

actorname = Person.where({name: "Michael Caine"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Alfred"
})
role.save

actorname = Person.where({name: "Liam Neeson"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Ra's al-Ghul"
})
role.save

actorname = Person.where({name: "Katie Holmes"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Rachel Dawes"
})
role.save

actorname = Person.where({name: "Gary Oldman"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Commissioner Gordon"
})
role.save

moviename = Movie.where({title: "The Dark Knight"})[0]

actorname = Person.where({name: "Christian Bale"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Bruce Wayne"
})
role.save

actorname = Person.where({name: "Heath Ledger"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "The Joker"
})
role.save

actorname = Person.where({name: "Aaron Eckhart"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Harvey Dent"
})
role.save

actorname = Person.where({name: "Michael Caine"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Alfred"
})
role.save

actorname = Person.where({name: "Maggie Gyllenhaal"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Rachel Dawes"
})
role.save

moviename = Movie.where({title: "The Dark Knight Rises"})[0]

actorname = Person.where({name: "Christian Bale"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Bruce Wayne"
})
role.save

actorname = Person.where({name: "Gary Oldman"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Commissioner Gordon"
})
role.save

actorname = Person.where({name: "Tom Hardy"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Bane"
})
role.save

actorname = Person.where({name: "Joseph Gordon-Levitt"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "John Blake"
})
role.save

actorname = Person.where({name: "Anne Hathway"})[0]
role = Role.new({
    movie_id: moviename.id,
    person_id: actorname.id,
    character_name: "Selina Kyle"
})
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
