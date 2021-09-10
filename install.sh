#Delete old system
docker stop webapp
docker rm webapp
echo "Webapp container has been deleted"
docker stop dbserver
docker rm dbserver
echo "Dbserver container has been deleted"
docker rmi imwebapp
docker rmi imdbserver
docker network rm Mynet1
echo "Network has been deleted"
#Deploy new system
docker build --target webapp -t imwebapp .
docker build --target dbserver -t imdbserver .
docker run -it -d -p 9001:9000 --name webapp imwebapp
docker run -it -d -p 1433:1433 --name dbserver imdbserver
docker network create Mynet1
docker network connect Mynet1 webapp
docker network connect Mynet1 dbserver
sleep 15s
ip="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
echo "Deployment succesfull, please wait about 30s then access http://$ip:9001"

