#!/bin/bash

gbdel(){ 
	git branch -d $1 && git push origin -d $1
}

gbdelLocal(){
	cd $1 ; git branch | grep -v "master" | xargs git branch -d ; cd -
}

gbdelRemote(){
	cd $1 ; git branch | grep -v "master" | xargs git push origin -d ; cd -
}

dockerRmi(){
	docker stop $1 ; docker rm $1 ; docker rmi "docker_$1"
}

dockerGroundZero(){
	docker stop `docker ps -aq` && docker rm `docker ps -aq` && docker rmi `docker images -q`
}

gcomit(){
	git add . ; git commit -m "$1" ; git push origin $(git_current_branch)
}
