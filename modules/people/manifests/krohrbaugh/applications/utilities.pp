class people::krohrbaugh::applications::utilities {
  package { 'alfred': provider => 'brewcask' }
  package { 'appcleaner': provider => 'brewcask' }
  package { 'crashplan': provider => 'brewcask' }
  package { '1password': provider => 'brewcask' }
  package { 'spectacle': provider => 'brewcask' }
  package { 'transmit': provider => 'brewcask' }
}