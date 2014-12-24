class people::krohrbaugh::applications::editors {
  require people::krohrbaugh::config

  include textmate::textmate2::beta

  include sublime_text
  sublime_text::package { 'Theme - Cobalt2':
    source => "wesbos/cobalt2"
  }

  # Install Sublime Text 3 settings (from dotfiles)
  require sublime_text::config
  file { "${sublime_text::config::packagedir}/User":
    ensure => link,
    target => "${people::krohrbaugh::config::dotfiles_dir}/sublime3/User",
    require => [
      Repository[$people::krohrbaugh::config::dotfiles_dir],
      Class["sublime_text::config"],
    ],
  }

  include sublime_text::v2
  sublime_text::v2::package { 'Package Control':
    source => "wbond/sublime_package_control",
  }

  # Install Sublime Text 2 settings (from dotfiles)
  require sublime_text::v2::config
  file { "${sublime_text::v2::config::packagedir}/User":
    ensure => link,
    target => "${people::krohrbaugh::config::dotfiles_dir}/sublime2/User",
    require => [
      Repository[$people::krohrbaugh::config::dotfiles_dir],
      Class["sublime_text::v2::config"],
    ],
  }
}