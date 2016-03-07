#!/bin/bash

VAR=$WERCKER_BUILD_VERSION_ENVVAR;

if [ -z "$WERCKER_BUILD_VERSION_ENVVAR" ]; then
    # If the envvar is not set, use `BUILD_VERSION` as variable name
    VAR="BUILD_VERSION"
fi

echo "Folder Contents:" `ls`

# Export the package version
export ${VAR}=$(grep "const Version " $WERCKER_SOURCE_DIR/version.go | sed -E 's/.*"(.+)"$/\1/')
if [ "$?" = "0" ]; then
	echo "Build version ${!VAR} detected."
else
	echo "Unable to detect version number" 1>&2
	exit 1
fi

