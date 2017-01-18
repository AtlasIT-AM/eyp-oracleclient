define oracleclient::connectstring(
                                    $host,
                                    $dbname,
                                    $csname                    = $name,
                                    $csalias                   = undef,
                                    $port                      = '1521',
                                    $shared                    = false,
                                    $loadbalance               = 'off',
                                    $failover                  = 'on',
                                    $connect_timeout           = '5',
                                    $transport_connect_timeout = '3',
                                    $retry_count               = '3',
                                    $instance_name             = undef,
                                    $comment                   = undef,
                                  ) {

  # example
  #
  # HYBRIS =
  # (DESCRIPTION =
  #   (ADDRESS = (PROTOCOL = TCP)(HOST = accvhdt.l0l.systemadmin.es)(PORT = 1521))
  #   (CONNECT_DATA =
  #     (SERVER = DEDICATED)
  #     (SERVICE_NAME = HYBRIS)
  #   )
  # )

  # PROD1=
  # (DESCRIPTION=
  #   (ADDRESS=(PROTOCOL=tcp)(HOST=systemadmindb01-vip.systemadmin.es)(PORT=1521))
  #   (CONNECT_DATA=
  #       (SERVICE_NAME=PROD)
  #       (INSTANCE_NAME=PROD1)
  #   )
  # )

  if($csalias)
  {
    validate_array($csalias)
  }

  #TODO: agfegir banner amb puppet managed file

  concat::fragment{ "tnsnames ${csname}":
    target  => "${oracleclient::oraclehome}/network/admin/tnsnames.ora",
    order   => '00',
    content => template("${module_name}/tnsnames.erb"),
  }
}
