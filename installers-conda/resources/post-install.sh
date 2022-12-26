#!/bin/bash
set -e

echo "*** Starting post install script for __NAME__.app"

cat <<EOF
* __PKG_NAME_LOWER__
* __NAME__
* __VERSION__
* __CHANNELS__
* __WRITE_CONDARC__
* __SHORTCUTS__
* __DEFAULT_PREFIX__
* __LICENSE__
* __FIRST_PAYLOAD_SIZE__
* __SECOND_PAYLOAD_SIZE__
* __MD5__
* __INSTALL_COMMANDS__
* __PLAT__
* __NAME_LOWER__
EOF

echo "Args = $@"
echo "$(declare -p)"

ENV_PREFIX=$(cd "${PREFIX}/envs/__NAME_LOWER__"; pwd)
app_path="$(dirname ${DSTROOT})/Applications/__NAME__.app"

if [[ -e "$app_path" ]]; then
    echo "Creating python symbolic link..."
    ln -sf "${ENV_PREFIX}/bin/python" "$app_path/Contents/MacOS/python"
else
    echo "ERROR: $app_path does not exist"
    exit 1
fi

echo "*** Post install script for __NAME__.app complete"
