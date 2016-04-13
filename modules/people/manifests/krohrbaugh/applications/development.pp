class people::krohrbaugh::applications::development {
  package { 'kaleidoscope': provider => 'brewcask' }
  package { 'pgadmin3': provider => 'brewcask' }
  package { 'sequel-pro': provider => 'brewcask' }
  package { 'tower': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  package { 'docker': provider => 'brewcask' }
}