class people::krohrbaugh::applications::development {

  class { "intellij":
    edition => "ultimate",
    version => "12.1.4",
  }

  class { "kaleidoscope":
    make_default => false,
  }

  include rubymine
  include tower

}