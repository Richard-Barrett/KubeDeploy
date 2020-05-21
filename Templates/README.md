# Templates
* [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

Important directories within this directory include `.yaml` files containing template contexts that are good for understanding how to make specific `.yaml` files for cluster resources. 
* [Applications](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Applications)
* [Daemonsets](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Daemonsets)
* [Networking](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Networking)
* [NodeAffinity](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/NodeAffinity)
* [Pods](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Pods)
* [Replicasets](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Replicasets)
* [Schedulers](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Schedulers)
* [Services](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/Services)
* [TaintsTolerations](https://github.com/Richard-Barrett/KubeDeploy/tree/master/Templates/TaintsTolerations)

Each directory contains infromation to making specific cluster resources as well as `kubernetes.io` specific related pages for those wanting to take the CKA & CKAD Exams. 

## How to Enable Auto Completion
* Bash
```
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
```

Shorthand Alias suggestion for `kubectl` commands:
```
alias k=kubectl
complete -F __start_kubectl k
```

* ZSH
```
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell
```
