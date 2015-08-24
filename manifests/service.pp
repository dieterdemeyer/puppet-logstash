<<<<<<< HEAD
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
=======
# == Class: logstash::service
#
# This class exists to coordinate all service management related actions,
# functionality and logical units in a central place.
#
# <b>Note:</b> "service" is the Puppet term and type for background processes
# in general and is used in a platform-independent way. E.g. "service" means
# "daemon" in relation to Unix-like systems.
#
#
# === Parameters
#
# This class does not provide any parameters.
#
#
# === Examples
#
# This class may be imported by other classes to use its functionality:
#   class { 'logstash::service': }
#
# It is not intended to be used directly by external resources like node
# definitions or other modules.
#
#
# === Authors
#
# * Richard Pijnenburg <mailto:richard.pijnenburg@elasticsearch.com>
#
class logstash::service {

  case $logstash::service_provider {

    init: {
      logstash::service::init { $logstash::params::service_name: }
    }

    default: {
      fail("Unknown service provider ${logstash::service_provider}")
    }

>>>>>>> abd591ded39bb820b0d5bbc79e7ceac875dab2cb
  }

}
