class people::krohrbaugh::config::golang {
  # GOPATH setup
  $go_dir = "${boxen::config::srcdir}/go"

  file { $go_dir:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  # 3rd party root
  $go_3rdparty = "${go_dir}/3rdparty"
  $go_3rdparty_bin = "${go_3rdparty}/bin"
  $go_3rdparty_pkg = "${go_3rdparty}/pkg"
  $go_3rdparty_src = "${go_3rdparty}/src"

  file { $go_3rdparty:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  file { $go_3rdparty_bin:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  file { $go_3rdparty_pkg:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  file { $go_3rdparty_src:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  # Go root
  $go_bin = "${go_dir}/bin"
  $go_pkg = "${go_dir}/pkg"
  $go_src = "${go_dir}/src"

  file { $go_bin:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  file { $go_pkg:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  file { $go_src:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }
}