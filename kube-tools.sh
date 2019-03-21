#!/usr/bin/env bash
function kt-exec()
{
	if [[ $# == 2 ]]
	then
		kubectl exec -it -n $1 $2 bash
	else
		kubectl exec -it $1 bash
	fi
}
function kt-exec-sh()
{
	if [[ $# == 2 ]]
	then
		kubectl exec -it -n $1 $2 sh
	else
		kubectl exec -it $1 sh
	fi
}
function kt-get-node()
{
	kubectl describe node $1
}
function kt-get-node-ready()
{
	kubectl get node -o wide|grep -v NotReady|grep -v NAME
}
function kt-get-node-notready()
{
	kubectl get node -o wide|grep NotReady
}
function kt-get-node-all()
{
	kubectl get node -o wide
}
function kt-get-pod()
{
	if [[ $# == 2 ]]
	then
		kubectl describe pod -n $1 $2
	else
		kubectl describe pod $1
	fi
}
function kt-get-pod-node()
{
	if [[ $# == 2 ]]
	then
		kubectl get pod -n $1 $2 -o wide
		node_name=`kubectl get pod -n $1 $2 -o go-template --template="{{.spec.nodeName}}"`
	else
		kubectl get pod $1
		node_name=`kubectl get pod $1 -o go-template --template="{{.spec.nodeName}}"`
	fi
	kubectl get node $node_name -o wide
}
function kt-get-pod-all()
{
	kubectl get pod --all-namespaces -o wide
}
function kt-get-pod-by-ns()
{
	kubectl get pod -n $1 -o wide
}
function kt-get-pod-by-rs()
{
	if [[ $# == 2 ]]
	then
		labels=`kubectl get rs -n $1 -o go-template --template="{{ range \\$key, \\$value := .spec.selector.matchLabels}},{{\\$key}}={{\\$value}}{{end}}" $2`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide -n $1
	else
		labels=`kubectl get rs -o go-template --template="{{ range \\$key, \\$value := .spec.selector.matchLabels}},{{\\$key}}={{\\$value}}{{end}}" $1`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide
	fi

}
function kt-get-pod-by-svc()
{
	if [[ $# == 2 ]]
	then
		labels=`kubectl get svc -n $1 -o go-template --template="{{ range \\$key, \\$value := .spec.selector}},{{\\$key}}={{\\$value}}{{end}}" $2`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide -n $1
	else
		labels=`kubectl get svc -o go-template --template="{{ range \\$key, \\$value := .spec.selector}},{{\\$key}}={{\\$value}}{{end}}" $1`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide
	fi
}
function kt-get-pod-by-deploy()
{
	if [[ $# == 2 ]]
	then
		labels=`kubectl get deployment -n $1 -o go-template --template="{{ range \\$key, \\$value := .spec.selector.matchLabels}},{{\\$key}}={{\\$value}}{{end}}" $2`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide -n $1
	else
		labels=`kubectl get deployment -o go-template --template="{{ range \\$key, \\$value := .spec.selector.matchLabels}},{{\\$key}}={{\\$value}}{{end}}" $1`
		labels=`echo ${labels/,/}`
		kubectl get pod -l $labels -o wide
	fi
}