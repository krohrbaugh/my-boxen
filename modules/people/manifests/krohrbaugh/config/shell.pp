class people::krohrbaugh::config::shell {
  require people::krohrbaugh::config

  include zsh

  # dotfiles
  repository { $people::krohrbaugh::config::dotfiles_dir:
    source => "${::github_login}/dotfiles",
    require => File[$people::krohrbaugh::config::my_dir],
  }

  exec { "install dotfiles":
    provider => shell,
    command  => "./script/install",
    cwd      => $people::krohrbaugh::config::dotfiles_dir,
    creates  => "${people::krohrbaugh::config::home_dir}/.zshrc",
    require  => Repository[$people::krohrbaugh::config::dotfiles_dir],
  }

  # Boxen resource over-rides: stay away from my dotfiles. kthxbai
  File <| title == "${people::krohrbaugh::config::home_dir}/.gemrc" |> {
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