class people::jeremybaumont::repositories (
  $my_homedir   = $people::jeremybaumont::params::my_homedir,
  $my_sourcedir = $people::jeremybaumont::params::my_sourcedir,
  $my_username  = $people::jeremybaumont::params::my_username
) {

  # Git config and repositories #

  git::config::global { 'user.name':
    value => 'Jeremy Baumont',
  }

  git::config::global { 'core.editor':
    value => 'vim',
  }

  git::config::global { 'core.whitespace':
    value => 'fix,-indent-with-non-tab,trailing-space,cr-at-eol',
  }
 
  git::config::global { 'fetch.recurseSubmodules':
    value => 'yes',
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'jeremy.baumont@gmail.com',
  }

  git::config::global{ 'color.ui':
    value => 'auto',
  }

  git::config::global { 'alias.ll':
    value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat',
  }

  git::config::global { 'alias.show-graph':
    value => 'log --graph --abbrev-commit --pretty=oneline',
  }

  git::config::global { 'alias.ls':
    value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate',
  }

  git::config::global { 'alias.lnc':
    value => 'log --pretty=format:"%h\\ %s\\ [%cn]"',
  }

  git::config::global { 'alias.lds':
    value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short',
  }

  git::config::global { 'alias.ld':
    value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative',
  }

  git::config::global { 'alias.dl':
    value => '"!git ll -1"',
  }

  git::config::global { 'alias.dr':
    value => '"!f() { git diff "$1"^.."$1"; }; f"',
  }

  git::config::global { 'alias.lcr':
    value => '"!f() { git ll "$1"^.."$1"; }; f"',
  }

  git::config::global { 'alias.diffr':
    value => '"!f() { git diff "$1"^.."$1"; }; f"',
  }

  git::config::global { 'alias.f':
    value => '"!git ls-files | grep -i"',
  }

  git::config::global { 'alias.la':
    value => '"!git config -l | grep alias | cut -c 7-"',
  }

  git::config::global { 'alias.cp':
    value => 'cherry-pick',
  }

  git::config::global { 'alias.st':
    value => 'status -s',
  }

  git::config::global { 'alias.co':
    value => 'checkout',
  }

  git::config::global { 'alias.br':
    value => 'branch',
  }

  git::config::global { 'alias.cl':
    value => 'clone',
  }

  git::config::global { 'alias.ci':
    value => 'commit',
  }

  git::config::global { 'alias.diff':
    value => 'diff --word-diff',
  }

  git::config::global { 'alias.dc':
    value => 'diff --cached',
  }


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
 
  # My personal scripts under $HOME/bin
  repository { "${my_sourcedir}/bin":
    source => 'jeremybaumont/bin',
    ensure => 'origin/master',
  }

  file { "${my_homedir}/bin":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/bin",
    require => Repository["${my_sourcedir}/bin"],
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

  file { "${my_homedir}/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/dot-vimrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  repository { "${my_sourcedir}/dot-vim":
    source => 'jeremybaumont/dot-vim',
    ensure => 'origin/master',
  }

  file { "/Users/${my_username}/.vim":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dot-vim",
    require => Repository["${my_sourcedir}/dot-vim"],
  }

  repository { "${my_sourcedir}/dot-bashrc.d":
    source => 'jeremybaumont/dot-bashrc.d',
    ensure => 'origin/master',
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
  
  file { "${my_sourcedir}/dot-bashrc-work.d":
    ensure => directory,
  }

  file { "/Users/${my_username}/.bashrc-work.d":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dot-bashrc-work.d",
    require => File["${my_sourcedir}/dot-bashrc-work.d"],
  }

  file { "/Users/${my_username}/.bashrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_sourcedir}/dotfiles/dot-bashrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

# bin directory structures for work
  file { "${my_username}/bin-work":
    ensure => directory,
  }

# git completion
  repository { "${my_sourcedir}/git":
    source => 'git/git',
    ensure => 'origin/master',
  }

  file { "/Users/${my_username}/.git-completion.bash":
    ensure => link,
    mode   => '0644',
    target  => "${my_sourcedir}/git/contrib/completion/git-completion.bash",
    require => Repository["${my_sourcedir}/git"],
  }
   
}

