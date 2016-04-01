# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "1.13.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.6.0"
github "nodejs",      "5.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.4"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",               "1.4.0"
github "alfred",              "1.5.0"
github "appcleaner",          "1.0.0"
github "chrome",              "1.2.0"
github "crashplan",           "1.0.1"
github "docker",              "1.0.0"
github "dropbox",             "1.4.1"
github "firefox",             "1.2.3"
github "hipchat",             "1.1.3"
github "intellij",            "1.5.1"
github "istatmenus4",         "1.1.0"
github "iterm2",              "1.2.5"
github "kaleidoscope",        "1.0.5", :repo => "ngs/puppet-kaleidoscope"
github "karabiner",           "1.0.8"
github "keyremap4macbook",    "1.2.2"
github "notational_velocity", "1.1.2"
github "onepassword",         "1.1.5"
github "opera",               "0.3.3"
github "osx",                 "2.8.0"
github "pgadmin3",            "1.0.0"
github "python",              "3.0.2", :repo => "mloberg/puppet-python"
github "rubymine",            "1.1.0"
github "skype",               "1.1.0"
github "sequel_pro",          "1.0.1"
github "spectacle",           "1.0.0"
github "spotify",             "1.0.2"
github "sublime_text",        "1.1.0"
github "teamviewer",          "1.0.1"
github "textmate",            "1.1.0"
github "tower",               "1.1.0"
github "transmit",            "1.0.2"
github "virtualbox",          "1.0.13"
github "vlc",                 "1.1.0"
github "zsh",                 "1.0.0"
