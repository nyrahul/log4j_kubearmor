#!/usr/bin/env bash

annotate()
{
	ns_ignore_list=("kube-system" "explorer" "cilium" "kubearmor")
	while read line; do
		depnm=${line/ */}
		depns=${line/* /}
		[[ " ${ns_ignore_list[*]} " =~ " ${depns} " ]] && continue
		echo "Applying KubeArmor visibility annotation for namespace=[$depns], $1=[$depnm]"
		kubectl annotate $1 -n $depns $depnm "kubearmor-visibility"="process,file,network" --overwrite
	done < <(kubectl get $1 -A -o=custom-columns=':metadata.name,:metadata.namespace' --no-headers)
}

applyKubearmorVisibility()
{
	annotate deployments.apps
	annotate pod
}

applyKubearmorVisibility
