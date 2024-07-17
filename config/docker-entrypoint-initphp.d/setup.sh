#!/bin/bash

# path from app/etc/env.php - lock -> config -> path
NAME="ynti7vfsvbh5g"
APP_DIR="/app/${NAME}"
ENV_FILE="${APP_DIR}/app/etc/env.php"
SCRIPTS_DIR="/docker-entrypoint-initphp.d"
XDEBUG_LOG_FILE="/log/xdebug.log"

display_logo() {
  echo -e "
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░██╗░░░██╗░█████╗░██╗░░░░░███████╗░░░░S░░░░░█████╗░██╗░░░░░░█████╗░██╗░░░██╗██████╗░░░
░░╚██╗░██╔╝██╔══██╗██║░░░░░██╔════╝░░░░T░░░░██╔══██╗██║░░░░░██╔══██╗██║░░░██║██╔══██╗░░
░░░╚████╔╝░███████║██║░░░░░█████╗░░░░░░A░░░░██║░░╚═╝██║░░░░░██║░░██║██║░░░██║██║░░██║░░
░░░░╚██╔╝░░██╔══██║██║░░░░░██╔══╝░░░░░░R░░░░██║░░██╗██║░░░░░██║░░██║██║░░░██║██║░░██║░░
░░░░░██║░░░██║░░██║███████╗███████╗░░░░T░░░░╚█████╔╝███████╗╚█████╔╝╚██████╔╝██████╔╝░░
░░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝░░░░░░░░░░╚════╝░╚══════╝░╚════╝░░╚═════╝░╚═════╝░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"
}

display_logo_end() {
  echo -e "
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░██╗░░░██╗░█████╗░██╗░░░░░███████╗░░░░░░░░░░█████╗░██╗░░░░░░█████╗░██╗░░░██╗██████╗░░░
░░╚██╗░██╔╝██╔══██╗██║░░░░░██╔════╝░░░░E░░░░██╔══██╗██║░░░░░██╔══██╗██║░░░██║██╔══██╗░░
░░░╚████╔╝░███████║██║░░░░░█████╗░░░░░░N░░░░██║░░╚═╝██║░░░░░██║░░██║██║░░░██║██║░░██║░░
░░░░╚██╔╝░░██╔══██║██║░░░░░██╔══╝░░░░░░D░░░░██║░░██╗██║░░░░░██║░░██║██║░░░██║██║░░██║░░
░░░░░██║░░░██║░░██║███████╗███████╗░░░░░░░░░╚█████╔╝███████╗╚█████╔╝╚██████╔╝██████╔╝░░
░░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝░░░░░░░░░░╚════╝░╚══════╝░╚════╝░░╚═════╝░╚═════╝░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"
}

pre_run() {
    if [ ! -d "/run/${NAME}" ]; then
        echo_msg "Creating required /run/${NAME} directory"
        sudo mkdir -p /run/${NAME}/locks
    fi

    chown_magento
}

chown_magento() {
    echo_msg "Changing owner"
    sudo chown -R magento: /run/${NAME}
    sudo chown -R magento: ${SCRIPTS_DIR}
    sudo chown -R magento: ${APP_DIR}
    sudo chown -R magento: /tmp
}

install_app() {
    if [ ! -d "${APP_DIR}/vendor/" ]; then
        update_db_credentials

        echo_msg "Running 'composer install'"
        cd ${APP_DIR}/
        composer install

        echo_msg "Applying magento-vars.php patch to pub/index.php"
        # include magento-vars.php file that is automatically included in cloud environment but here must be added manually
        sed -i "s/\$bootstrap =/\n\ninclude_once('..\/magento-vars.php');\n\n\n\n\$bootstrap =/" ${APP_DIR}/pub/index.php

        chown_magento
    fi
}

