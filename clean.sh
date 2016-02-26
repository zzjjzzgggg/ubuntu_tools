#! /bin/bash


cd /var/cache/apt/archives/
printf '%s\n' *.deb | awk -F_ '{ print $1 }' | sort -u | 
while read pkg; do 
  pkg_files=($(ls -t "$pkg"_*.deb))
  nr=${#pkg_files[@]}
  if ((nr > 1)); then
	unset pkg_files[0]
	echo rm "${pkg_files[@]}"
  fi
done


dpkg -l | awk '/^rc/{print $2}' | sudo xargs dpkg --purge

