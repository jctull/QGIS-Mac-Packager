#!/bin/bash

function check_python_scipy() {
  env_var_exists VERSION_python_scipy
}

function bundle_python_scipy() {
  :
}

function postbundle_python_scipy() {
 SCIPY_EGG_DIR=$BUNDLE_CONTENTS_DIR/Resources/python/site-packages/scipy-${VERSION_python_scipy}-py${VERSION_major_python}-macosx-${MACOSX_DEPLOYMENT_TARGET}-x86_64.egg
 for i in \
   odr/__odrpack \
   linalg/_decomp_update \
   linalg/_fblas \
   linalg/_flapack \
   linalg/_flinalg \
   linalg/_interpolative \
   linalg/_solve_toeplitz \
   linalg/cython_blas \
   linalg/cython_lapack \
   optimize/__nnls \
   optimize/_bglu_dense \
   optimize/_cobyla \
   optimize/_group_columns \
   optimize/_lbfgsb \
   optimize/_lsap_module \
   optimize/_minpack \
   optimize/_slsqp \
   optimize/_zeros \
   optimize/minpack2 \
   optimize/moduleTNC \
   integrate/_dop \
   integrate/_odepack \
   integrate/_quadpack \
   integrate/_test_multivariate \
   integrate/_test_odeint_banded \
   integrate/lsoda \
   integrate/vode \
   io/_test_fortran \
   special/cython_special \
   special/_ufuncs \
   special/specfun \
   interpolate/dfitpack \
   interpolate/_fitpack \
   sparse/linalg/isolve/_iterative \
   sparse/linalg/eigen/arpack/_arpack \
   sparse/linalg/dsolve/_superlu \
   stats/statlib \
   stats/mvn
  do
    install_name_change $DEPS_LIB_DIR/$LINK_libquadmath @rpath/$LINK_libquadmath $SCIPY_EGG_DIR/scipy/$i.cpython-${VERSION_major_python//./}m-darwin.so
    install_name_change $DEPS_LIB_DIR/$LINK_libgfortran @rpath/$LINK_libgfortran $SCIPY_EGG_DIR/scipy/$i.cpython-${VERSION_major_python//./}m-darwin.so
    install_name_change $DEPS_LIB_DIR/$LINK_gcc_s @rpath/$LINK_gcc_s $SCIPY_EGG_DIR/scipy/$i.cpython-${VERSION_major_python//./}m-darwin.so
  done

  for i in \
   odr/__odrpack \
   linalg/_decomp_update \
   linalg/_fblas \
   linalg/_flapack \
   linalg/_flinalg \
   linalg/_interpolative \
   linalg/_solve_toeplitz \
   linalg/cython_blas \
   linalg/cython_lapack \
   optimize/_trlib/_trlib \
   optimize/_lbfgsb \
   integrate/_odepack \
   integrate/_test_odeint_banded \
   integrate/lsoda \
   integrate/lsoda \
   integrate/vode \
   integrate/_quadpack \
   special/cython_special \
   special/_ufuncs \
   special/_ellip_harm_2 \
   sparse/linalg/isolve/_iterative \
   sparse/linalg/eigen/arpack/_arpack \
   sparse/linalg/dsolve/_superlu \
   spatial/qhull
  do
    install_name_change $DEPS_LIB_DIR/$LINK_libopenblas_haswellp @rpath/$LINK_libopenblas_haswellp $SCIPY_EGG_DIR/scipy/$i.cpython-${VERSION_major_python//./}m-darwin.so
  done
}

