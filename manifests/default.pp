hiera_include('classes')

package { 'git':
  ensure => present,
}

package { 'jenkins':
  ensure  => present,
  require => Apt::Source['jenkins'],
}
->
service { 'jenkins':
  ensure => running,
}
