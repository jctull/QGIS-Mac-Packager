#!/bin/bash

function check_python_numpy() {
  env_var_exists VERSION_python_numpy
}

function bundle_python_numpy() {
  :
}

function postbundle_python_numpy() {
  NUMPY_EGG_DIR=$BUNDLE_CONTENTS_DIR/Resources/python/site-packages/numpy-${VERSION_python_numpy}-py${VERSION_major_python}-macosx-${MACOSX_DEPLOYMENT_TARGET}-x86_64.egg

  for i in \
    _multiarray_umath \
    lapack_lite \
    _umath_linalg
  do
    install_name_change $DEPS_LIB_DIR/$LINK_libopenblas_haswellp @rpath/$LINK_libopenblas_haswellp $NUMPY_EGG_DIR/numpy/core/$i.cpython-${VERSION_major_python//./}m-darwin.so
  done
}

