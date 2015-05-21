gocd_rpm_cache_path = "#{Chef::Config[:file_cache_path]}/gocd-agent-#{node[:gocd][:version]}.rpm"
source_path = "#{node[:gocd][:download_path]}/#{node[:gocd][:version]}/go-agent-#{node[:gocd][:version]}.noarch.rpm"
Chef::Log.debug("Downloading to '#{gocd_rpm_cache_path}'")
Chef::Log.debug("Downloading from '#{source_path}'")

remote_file gocd_rpm_cache_path do
    source source_path
    action :create
    not_if { ::File.exists?(gocd_rpm_cache_path) }
end

rpm_package "gocd-agent" do
    source gocd_rpm_cache_path
    action :install
end