include_recipe "provision::power_on"
include_recipe "provision::node_setup"
include_recipe "provision::node_state"
include_recipe "provision::certs"
include_recipe "provision::ssh_key"
include_recipe "provision::master_cloud_config"
include_recipe "provision::worker_cloud_config"
include_recipe "provision::hanlon"
include_recipe "provision::via_ssh"
include_recipe "provision::kubectl"
ruby_block 'install gitlab on kubernetes' do
  block do
    require 'pry-byebug'
  end

end

files_path = [Chef::Config[:cookbook_path],cookbook_name.to_s,'files'].join('/')

execute 'install gitlab on kubernetes' do
  cwd files_path
  command <<EOF
kubectl create -f gitlab-ns.yml
kubectl create -f gitlab-configmap.yml
kubectl create -f ingress/configmap.yml
kubectl create -f ingress/nginx-settings-configmap.yml
kubectl create -f gitlab-svc.yml
kubectl create -f gitlab-deployment.yml
kubectl create -f ingress/default-backend-svc.yml
kubectl create -f ingress/default-backend-deployment.yml
kubectl create -f ingress/nginx-ingress-lb.yml
kubectl create -f ingress/gitlab-ingress.yml
EOF
end