update_db_credentials() {
    echo_msg "Updating env.php file"

    # REDIS
    echo "    - Redis configuration"
    sed -i "/'remote_backend_options' =>/,/)/ s/'server' => 'localhost'/'server' => 'redis'/" ${ENV_FILE}
    sed -i "/'redis' =>/,/)/ s/'host' => 'localhost'/'host' => 'redis'/" ${ENV_FILE}
    sed -i "s/'port' => '6370'/'port' => '6379'/g" ${ENV_FILE}

    # MYSQL
    echo "    - MySQL configuration"
    sed -i "s/'host' => '127.0.0.1'/'host' => 'database'/g" ${ENV_FILE}
    sed -i "s/'username' => '${NAME}'/'username' => 'magento'/g" ${ENV_FILE}
    sed -i "s/'dbname' => '${NAME}'/'dbname' => 'magento'/g" ${ENV_FILE}
    sed -i "/'password' => '.\{15\}'/s/'password' => '.\{15\}',/'password' => 'magento'/" ${ENV_FILE}

    #ELASTICSEARCH
    echo "    - Elasticsearch configuration"
    pattern="'elasticsearch7_server_hostname' => 'http://127.0.0.1'"
    replacement="'elasticsearch7_server_hostname' => 'elasticsearch'"
    sed -i "s|${pattern}|${replacement}|g" ${ENV_FILE}

    #RabbitMQ
    echo "    - RabbitMQ configuration"
    sed -i "/'amqp' =>/,/)/ s/'host' => 'localhost'/'host' => 'rabbitmq'/" ${ENV_FILE}
    sed -i "/'amqp' =>/,/)/ s/'user' => '${NAME}'/'user' => 'guest'/" ${ENV_FILE}
    sed -i "/'amqp' =>/,/)/ s/'password' => '.\{16\}'/'password' => 'guest'/" ${ENV_FILE}
    sed -i "/'amqp' =>/,/)/ s/'virtualhost' => '${NAME}'/'virtualhost' => '\/'/" ${ENV_FILE}
}

#set_redis() {
#    echo_msg "-redis settings-"
#    bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1
#}

check_db() {
  while ! mysqladmin ping -uroot -p"${MYSQL_ROOT_PASSWORD}" -h database --silent; do
      sleep 10
      echo_msg "Waiting for DB connection......"
  done
}

apply_patches() {
    echo_msg "Applying patches"
    /usr/local/bin/php ${APP_DIR}/vendor/bin/ece-patches apply
}

disable_2fa() {
    echo_msg "Disabling 2 factor authentication"
    ${APP_DIR}/bin/magento module:disable Magento_TwoFactorAuth
}

post_run() {
    if [ ! -d "/log/" ]; then
        echo_msg "Creating /log/ directory"
        sudo mkdir /log/
        sudo chown magento: /log/
    fi

    if [ ! -e "$XDEBUG_LOG_FILE" ]; then
        echo_msg "Creating $XDEBUG_LOG_FILE"
        touch "$XDEBUG_LOG_FILE"
    fi

    echo_msg "Updating PhpCookieManager.php file"
    sed -i "s/4096/40960/" ${APP_DIR}/vendor/magento/framework/Stdlib/Cookie/PhpCookieManager.php

    chown_magento
}

echo_msg() {
    local msg="$1"
    echo
    echo -e "\e[97;44m${msg}\e[0m"
}



# script starting point
display_logo
if [ ! -d "${APP_DIR}/vendor/" ]; then
    echo_msg "${APP_DIR}/vendor/ directory does not exist. Performing installation."

    pre_run
    install_app
    check_db
#    apply_patches
    disable_2fa

    echo_msg "Updating Magento URL's in the database"
    source ${SCRIPTS_DIR}/extras/db_update.sh

    echo_msg "Performing deployment actions"
    source ${SCRIPTS_DIR}/extras/deploy.sh

    echo_msg "Locking required values in env.php"
    source ${SCRIPTS_DIR}/extras/dev_settings.sh

    echo_msg "Clearing sensitive data"
    source ${SCRIPTS_DIR}/extras/clear_sensitive_data.sh

    post_run
else
    echo_msg "Directory ${APP_DIR}/vendor/ exists. Installation not performed.";
    post_run
fi

display_logo_end

echo_msg 'setup.sh finished'
