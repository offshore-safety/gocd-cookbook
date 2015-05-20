directory '/usr/lib/jvm'
java_ark "oracle-jre8" do
  url node['java']['jre']['8']['x86_64']['url']
  checksum node['java']['jre']['8']['x86_64']['checksum']
  app_home '/usr/lib/jvm/oracle-jre8'
  action :install
end