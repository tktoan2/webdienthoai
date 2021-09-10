docker build --target webapp -t imwebapp .
docker build --target dbserver -t imdbserver .
docker run -it -d -p 9001:9000 --name webapp imwebapp
docker run -it -d -p 1433:1433 --name dbserver imdbserver
docker network create Mynet1
docker network connect Mynet1 webapp
docker network connect Mynet1 dbserver
echo "Deployment succesfull"
