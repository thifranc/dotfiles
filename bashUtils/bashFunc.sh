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

yaki () 
{ 
    if [ $# -gt 0 ] && [ ! "$1" = 'up' ] && [ ! "$1" = 'down' ]; then
        echo 'usage: yaki [up|down], defaults to up if no args';
        return;
    fi;
    if [ $# -gt 0 ]; then
        if [ "$1" = 'up' ]; then
            ARG='\+';
        else
            if [ "$1" = 'down' ]; then
                ARG='\-';
            fi;
        fi;
    else
        ARG='\+';
    fi;
    service --status-all 2> /dev/null | grep -E "^\s\[\s${ARG}"
}

