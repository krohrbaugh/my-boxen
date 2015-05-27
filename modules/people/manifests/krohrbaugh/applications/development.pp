class people::krohrbaugh::applications::development {

  include docker

  class { "intellij":
    edition => "ultimate",
    version => "13.1.1",
  }

  class { "kaleidoscope":
    make_default => false,
  }

  include pgadmin3
  include sequel_pro
  include rubymine
  include tower
  include virtualbox
}