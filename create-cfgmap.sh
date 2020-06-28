echo 'create configmap in '$(pwd)/$1
for dir in $1/*/; do
	configmap_key=$(echo ${dir} | cut -d'/' -f 4)-configmap
    echo 'delete configmap '$configmap_key
    kubectl delete configmap $configmap_key
	
	echo 'create configmap '$configmap_key
	kubectl create configmap $configmap_key --from-file $dir
done