class people::jeremybaumont::applications {
  include chrome
  include java
  include iterm2::stable

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
