class logstash::service(
  $ensure = undef,
  $enable = undef
) {

  case $ensure {
    'running', 'stopped': { $ensure_real = $ensure }
    default:              { fail('Class[logstash::service]: parameter ensure must be running or stopped') }
  }

  case $enable {
    true, false: { $enable_real = $enable }
    default:     { fail('Class[logstash::service]: parameter enable must be a boolean') }
  }

  service { 'logstash':
    ensure => $ensure_real,
    enable => $enable_real
  }

}
