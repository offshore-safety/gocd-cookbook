directory '/usr/lib/jvm'

java_home = '/usr/lib/jvm/oracle-jdk8'

java_ark 'oracle-jdk8' do
  url node['java']['jdk']['8']['x86_64']['url']
  checksum node['java']['jdk']['8']['x86_64']['checksum']
  app_home java_home
  bin_cmds ['java', 'javac', 'keytool']
  default true
  action :install
end

ruby_block "Set JAVA_HOME to #{java_home}" do
  block do
    ENV["JAVA_HOME"] = java_home
  end
end

directory "/etc/profile.d" do
  mode 00755
end

file "/etc/profile.d/jdk.sh" do
  content "export JAVA_HOME=#{java_home}"
  mode 00755
end
