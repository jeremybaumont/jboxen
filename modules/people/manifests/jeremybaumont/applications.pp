class people::jeremybaumont::applications {
  include chrome

  package { 'tmux': 
    ensure => installed,
  }

  package { 'tree': 
    ensure => installed,
  }

  package { 'wget': 
    ensure => installed,
  }
}
