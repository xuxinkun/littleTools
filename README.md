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
