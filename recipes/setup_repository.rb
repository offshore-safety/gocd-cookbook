if platform_family?('rhel')
  yum_repository 'gocd' do
    description 'GoCD YUM Repository'
    url         'http://dl.bintray.com/gocd/gocd-rpm'
    action      :add
    enabled     true
    gpgcheck    false
  end
elsif platform_family?('debian')
  apt_repository 'gocd' do
    uri        'https://download.go.cd/'
    components ['/']
    action     :add
    trusted    true
  end
end