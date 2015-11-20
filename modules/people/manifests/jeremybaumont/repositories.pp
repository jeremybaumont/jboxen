class people::jeremybaumont::repositories (
  $my_homedir   = $people::jeremybaumont::params::my_homedir,
  $my_sourcedir = $people::jeremybaumont::params::my_sourcedir,
  $my_username  = $people::jeremybaumont::params::my_username
) {

  # Facter, puppet and envpuppet
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

  # My dotfiles repository
  repository { "${my_sourcedir}/dotfiles":
    source => 'jeremybaumont/dotfiles',
    ensure => 'origin/master',
  }

  file { "${my_homedir}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/dot-tmux.conf",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  repository { "${my_sourcedir}/dot-bashrc.d":
    source => 'jeremybaumont/dot-bashrc.d',
  }
 
  file { "/Users/${my_username}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/dot-bash_profile",
    require => Repository["${my_sourcedir}/dot-bashrc.d"],
  }

  file { "/Users/${my_username}/.bashrc.d":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dot-bashrc.d",
    require => Repository["${my_sourcedir}/dot-bashrc.d"],
  }

  file { "/Users/${my_username}/.bashrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/dot-bashrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

}
