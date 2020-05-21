# Templates
* [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

Important directories within this directory include `.yaml` files containing template contexts that are good for understanding how to make specific `.yaml` files for cluster resources. 

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
