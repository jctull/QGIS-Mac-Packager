#!/bin/bash

function check_libxslt() {
  env_var_exists VERSION_libxslt
  env_var_exists LINK_libxslt
}

function bundle_libxslt() {
  try cp -av $DEPS_LIB_DIR/libxslt.*dylib $BUNDLE_LIB_DIR
}

function postbundle_libxslt() {
  install_name_id @rpath/$LINK_libxslt $BUNDLE_CONTENTS_DIR/MacOS/lib/$LINK_libxslt

  for i in \
    $LINK_libxml2 \
    $LINK_zlib
  do
    install_name_change $DEPS_LIB_DIR/$i @rpath/$i $BUNDLE_LIB_DIR/$LINK_libxslt
  done
}
