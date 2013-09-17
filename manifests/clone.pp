class git::clone ($repo, $path, $username='www-data'){

  package { 'git':
    ensure => installed,
  }

  vcsrepo { "${path}/${repo}":
    ensure   => latest,
    owner    => $username,
    group    => $username,
    provider => git,
    require  => [ Package['git'] ],
    source   => "https://bitbucket.org/mrmyers/${repo}.git",
    revision => 'master',
  }
} 
