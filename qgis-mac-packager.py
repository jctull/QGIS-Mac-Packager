# 2019 Peter Petrik (zilolv at gmail dot com)
# GNU General Public License 2 any later version

import argparse
import os

from qmp.builder import build
from qmp.bundler import bundle
from qmp.packager import package

from qmp.paths import Paths
from qmp.common import Message
from qmp.copy_utils import CopyUtils

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Build, Package and Sign QGIS Application')
    parser.add_argument('--output_directory',
                        required=True,
                        help='output directory for this build (will contain qgis git repo, build tree, '
                             'install tree, bundle tree and resulting dmg)')
    parser.add_argument('--git',
                        required=True,
                        help='git branch/tag/changeset')
    parser.add_argument('--release_type',
                        required=True,
                        help='release type (ltr, pr, nightly, staging)')
    parser.add_argument('--qgisapp_name',
                        required=True,
                        help='name of resulting qgis application (QGIS.app, QGIS3.4.app, QGIS3.5.app)')
    parser.add_argument('--dmg_name',
                        required=True,
                        help='name of resulting dmg (qgis_3_4_LTR-2.dmg)')
    parser.add_argument('-sbuild', '--skip_build', action='store_true', help="skip build phase (development) ",
                        default=False)
    parser.add_argument('-sbundle', '--skip_bundle', action='store_true', help="skip bundle phase (development) ",
                        default=False)
    parser.add_argument('-spackage', '--skip_package',
                        action='store_true',
                        help="skip package(dmg) phase (development) ",
                        default=False)
    parser.add_argument('-v', '--verbose', action='count', default=1)
    parser.add_argument('--clean', action='store_true', help="Clean build", default=False)
    parser.add_argument('--no-credentials',
                        action='store_true',
                        help="If you want to skip signing",
                        default=False)

    args = parser.parse_args()
    pa = Paths(args)
    pa.verify()
    msg = Message(args.verbose)
    cp = CopyUtils(pa.output.root)

    msg.chapter("build")
    if not args.skip_build:
        build(
            cp=cp,
            msg=msg,
            pa=pa,
            clean=args.clean,
            git_commit=args.git,
            qgis_repo="https://github.com/qgis/QGIS.git/"
        )
    else:
        msg.info("build skipped")

    msg.chapter("bundle")
    if not args.skip_bundle:
        bundle(
            cp=cp,
            msg=msg,
            pa=pa
        )
    else:
        msg.info("bundle skipped")

    msg.chapter("package")
    if not args.skip_package:
        package(
            msg=msg,
            pa=pa
        )
    else:
        msg.info("package (dmg) skipped")
