kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | 
sls admin-user | 
ForEach-Object { $_ -Split '\s+' } | 
Select -First 1)
