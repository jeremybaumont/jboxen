class people::jeremybaumont::applications {
  include chrome
  include iterm2::stable
  include brewcask

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

}
