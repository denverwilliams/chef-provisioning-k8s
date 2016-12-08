files_path = [Chef::Config[:cookbook_path],cookbook_name.to_s,'files'].join('/')

execute 'delete on kubernetes' do
  cwd files_path
  command <<EOF
kubectl delete -f gitlab-ns.yml
# kubectl delete -f gitlab-configmap.yml
# kubectl delete -f ingress/configmap.yml
# kubectl delete -f ingress/nginx-settings-configmap.yml
# kubectl delete -f gitlab-svc.yml
# kubectl delete -f gitlab-deployment.yml
# kubectl delete -f ingress/default-backend-svc.yml
# kubectl delete -f ingress/default-backend-deployment.yml
# kubectl delete -f ingress/nginx-ingress-lb.yml
# kubectl delete -f ingress/gitlab-ingress.yml
EOF
end
