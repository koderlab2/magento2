#!/bin/bash

NAME="ynti7vfsvbh5g"
APP_DIR="/app/${NAME}"

cd ${APP_DIR}/

bin/magento config:set services_connector/services_connector_integration/production_api_key '' --lock-env
bin/magento config:set services_connector/services_connector_integration/sandbox_api_key '' --lock-env
bin/magento config:set services_connector/services_connector_integration/production_private_key '' --lock-env
bin/magento config:set services_connector/services_connector_integration/sandbox_private_key '' --lock-env



bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="default" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="sweden_store_view" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pchenderson_uk_store_view" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="germany_store_view" payment/adyen_abstract/client_key_live '' --lock-env



bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="italy_store_view" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="es" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="pt" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="netherlands_store_view" payment/adyen_abstract/client_key_live '' --lock-env



bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="france_store_view" payment/adyen_abstract/client_key_live '' --lock-env

bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/demo_mode 1 --lock-env
bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/merchant_account '' --lock-env
bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/notification_username '' --lock-env
bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/notification_password '' --lock-env
bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/api_key_live '' --lock-env
bin/magento config:set --scope="stores" --scope-code="dk" payment/adyen_abstract/client_key_live '' --lock-env

#bin/magento c:f
