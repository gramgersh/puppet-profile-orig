class profile::base (
  $ntp_servers = [
    '0.centos.pool.ntp.org',
    '1.centos.pool.ntp.org',
    '2.centos.pool.ntp.org',
  ],
) {
  include ::ssh
  class { '::ntp':
    servers => $ntp_servers,
  }
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}

