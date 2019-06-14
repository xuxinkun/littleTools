# littleTools

littleTools contains a set of short commands used to make the input of some commands simple.

littleTools has docker-tools and kube-tools to simplify the input of command `docker` and `kubectl`.

For example, if you want to exec into a container, you may enter the command `docker exec -it xxx bash`. With littleTools, just use `dt-exec xxx` can achieve it.

littleTools is written by shell function. So `tab` key can help the users to complete the command automaticly.

## install 

```
git clone https://github.com/xuxinkun/littleTools
cd littleTools
chmod +x install.sh
./install.sh
```

## docker tools(docker-tools)

| command             | params        | description                                                  |
| ------------------- | ------------- | ------------------------------------------------------------ |
| dt-exec             | {containerid} | Exec into the container with bash.                           |
| dt-exec-sh          | {containerid} | Exec into the container with sh.                             |
| dt-show-pid         | {containerid} | Show the pid of the num 0 process of the container.          |
| dt-show-pid-all     | {containerid} | Show the pids of all the processes of the container.         |
| dt-show-flavor      | {containerid} | Show the flavor info such as cpu/memory of the container.    |
| dt-show-flavor-all  | None          | Show the flavor info such as cpu/memory of all the containers. |
| dt-show-volume      | {containerid} | Show the volume path on host of the container.               |
| dt-show-volume-all  | {containerid} | Show the volume path on host and bind path in container of the container. |
| dt-lookup-by-pid    | {pid}         | Look up the container which contains the process with the {pid} on host. |
| dt-lookup-by-volume | {volume path} | Look up the container with volumes which contains the {volume path} on host. |


## kubernetes tools(kube-tools)

| command              | params                                     | description                         |
| -------------------- | ------------------------------------------ | ----------------------------------- |
| kt-exec              | {pod name} or {namespace} {pod name}       | Exec into the pod with bash.        |
| kt-exec-sh           | {pod name} or {namespace} {pod name}       | Exec into the pod with sh.          |
| kt-get-node          | {node name}                                | Describe the node.                  |
| kt-get-node-ready    | None                                       | List all the ready nodes.           |
| kt-get-node-notready | None                                       | List all the not ready nodes.       |
| kt-get-node-all      | None                                       | List all the nodes                  |
| kt-get-pod           | {pod name} or {namespace} {pod name}       | Describe pod.                       |
| kt-get-pod-node      | {pod name} or {namespace} {pod name}       | Get the pod and the node with pod.  |
| kt-get-pod-all       | None                                       | Get all the pods of all namespaces. |
| kt-get-pod-by-ns     | {namespace}                                | Get all the pods in the namespace.  |
| kt-get-pod-by-rs     | {rs name} or {namespace} {rs name}         | Get all the pods of the rs.         |
| kt-get-pod-by-deploy | {deploy name} or {namespace} {deploy name} | Get all the pods of the deploy.     |
| kt-get-pod-by-svc    | {svc name} or {namespace} {svc name}       | Get all the pods of the svc.        |

## azk8spull

`azk8spull` makes use of azk8s.cn mirror to pull image from container registries like `docker.io`, `gcr.io`, `quay.io` in China. `azk8spull` will pull the image from azk8s.cn and then tag to the origin image name. Thanks to Azure China.

For more information, please visit [https://github.com/Azure/container-service-for-azure-china/tree/master/aks#22-container-registry-proxy](https://github.com/Azure/container-service-for-azure-china/tree/master/aks#22-container-registry-proxy).

```
[root@node-64-216 ~]# azk8spull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1
## azk8spull try to pull image from mirror quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1.
0.24.1: Pulling from kubernetes-ingress-controller/nginx-ingress-controller
Digest: sha256:76861d167e4e3db18f2672fd3435396aaa898ddf4d1128375d7c93b91c59f87f
Status: Image is up to date for quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1
## azk8spull try to tag quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1 to quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1.
## azk8spull finish pulling.
[root@node-64-216 ~]# azk8spull k8s.gcr.io/pause-amd64:3.1
## azk8spull try to pull image from mirror gcr.azk8s.cn/google_containers/pause-amd64:3.1.
3.1: Pulling from google_containers/pause-amd64
Digest: sha256:59eec8837a4d942cc19a52b8c09ea75121acc38114a2c68b98983ce9356b8610
Status: Image is up to date for gcr.azk8s.cn/google_containers/pause-amd64:3.1
## azk8spull try to tag gcr.azk8s.cn/google_containers/pause-amd64:3.1 to k8s.gcr.io/pause-amd64:3.1.
## azk8spull finish pulling. 
```

## kube-tools and docker-tools examples

See more [examples](examples.md)
