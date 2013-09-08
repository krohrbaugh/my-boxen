class people::krohrbaugh::config::system {
  require people::krohrbaugh::config

  # NOTE: The following `exec` command depends on the `set-defaults.sh` script
  # setting a key used only to signal to Puppet that defaults were executed on
  # the host. It'd be better to set these defaults here, but the puppet-osx
  # module doesn't have near as many settings as the script and transcribing
  # them all over would take a _long_ time.
  #
  # In order for this to run again via Boxen, it's necessary to delete the 
  # `us.rohrbaugh.osx-defaults/enabled` key from `defaults`:
  #
  #   defaults delete us.rohrbaugh.osx-defaults enabled
  # 
  # It's brittle, but it works.
  exec { "set OSX defaults":
    provider  => shell,
    command   => "./osx/set-defaults.sh",
    cwd       => $people::krohrbaugh::config::dotfiles_dir,
    unless    => "/usr/bin/defaults read us.rohrbaugh.osx-defaults enabled | grep 1",
    user      => $::boxen_user,
    require   => Repository[$people::krohrbaugh::config::dotfiles_dir],
  }

  # Boxen resource over-ride: leave my settings alone, please.
  Boxen::Osx_defaults <| domain == "com.apple.screensaver" and key == "askForPasswordDelay" |> {
    value  => 1,
  }
}