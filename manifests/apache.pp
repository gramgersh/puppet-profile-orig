class profile::apache (
  Boolean $default_vhost = false,
  Integer $port          = 80,
  String $docroot        = "/var/www/${facts['fqdn']}",
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost { $facts['fqdn']:
    port    => $port,
    docroot => $docroot,
    before  => File["${docroot}/index.html"],
  }

  file { "${docroot}/index.html":
    ensure  => file,
    content => '<html><body><h1>This is a test</h1>initial content of file.</body></html>',
    mode    => '0644',
  }
}
