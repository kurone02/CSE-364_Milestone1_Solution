git clone https://github.com/kurone02/CSE-364_Milestone1_Solution.git
cd CSE-364_Milestone1_Solution

#Create User Administrator MongoDB
mongod --fork --logpath /var/log/mongodb.log
mongosh admin --eval "db.createUser({ user: 'admin', pwd: 'password', roles: ['userAdminAnyDatabase'] })"

#Import data/*.csv to MongoDB
mongoimport --db=cse364 --collection=user --authenticationDatabase admin --username admin --password password --type=csv --file=data/users.csv --fields=user_id.int32\(\),gender.string\(\),age.int32\(\),occupation.int32\(\),zip_code.string\(\) --columnsHaveTypes 
mongoimport --db=cse364 --collection=rating --authenticationDatabase admin --username admin --password password --type=csv --file=data/ratings.csv --fields=user_id.int32\(\),movie_id.int32\(\),rating.int32\(\),timestamp.int32\(\) --columnsHaveTypes 
mongoimport --db=cse364 --collection=movie --authenticationDatabase admin --username admin --password password --type=csv --file=data/movies.csv --fields=movie_id.int32\(\),movie_name.string\(\),genre.string\(\) --columnsHaveTypes 

mvn package
java -jar ./target/cse364-project-1.0-SNAPSHOT.jar