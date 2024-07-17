#!/bin/bash

NAME="ynti7vfsvbh5g"
APP_DIR="/app/${NAME}"



echo_msg() {
    local msg="$1"
    echo
    echo -e "\e[97;45m${msg}\e[0m"
}

remove_cacheable_dirs() {
    cd ${APP_DIR}/
    echo_msg "Removing cacheable directories"
    rm -rf pub/static/* var/cache/* var/composer_home/* var/page_cache/* var/view_preprocessed/* generated/*
}

run_setup_upgrade() {
    echo_msg "Running upgrade"
    bin/magento setup:upgrade
}

run_compilation() {
    echo_msg "Running compilation"
    bin/magento setup:di:compile
}

deploy_static_content() {
    echo_msg "Deploying static content"

    countries=("en_GB" "en_US" "sv_SE" "de_DE" "it_IT" "es_ES" "pt_PT" "nl_NL" "fr_FR" "da_DK")
    total=${#countries[@]}

    for ((i=0; i<${#countries[@]}; i++)); do
        country=${countries[i]}
        echo_msg "  - processing ${country} $((i+1))/$total "

        php -d memory_limit=-1 bin/magento setup:static-content:deploy -j8 -f ${country}
    done
}

clear_cache() {
    echo_msg "Clearing cache"
    bin/magento cache:flush
}

run_reindex() {
    echo_msg "Reindexing"
    bin/magento index:reindex
}


deploy_app() {
    echo_msg "Deploying app"

    remove_cacheable_dirs
    run_setup_upgrade
    run_compilation
    deploy_static_content
    clear_cache
    run_reindex

    echo_msg "Deployment finished"
}



# script starting point
deploy_app
