class people::krohrbaugh {

  $home     = "/Users/${::boxen_user}"
  $my       = "${boxen::config::srcdir}/my"
  $dotfiles = "${my}/dotfiles"

  #
  # Shell
  include zsh

  #
  # Editors
  include textmate::textmate2::beta
  include sublime_text_2
  include sublime_text_2::config

  sublime_text_2::package { "Package Control":
    source => "wbond/sublime_package_control",
  }

  # Install Sublime Text 2 settings
  file { "${sublime_text_2::config::packagedir}/User":
    ensure => link,
    target => "${dotfiles}/sublime2/User",
    require  => [
      Repository[$dotfiles],
      Class["sublime_text_2::config"],
    ],
  }

  #
  # Code directories
  file { $my:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  repository { $dotfiles:
    source => "${::github_login}/dotfiles",
    require => File[$my],
  }

  file { "${my}/boxen":
    ensure => link,
    target => $boxen::config::repodir,
  }

  #
  # Install dotfiles
  exec { "install dotfiles":
    provider => shell,
    command  => "./script/install",
    cwd      => $dotfiles,
    creates  => "${home}/.zshrc",
    require  => Repository[$dotfiles],
  }

  #
  # Boxen over-rides: stay away from my dotfiles. kthxbai
  File <| title == "${home}/.gemrc" |> {
    ensure  => present,
    source  => undef,
  }

  Git::Config::Global <| title == "core.excludesfile" |> {
    value   => undef,
  }

  Git::Config::Global <| title == "credential.helper" |> {
    value   => undef,
  }
}
