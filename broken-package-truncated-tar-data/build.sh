#!/bin/bash

set -eu
cd $(dirname $0)

NAME=$(node -p "require('./package.json').name")
VERSION=$(node -p "require('./package.json').version")
BASE=$NAME-v$VERSION

yarn pack

SIZE=$(( 512 * 8 + 300 ))

mv $BASE.tgz $BASE.orig.tgz
gunzip -c --keep $BASE.orig.tgz | head -c $SIZE | gzip -c - > $BASE.tgz
