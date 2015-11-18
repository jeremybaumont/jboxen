class people::jeremybaumont::config(
  $my_homedir   = $people::jeremybaumont::params::my_homedir,
  $my_sourcedir = $people::jeremybaumont::params::my_sourcedir,
  $my_username  = $people::jeremybaumont::params::my_username
) {

  # Disable Gatekeeper so you can install any package you want
  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }

 # Dock 
 include osx::dock::autohide

  class { 'osx::dock::position':
    position => 'left',
  }

 exec { 'Restart the Dock':
    command     => '/usr/bin/killall -HUP Dock',
    refreshonly => true,
  }

 file { 'Dock Plist':
    ensure  => file,
    owner   => $::my_username,
    path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
    mode    => '0600',
    notify     => Exec['Restart the Dock'],
  }
  
}
