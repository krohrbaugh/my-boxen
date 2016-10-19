require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

file { '/usr/local/bin':
  ensure    => 'directory',
  owner     => $boxen_user,
  group     => 'staff',
  mode      => '0755'
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include brewcask
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  class { 'nodejs::global':
    version => '4.6'
  }
  nodejs::version { '6.8.0': }

  # default ruby versions
  ruby::version { '2.3.1': }

  # Install Bundler for all Ruby versions
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  # python
  python::version { '2.7.12': }
  python::version { '3.5.2': }

  class { 'python::global':
    version => '2.7.12'
  }

  python::package { "virtualenv for 2.7":
    package => 'virtualenv',
    python => '2.7.12'
  }

  # java
  include java
  package { 'jenv': }

  # go
  include go

  # Delete wfarr/chgo if it exists, since repository type does not distinguish
  # when remote changes: https://github.com/boxen/puppet-go/pull/11
  exec { "delete-wfarr-chgo":
      provider => shell,
      command  => "rm -rf ${boxen::config::home}/chgo",
      onlyif   => "[[ -s ${boxen::config::home}/chgo ]] && cd ${boxen::config::home}/chgo && git remote -v | grep wfarr",
      before   => Repository[$go::chgo_root],
  }

  go::version { '1.7.1': }

  # common, useful packages
  package {
    [
      'ack',
      'cloc',
      'findutils',
      'gnu-tar',
      'the_silver_searcher',
      'tree'
    ]:
  }
}
