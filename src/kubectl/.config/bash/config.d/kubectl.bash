

#function mkubectl {
#	/usr/bin/kubectl --kubeconfig <(pass show "kube/config") "$@"
#}; export -f mkubectl
#
#source /etc/bash_completion.d/kubectl
#
#complete -o default -F __start_kubectl mkubectl

