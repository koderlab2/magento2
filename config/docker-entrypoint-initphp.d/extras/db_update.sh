#!/bin/bash

queries=(
  "UPDATE core_config_data SET value='https://yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='0';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='0';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='0';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='0';"

  "UPDATE core_config_data SET value='https://se.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='4';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='4';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='4';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='4';"

  "UPDATE core_config_data SET value='https://pch.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='7';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='7';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='7';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='7';"

  "UPDATE core_config_data SET value='https://de.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='9';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='9';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='9';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='9';"

  "UPDATE core_config_data SET value='https://it.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='10';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='10';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='10';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='10';"



  "UPDATE core_config_data SET value='https://ib.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='12';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='12';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='12';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='12';"

  "UPDATE core_config_data SET value='https://nl.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='26';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='26';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='26';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='26';"

  "UPDATE core_config_data SET value='https://fr.yale.cloud.local/' WHERE path='web/secure/base_url' AND scope_id='29';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/secure/base_link_url' AND scope_id='29';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_url' AND scope_id='29';"
  "UPDATE core_config_data SET value='{{secure_base_url}}' WHERE path='web/unsecure/base_link_url' AND scope_id='29';"

  "INSERT INTO core_config_data ( scope, scope_id, path, value) VALUES ('default', 0, 'amasty_elastic/connection/server_hostname', 'elasticsearch');"
)

for query in "${queries[@]}"; do
    mysql -h database -uroot -proot magento -e "$query"
done
