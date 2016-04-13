class people::krohrbaugh::applications::communication {
  package { 'dropbox': provider => 'brewcask' }
  package { 'hipchat': provider => 'brewcask' }
  package { 'skype': provider => 'brewcask' }
  package { 'teamviewer': provider => 'brewcask' }
}