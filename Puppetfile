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
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

<<<<<<< HEAD
github "boxen", "3.4.2"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"
=======
github "boxen",               "3.3.5"
>>>>>>> Update dependencies and Puppet modules

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

<<<<<<< HEAD
github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.3.1"
github "go",          "1.1.0"
github "homebrew",    "1.9.2"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.7.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.3.0"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"
=======
github "autoconf",            "1.0.0"
github "dnsmasq",             "1.0.1"
github "gcc",                 "2.0.99"
github "git",                 "1.3.7"
github "homebrew",            "1.6.0"
github "hub",                 "1.2.0"
github "inifile",             "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "java",                "1.1.2"
github "nginx",               "1.4.3"
github "nodejs",              "3.5.0"
github "openssl",             "1.0.0"
github "repository",          "2.2.0"
github "ruby",                "6.7.6"
github "stdlib",              "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",                "1.0.0"
github "xquartz",             "1.1.1"
>>>>>>> Update dependencies and Puppet modules

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",               "1.2.0"
github "alfred",              "1.1.7"
github "appcleaner",          "1.0.0"
github "chrome",              "1.1.2"
github "crashplan",           "1.0.1"
github "dropbox",             "1.2.0"
github "firefox",             "1.1.5"
github "intellij",            "1.4.0"
github "istatmenus4",         "1.1.0"
github "iterm2",              "1.0.6"
github "kaleidoscope",        "1.0.4", :repo => "ngs/puppet-kaleidoscope"
github "keyremap4macbook",    "1.2.1"
github "notational_velocity", "1.1.1"
github "onepassword",         "1.1.0"
github "opera",               "0.3.1"
github "osx",                 "2.2.0"
github "pgadmin3",            "1.0.0"
github "rdio",                "1.0.0"
github "rubymine",            "1.1.0"
github "skype",               "1.0.7"
github "spectacle",           "1.0.0"
github "sublime_text_2",      "1.1.2"
github "teamviewer",          "1.0.1"
github "textmate",            "1.1.0"
github "tower",               "1.0.0"
github "zsh",                 "1.0.0"
