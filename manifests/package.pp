class logstash::package($version = 'present') {

  case $version {
    'present', 'latest': { $version_real = $version }
    default:             { fail('Class[logstash::package]: parameter version must be present or latest') }
  }

  package { 'logstash' :
    ensure => $version_real
  }

}
