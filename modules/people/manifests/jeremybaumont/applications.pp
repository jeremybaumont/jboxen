class people::jeremybaumont::applications {
  include chrome

  package { 'tmux': 
    ensure => installed,
  }
}
