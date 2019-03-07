#!/bin/bash

ptest () {
	cd ~/octopuce/git/puppet-environment/modules/octopuce/ 
	bundle exec rspec --format documentation --color --pattern spec/classes/$1
}

