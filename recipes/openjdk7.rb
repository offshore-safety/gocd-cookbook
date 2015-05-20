if platform_family?('rhel')
  yum_package 'java-1.7.0-openjdk'
elsif platform_family?('debian')
  apt_package 'openjdk-7-jdk'
end