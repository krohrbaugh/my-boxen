class people::krohrbaugh::config {
  $home_dir = "/Users/${::boxen_user}"
  $my_dir = "${boxen::config::srcdir}/my"
  $dotfiles_dir = "${my_dir}/dotfiles"

  $fonts_dir = "${home_dir}/Library/Fonts"
  $preferences_dir = "${home_dir}/Library/Preferences"

  file { $my_dir:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  # boxen
  file { "${my_dir}/boxen":
    ensure  => link,
    target  => $boxen::config::repodir,
    require => File[$my_dir],
  }

  include people::krohrbaugh::config::system
  include people::krohrbaugh::config::keyboard
  include people::krohrbaugh::config::shell
}