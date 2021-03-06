#!/bin/bash

function check_netcdf() {
  env_var_exists VERSION_netcdf
}

function bundle_netcdf() {
  try cp -av $DEPS_LIB_DIR/libnetcdf.*dylib $BUNDLE_LIB_DIR
}

function postbundle_netcdf() {
  install_name_id @rpath/$LINK_netcdf $BUNDLE_CONTENTS_DIR/MacOS/lib/$LINK_netcdf

  for i in \
    $LINK_libhdf5 \
    $LINK_libhdf5_hl \
    $LINK_zlib
  do
    install_name_change $DEPS_LIB_DIR/$i @rpath/$i $BUNDLE_LIB_DIR/$LINK_netcdf
  done
}
