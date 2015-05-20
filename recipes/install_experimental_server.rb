gocd_rpm_cache_path = "#{Chef::Config[:file_cache_path]}/gocd-server-#{node[:gocd][:version]}.rpm"
remote_file gocd_rpm_cache_path do
    source "#{node[:gocd][:download_path]}/#{node[:gocd][:version]}/go-agent-#{node[:gocd][:version]}.noarch.rpm"
    action :create
    not_if { ::File.exists?(gocd_rpm_cache_path) }
end

rpm_package "gocd" do
    source gocd_rpm_cache_path
    action :install
end