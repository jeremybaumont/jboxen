class people::jeremybaumont(
  $my_username  = $people::jeremybaumont::params::my_username,
  $my_homedir   = $people::jeremybaumont::params::my_homedir,
  $my_sourcedir = $people::jeremybaumont::params::my_sourcedir,
) inherits people::jeremybaumont::params {
 
  notify { 'class people::jeremybaumont declared': }

  # Applications: chrome,...
  include people::jeremybaumont::applications

  # OSX Config: Dock, Finder...
  include people::jeremybaumont::config

  # All kind of repositories, for example dotfiles are managed by repositories
  include people::jeremybaumont::repositories
}
