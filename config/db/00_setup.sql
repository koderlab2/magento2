# Required to get rid of error during db import, for example:
#[Warning] InnoDB: Total InnoDB FTS size 15484128 for the table `magento`.`customer_grid_flat` exceeds the innodb_ft_cache_size 8000000

SET GLOBAL innodb_ft_cache_size = 268435456;
