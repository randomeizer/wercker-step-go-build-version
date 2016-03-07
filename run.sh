#!/bin/bash

VAR=$WERCKER_BUILD_VERSION_ENVVAR;

if [ -z "$WERCKER_BUILD_VERSION_ENVVAR" ]; then
    # If the envvar is not set, use `BUILD_VERSION` as variable name
    VAR="BUILD_VERSION"
fi  

# Export the package version
export ${VAR}=$(grep "const Version " $WERCKER_SOURCE_DIR/version.go | sed -E 's/.*"(.+)"$/\1/')

echo "Build version ${!VAR} detected."