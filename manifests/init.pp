# Class: logstash
#
# This module manages logstash
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class logstash(
  $version = 'present',
  $enable = true,
  $service_state = 'running',
) {

  case $version {
    'present', 'latest': { $version_real = $version }
    default:             { fail('Class[logstash]: parameter version must be present or latest') }
  }

  case $enable {
    true, false: { $enable_real = $enable }
    default:     { fail('Class[logstash]: parameter enable must be a boolean') }
  }

  case $service_state {
    'running', 'stopped': { $service_state_real = $service_state }
    default:     { fail('Class[logstash]: parameter service_state must be running or stopped') }
  }

  case $::osfamily {
    'RedHat': {
      class { 'logstash::package':
        version => $version_real
      }
      class { 'logstash::config': }
      class { 'logstash::service':
        ensure => $service_state_real,
        enable => $enable_real
      }

      Class['logstash::package'] -> Class['logstash::config']
      Class['logstash::config'] ~> Class['logstash::service']
      Class['logstash::service'] -> Class['logstash']
    }
    default: {
      fail("Class['logstash']: osfamily ${::osfamily} is not supported")
    }
  }

}
