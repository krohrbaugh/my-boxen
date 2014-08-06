class people::krohrbaugh::config::keyboard {
  require people::krohrbaugh::config

  require karabiner
  require karabiner::login_item
  require karabiner::config

  karabiner::private_xml { "private.xml":
    source  => "${people::krohrbaugh::config::dotfiles_dir}/osx/key_remap.xml",
    require => Repository[$people::krohrbaugh::config::dotfiles_dir],
  }

  # The mapping name corresponds to the `item/identifier` tag from the
  # `osx/key_remap.xml` file in dotfiles.
  private_mapping { "media_controls": }
  private_mapping { "volume_controls": }
  private_mapping { "brightness_controls": }

  private_mapping { "power_sleep_button":
    ensure => disabled,
  }

  private_mapping { "mission_control_dashboard":
    ensure => disabled,
  }

  # The unless capability here should probably be submitted to
  # boxen/puppet-keyremap4macbook to prevent the action from being executed on
  # every Boxen run.
  define private_mapping ($setting = $title, $ensure = "enabled") {
    $identifier = "private.${setting}"

    if $ensure == "enabled" {
      $action     = "enable"
      $unless_cmd = "${karabiner::config::cli} changed | grep ${identifier}=1"
      $onlyif_cmd = undef
    }
    else {
      $action     = "disable"
      $unless_cmd = undef
      $onlyif_cmd = "${karabiner::config::cli} changed | grep ${identifier}=1"
    }

    $cmd = "${karabiner::config::cli} ${action} ${identifier}"

    exec { "people::krohrbaugh::config::keyboard::${action}_${identifier}":
      command   => $cmd,
      unless    => $unless_cmd,
      onlyif    => $onlyif_cmd,
      require   => [
        Package["Karabiner_${karabiner::config::version}"],
        Karabiner::Private_xml["private.xml"],
      ],
    }
  }

}