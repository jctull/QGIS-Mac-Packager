#!/bin/bash

function check_libtiff() {
  env_var_exists VERSION_libtiff
}

function bundle_libtiff() {
    try cp -av $DEPS_LIB_DIR/libtiff.*dylib $BUNDLE_LIB_DIR
}

function postbundle_libtiff() {
 install_name_id @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libtiff.5.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libgdal.26.dylib

 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_gl-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_aui-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_qa-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_xrc-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_stc-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_ribbon-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_core-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_adv-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_html-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_propgrid-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_richtext-3.0.0.4.0.dylib
 install_name_change /opt/QGIS/qgis-deps-0.3.0/stage/lib/libtiff.5.dylib @rpath/libtiff.5.dylib $BUNDLE_CONTENTS_DIR/MacOS/lib/libwx_osx_cocoau_media-3.0.0.4.0.dylib
}

function add_config_info_libtiff() {
    :
}