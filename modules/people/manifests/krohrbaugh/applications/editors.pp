class people::krohrbaugh::applications::editors {
  require people::krohrbaugh::config

  include textmate::textmate2::beta

  include sublime_text_2
  include sublime_text_2::config

  sublime_text_2::package { "Package Control":
    source => "wbond/sublime_package_control",
  }

  # Install Sublime Text 2 settings
  file { "${sublime_text_2::config::packagedir}/User":
    ensure => link,
    target => "${people::krohrbaugh::config::dotfiles_dir}/sublime2/User",
    require  => [
      Repository[$people::krohrbaugh::config::dotfiles_dir],
      Class["sublime_text_2::config"],
    ],
  }
}