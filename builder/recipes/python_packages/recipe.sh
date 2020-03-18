#!/bin/bash

# version of your package (set in config.conf)
VERSION_python_packages=${VERSION_python}

# dependencies of this recipe
DEPS_python_packages=(hdf5)

# url of the package
URL_python_packages=

# md5 of the package
MD5_python_packages=

# default build path
BUILD_python_packages=$BUILD_PATH/python_packages/v${VERSION_python_packages}

# default recipe path
RECIPE_python_packages=$RECIPES_PATH/python_packages

# requirements
REQUIREMENTS_python_packages=(
  six==1.14.0
  numpy==1.18.2
  h5py==2.10.0
  chardet==3.0.4
  idna==2.9
  urllib3==1.25.8
  certifi==2019.11.28
  requests==2.23.0
  PyQt5==${VERSION_qt}
)

# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_python_packages() {
  try mkdir -p $BUILD_python_packages
  cd $BUILD_python_packages

  # check marker
  if [ -f .patched ]; then
    return
  fi

  touch .patched
}

function shouldbuild_python_packages() {
  for i in ${REQUIREMENTS_python_packages[*]}
  do
    if ! python_package_installed $i; then
      debug "Missing python package $i, requested build"
      return
    fi
  done
  DO_BUILD=0
}

# function called to build the source code
function build_python_packages() {
  try mkdir -p $BUILD_PATH/proj/build-$ARCH
  try cd $BUILD_PATH/proj/build-$ARCH

  push_env

  for i in ${REQUIREMENTS_python_packages[*]}
  do
    info "Installing python_packages package $i"
    try $PIP $i
  done

  pop_env
}

# function called after all the compile have been done
function postbuild_python_packages() {
 for i in ${REQUIREMENTS_python_packages[*]}
  do
    if ! python_package_installed $i; then
      error "Missing python package $i"
    fi
  done
}