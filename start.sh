docker build -t storj-integration .
docker create -p 3000:3000 -t -i storj-integration bash
#docker start -a -i storj-integration
