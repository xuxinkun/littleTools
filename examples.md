# docker tools(docker-tools)

```
[root@mynode-111 ~]# dt-exec d78
[root@f34cee76e36a kubesql]# 

[root@mynode-111 ~]# dt-exec-sh d78
sh-4.2# 

[root@mynode-111 ~]# dt-show-pid d78
18485

[root@mynode-111 ~]# dt-show-pid-all d78
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                18485               1509                0                   Mar12               pts/19              00:00:00            bash
root                30137               1509                0                   Mar18               pts/23              00:00:00            bash

[root@mynode-111 ~]# dt-show-flavor 706c8123de
Id:       	706c8123de
CpuPeriod:	100000    
CpuQuota  	100000    
Memory:   	419430400 
MemorySwap:	419430400 
CpusetCpus:	

[root@mynode-111 ~]# dt-show-flavor-all d78
|Id        	|CpuPeriod 	|CpuQuota  	|Memory    	|MemorySwap	|CpusetCpus	|
|d782b8559e	|0         	|0         	|0         	|0         	|          	|
|4ae89a84d5	|100000    	|100000    	|419430400 	|419430400 	|          	|

[root@mynode-111 ~]# dt-show-volume 706
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/volumes/kubernetes.io~secret/ambassador-token-d649t
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/etc-hosts
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/containers/ambassador/91c2bfd8

[root@mynode-111 ~]# dt-show-volume-all 706
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/volumes/kubernetes.io~secret/ambassador-token-d649t : /var/run/secrets/kubernetes.io/serviceaccount
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/etc-hosts : /etc/hosts
/home/export/kubelet/pods/8c3881e0-22ca-11e9-8db0-e0db55137a74/containers/ambassador/91c2bfd8 : /dev/termination-log

[root@mynode-111 ~]# dt-lookup-by-pid 30137
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
d782b8559e02        xuxinkun/kubesql    "bash"              8 days ago          Up 8 days                               kubesql

[root@mynode-111 ~]# dt-lookup-by-volume /export/cfs/d2
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
b2cac5fd06d3        8e1217be9554        "/bin/sh -c cfs-da..."   7 weeks ago         Up 7 weeks                              k8s_cfs-data-1_data1-0_cfs_2de15105-23ac-11e9-8db0-e0db55137a74_0

```


# kubernetes tools(kube-tools)

```
[root@localhost ~]# kt-exec nevermore nevermore-a76210c9 
[root@host-10-182-39-226 /]# 

[root@localhost ~]# kt-exec-sh  nevermore nevermore-a76210c9 
sh-4.1# 

[root@localhost ~]# kt-get-node  111.22.201.39
Name:               111.22.201.39
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux

[root@localhost ~]# kt-get-node-notready 
11.1.11.111      NotReady,SchedulingDisabled   <none>    90d       v1.5.3-5                           <none>        CentOS Linux 7 (Core)   3.10.0-327.28.3.el7.x86_64          docker://1.10.3
11.1.11.119      NotReady                      <none>    90d       v1.5.3-5                           <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7_3313.x86_64   docker://1.10.3


[root@localhost ~]# kt-get-node-ready 
111.22.160.107   Ready                         <none>    247d      v1.6.2-93                          <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7_3313.x86_64   docker://1.10.3
111.22.192.45    Ready                         <none>    247d      v1.6.2-93                          <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7_3313.x86_64   docker://1.10.3


[root@localhost ~]# kt-get-node-all
NAME             STATUS                        ROLES     AGE       VERSION                            EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION                      CONTAINER-RUNTIME
11.3.96.169      NotReady                      <none>    90d       v1.5.3-5                           <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7._3313.x86_64   docker://1.10.3
111.22.160.107   Ready                         <none>    247d      v1.6.2-93                          <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7._3313.x86_64   docker://1.10.3
111.22.192.45    Ready                         <none>    247d      v1.6.2-93                          <none>        CentOS Linux 7 (Core)   3.10.0-693.5.2.el7._3313.x86_64   docker://1.10.3

[root@localhost ~]# kt-get-pod nevermore nevermore-a76210c9 
Name:           nevermore-a76210c9
Namespace:      nevermore
Node:           111.22.201.39/111.22.201.39
Start Time:     Mon, 12 Nov 2018 21:49:16 +0800
Labels:         app=nevermore

[root@localhost ~]# kt-get-pod-node  nevermore nevermore-a76210c9 
NAME                 READY     STATUS    RESTARTS   AGE       IP              NODE
nevermore-a76210c9   1/1       Running   2          128d      10.182.39.226   111.22.201.39
NAME            STATUS    ROLES     AGE       VERSION     EXTERNAL-IP   OS-IMAGE                KERNEL-VERSION               CONTAINER-RUNTIME
111.22.201.39   Ready     <none>    191d      v1.6.2-93   <none>        CentOS Linux 7 (Core)   3.10.0-327.28.3.el7.x86_64   docker://1.10.3

[root@localhost ~]# kt-get-pod-by-rs nevermore nevermore-0873e563-f9de2900
NAME                 READY     STATUS    RESTARTS   AGE       IP              NODE
nevermore-a76210c9   1/1       Running   2          128d      10.182.39.226   111.22.201.39

[root@localhost ~]# kt-get-pod-by-ip 10.182.39.226
NAME                 READY     STATUS    RESTARTS   AGE       IP              NODE
nevermore-a76210c9   1/1       Running   2          128d      10.182.39.226   111.22.201.39
```