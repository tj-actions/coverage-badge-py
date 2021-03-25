#!/usr/bin/env bash

set -e

EXTRA_ARGS=""

if [[ $INPUT_OVERWRITE == 'true'  ]]; then
  EXTRA_ARGS+='-f'
fi

coverage-badge "$EXTRA_ARGS" -o "${INPUT_OUTPUT}"
