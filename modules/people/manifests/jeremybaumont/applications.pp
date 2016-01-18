class people::jeremybaumont::applications {
  include chrome
  include iterm2::stable
  include brewcask

  class { 'virtualbox':
    version => '5.0.12',
    patch_level => '104815'
  }
  
  class { 'vagrant':
    version => '1.8.1',
  }

  package { 'tmux': 
    ensure => installed,
  }

  package { 'tree': 
    ensure => installed,
  }

  package { 'wget': 
    ensure => installed,
  }

  package { 'jenv': 
    ensure => installed,
  }

  package { 'java':
    provider => 'brewcask',
  }

  package { 'java7':
    provider => 'brewcask',
  }

  package { 'mvnvm': 
    ensure => installed,
  }

  package { 'nvm': 
    ensure => installed,
  }
  
  package { 'scala':
    ensure => installed,
  }

  package { 'sbt':
    ensure => installed,
  }

}
