# useful commands
## build container with no cache
```
docker-compose build --no-cache
```
## open terminal to docker
```
docker-compose exec iris iris session iris -U IRISAPP
```
## export IRIS Analytics artifacts
```
d ##class(dev.code).export("*.DFI")
```

## clean up docker 
```
docker system prune -f
```




