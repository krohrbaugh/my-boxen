class people::krohrbaugh::applications::development {
  package { 'java': provider => 'brewcask' }
  package { 'kaleidoscope': provider => 'brewcask' }
  package { 'pgadmin3': provider => 'brewcask' }
  package { 'sequel-pro': provider => 'brewcask' }
  package { 'tower': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  package { 'xhyve': }
  package { 'docker': provider => 'brewcask' }
}