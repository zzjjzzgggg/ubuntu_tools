#! /bin/bash

dpkg -l | awk '/^rc/{ print $2}' | sudo xargs dpkg --purge 

