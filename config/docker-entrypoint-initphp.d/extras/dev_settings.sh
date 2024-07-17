#!/bin/bash

NAME="ynti7vfsvbh5g"
APP_DIR="/app/${NAME}"

cd ${APP_DIR}/

bin/magento config:set admin/security/session_lifetime 31536000 --lock-env
bin/magento config:set admin/security/password_lifetime '' --lock-env
bin/magento config:set admin/startup/menu_item_id Magento_Config::system_config --lock-env
bin/magento config:set admin/captcha/enable 0 --lock-env
bin/magento config:set admin/security/use_form_key 0 --lock-env

bin/magento config:set dev/debug/template_hints_storefront 1 --lock-env
bin/magento config:set dev/debug/template_hints_storefront_show_with_parameter 1 --lock-env
bin/magento config:set dev/debug/template_hints_parameter_value true --lock-env
bin/magento config:set dev/debug/template_hints_blocks 1 --lock-env

#bin/magento c:f
