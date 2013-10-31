class people::krohrbaugh::config::keyboard {
  require people::krohrbaugh::config

  require keyremap4macbook
  require keyremap4macbook::login_item
  require keyremap4macbook::config

  keyremap4macbook::private_xml { "private.xml":
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
      $unless_cmd = "${keyremap4macbook::config::cli} changed | grep ${identifier}=1"
      $onlyif_cmd = undef
    }
    else {
      $action     = "disable"
      $unless_cmd = undef
      $onlyif_cmd = "${keyremap4macbook::config::cli} changed | grep ${identifier}=1"
    }

    $cmd = "${keyremap4macbook::config::cli} ${action} ${identifier}"

    exec { "people::krohrbaugh::config::keyboard::${action}_${identifier}":
      command   => $cmd,
      unless    => $unless_cmd,
      onlyif    => $onlyif_cmd,
      require   => [
        Package["KeyRemap4MacBook_${keyremap4macbook::config::version}"],
        KeyRemap4MacBook::Private_xml["private.xml"],
      ],
    }
  }

}