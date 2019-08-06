# myhello

## Build

docker image build -t myhello .

## Run

docker container run -p 9999:8888 myhello

## Tag

docker tag myhello udhos/myhello:latest

## Push

docker image push udhos/myhello

