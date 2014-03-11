# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",               "3.3.8"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",            "1.0.0"
github "dnsmasq",             "1.0.1"
github "gcc",                 "2.0.99"
github "git",                 "2.0.0"
github "homebrew",            "1.6.0"
github "hub",                 "1.3.0"
github "inifile",             "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "java",                "1.2.0"
github "nginx",               "1.4.3"
github "nodejs",              "3.6.0"
github "openssl",             "1.0.0"
github "python",              "1.3.0"
github "repository",          "2.3.0"
github "ruby",                "7.2.3"
github "stdlib",              "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",                "1.0.0"
github "xquartz",             "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",               "1.3.0"
github "alfred",              "1.1.7"
github "appcleaner",          "1.0.0"
github "chrome",              "1.1.2"
github "crashplan",           "1.0.1"
github "dropbox",             "1.2.0"
github "firefox",             "1.1.8"
github "intellij",            "1.4.0"
github "istatmenus4",         "1.1.0"
github "iterm2",              "1.0.7"
github "kaleidoscope",        "1.0.4", :repo => "ngs/puppet-kaleidoscope"
github "keyremap4macbook",    "1.2.2"
github "notational_velocity", "1.1.1"
github "onepassword",         "1.1.0"
github "opera",               "0.3.2"
github "osx",                 "2.2.2"
github "pgadmin3",            "1.0.0"
github "rdio",                "1.0.0"
github "rubymine",            "1.1.0"
github "skype",               "1.0.8"
github "sequel_pro",          "1.0.1"
github "spectacle",           "1.0.0"
github "sublime_text_2",      "1.1.2"
github "teamviewer",          "1.0.1"
github "textmate",            "1.1.0"
github "tower",               "1.0.0"
github "transmit",            "1.0.2"
github "zsh",                 "1.0.0"
