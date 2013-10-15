class git::clone ($repo, $path, $host='bitbucket.org',$owner='www-data', $username="", $password=""){

  package { 'git':
    ensure => installed,
  }

  vcsrepo { "${path}/${repo}":
    ensure   => latest,
    owner    => $owner,
    group    => $owner,
    provider => git,
    require  => [ Package['git'] ],
    source   => "https://${host}/mrmyers/${repo}.git",
    revision => 'master',
  }
} 
