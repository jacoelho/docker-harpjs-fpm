#!/bin/bash

export VERSION=$(date +%Y%m%d%H%M)
export SRC_DIR=/root/website
export TMP_DIR=/var/www/${SITENAME}

# copy assets files
mkdir -p ${TMP_DIR}/assets
cp -fr ${SRC_DIR}/_assets/* ${TMP_DIR}/assets/

#compile application
harp compile ${SRC_DIR} ${TMP_DIR}

# build deb file
fpm --force -s dir -t deb -n $SITENAME \
  -v $VERSION \
  --exclude "**/.git/**" \
  -a all ./${TMP_DIR}

mkdir -p ${SRC_DIR}/build

cp -v *.deb ${SRC_DIR}/build