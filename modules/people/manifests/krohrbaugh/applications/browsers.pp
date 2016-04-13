class people::krohrbaugh::applications::browsers {
  package { 'google-chrome': provider => 'brewcask' }
  package { 'firefox': provider => 'brewcask' }
  package { 'opera': provider => 'brewcask' }
}