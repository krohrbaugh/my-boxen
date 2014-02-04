class people::krohrbaugh::applications::development {

  class { "intellij":
    edition => "ultimate",
    version => "12.1.4",
  }

  class { "kaleidoscope":
    make_default => false,
  }

  include pgadmin3
  include sequel_pro
  include rubymine
  include tower

}