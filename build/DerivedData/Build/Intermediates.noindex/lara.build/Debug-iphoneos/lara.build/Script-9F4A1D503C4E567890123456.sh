#!/bin/sh
set -e; if [ -z "$EXPANDED_CODE_SIGN_IDENTITY" ]; then exit 0; fi; fw="$CODESIGNING_FOLDER_PATH/Frameworks"; for f in "$fw/libgrabkernel2.dylib" "$fw/libxpf.dylib"; do if [ -f "$f" ]; then /usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" --timestamp=none "$f"; fi; done
