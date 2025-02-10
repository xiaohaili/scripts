#!/bin/bash

do_something() {
	if [ $# -eq 0 ]; then
		task=1
	else
		task=$1
	fi
	#echo "task=$task"

	s=0
	N=100000
	for ((i=0; i<task*N; i++)); do
		s=$((s+1))
	done
	#echo "s=$s i=$i"
}

do_something_ssh() {
	ssh localhost id -u >/dev/null 2>&1
}

# 'ctrl+c' to stop
trap "exec 6>&-; exec 6<&-; exit 0" 2

num_cpus=$(lscpu -b -p=Core,Socket | grep -v '^#' | sort -u | wc -l)
#num_threads=$((num_cpus-1))
num_threads=10
tmpfile="/tmp/$$-XX.fifo"
echo "#cpu=$num_cpus, #threads=$num_threads, tmpfile=$tmpfile"

mkfifo $tmpfile
exec 6<>$tmpfile
unlink $tmpfile

for ((i=0; i<$num_threads; i++)); do
	echo >&6
done

start_time=$(date "+%s")
for ((i=0; i<500; i++)); do
	read -u6
	{
		do_something_ssh
		echo >&6
	}&
done
wait
end_time=$(date "+%s")

echo "time: $start_time, $end_time, $((end_time-start_time))"

exec 6>&-
exec 6<&-
