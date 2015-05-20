directory '/usr/lib/jvm'
java_ark "oracle-jdk7" do
  url node['java']['jdk']['7']['x86_64']['url']
  checksum node['java']['jdk']['7']['x86_64']['checksum']
  app_home '/usr/lib/jvm/oracle-jdk7'
end