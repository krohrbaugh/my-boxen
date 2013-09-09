class people::krohrbaugh::config::system {
  require people::krohrbaugh::config

  # Set OSX defaults using a shell script in dotfiles. The puppet-osx module
  # doesn't have near as many settings and transcribing them all over would take
  # a _long_ time.
  #
  # NOTE: This uses a plist-backed receipt to prevent the resource from
  # executing with every Boxen run. In order to re-run it on a machine:
  #
  #   defaults delete us.rohrbaugh.boxen OSXDefaults
  #
  # There's probably a better way to do this . . .
  $unless_cmd = "/usr/bin/defaults read us.rohrbaugh.boxen OSXDefaults | grep 1"
  exec { "set OSX defaults":
    provider  => shell,
    command   => "./osx/set-defaults.sh",
    cwd       => $people::krohrbaugh::config::dotfiles_dir,
    unless    => $unless_cmd,
    user      => $::boxen_user,
    require   => Repository[$people::krohrbaugh::config::dotfiles_dir],
  }
  ->
  exec { "write osx-defaults receipt":
    provider  => shell,
    command   => "defaults write us.rohrbaugh.boxen OSXDefaults -bool true",
    cwd       => $people::krohrbaugh::config::home_dir,
    user      => $::boxen_user,
    unless    => $unless_cmd,
  }

  # Boxen resource over-ride: leave my settings alone, please.
  Boxen::Osx_defaults <| domain == "com.apple.screensaver" and key == "askForPasswordDelay" |> {
    value  => 1,
  }
}