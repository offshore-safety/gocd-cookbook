if platform_family?('rhel')
  yum_package 'java-1.8.0-openjdk.x86_64'
elsif platform_family?('debian')
  apt_package 'openjdk-8-jdk'
end