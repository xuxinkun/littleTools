#!/usr/bin/env bash
function dt-exec()
{
	docker exec -it $1 bash
}
function dt-exec-sh()
{
	docker exec -it $1 sh
}
function dt-show-pid()
{
	docker inspect -f '{{.State.Pid}}' $1
}
function dt-show-pid-all()
{
	docker top $1
}
function dt-show-flavor()
{
	docker inspect -f '{{printf "%-10v\t%-10.10v\n%-10v\t%-10.10v\n%-10v\t%-10.10v\n%-10v\t%-10.10v\n%-10v\t%-10.10v\n%-10v\t%v" "Id:" .Id "CpuPeriod:" .HostConfig.CpuPeriod "CpuQuota" .HostConfig.CpuQuota "Memory:" .HostConfig.Memory "MemorySwap:" .HostConfig.MemorySwap "CpusetCpus:" .HostConfig.CpusetCpus}}' $1
}
function dt-show-flavor-all()
{
	printf '|%-10s\t|%-10s\t|%-10s\t|%-10s\t|%-10s\t|%-10s\t|\n' 'Id' 'CpuPeriod' 'CpuQuota' 'Memory'  'MemorySwap' 'CpusetCpus'
	for container_id in `docker ps -q`
	do
		docker inspect -f '{{printf "|%-10.10v\t|%-10.8v\t|%-10.8v\t|%-10.8v\t|%-10.8v\t|%-10v\t|" .Id .HostConfig.CpuPeriod .HostConfig.CpuQuota .HostConfig.Memory .HostConfig.MemorySwap .HostConfig.CpusetCpus}}' $container_id
	done
}
function dt-show-volume()
{
	docker inspect -f '{{range .Mounts}}{{printf "%s\n" .Source}}{{end}}' $1
}
function dt-show-volume-all()
{
	docker inspect -f '{{range .Mounts}}{{printf "%s : %s\n" .Source .Destination}}{{end}}' $1
}
function dt-lookup-by-pid()
{
	memory_cgpath=`cat /proc/$1/cgroup |grep memory`
	for container_id in `docker ps -q`
	do
		pid_num=`docker inspect -f '{{.State.Pid}}' $container_id`
		container_cgpath=`cat /proc/$pid_num/cgroup|grep memory`
		if [ "$memory_cgpath" = "$container_cgpath" ];then
			docker ps -f id=$container_id
			break
		fi
	done
}
function dt-lookup-by-volume()
{
	lookup_volume=$1
	for container_id in `docker ps -q`
	do
		volumes=`docker inspect -f '{{range .Mounts}}{{printf "%s\n" .Source}}{{end}}' $container_id`
		for volume in $volumes
		do
			if [[ $lookup_volume =~ $volume ]]
			then
				docker ps -f id=$container_id
			fi
		done
	done
}