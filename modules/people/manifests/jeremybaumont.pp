class people::jeremybaumont(
  $my_username  = $people::jeremybaumont::params::my_username,
  $my_homedir   = $people::jeremybaumont::params::my_homedir,
  $my_sourcedir = $people::jeremybaumont::params::my_sourcedir,
) inherits people::jeremybaumont::params {
 
  notify { 'class people::jeremybaumont declared': }

  ### Facter, puppet and envpuppet
  repository { "${::boxen_srcdir}/puppet":
    source => 'puppetlabs/puppet',
  }

  repository { "${::boxen_srcdir}/facter":
    source => 'puppetlabs/facter',
  }

  file { '/usr/local/bin/envpuppet':
    ensure  => link,
    mode    => '0755',
    target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
    require => Repository["${::boxen_srcdir}/puppet"],
  }

  # Applications: chrome,...
  include people::jeremybaumont::applications
  # OSX Config: Dock, Finder...
  include people::jeremybaumont::config
}
