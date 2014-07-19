exec { 'add_key':
  command => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -',
}
->
file { '/etc/apt/sources.list.d/jenkins-ci.list':
  content => 'deb http://pkg.jenkins-ci.org/debian binary/',
  notify  => Exec['apt_update']
}
->
exec { 'apt_update':
  command     => '/usr/bin/apt-get update',
  refreshonly => true,
}
->
package { 'jenkins':
  ensure => '1.572',
}
->
package { 'git': }

