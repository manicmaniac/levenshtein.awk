#!/bin/sh

set -e
cd "$(dirname "$0")"

assert_awk='../vendors/assert.awk/assert.awk'
levenshtein_awk='../levenshtein.awk'
levenshtein_test_awk='./levenshtein-test.awk'

if [ ! -f "$assert_awk" ]; then
    echo "error: $assert_awk does not exist." >&2
    exit 1
fi
if [ ! -f "$levenshtein_awk" ]; then
    echo "error: $levenshtein_awk does not exist." >&2
    exit 1
fi
if [ ! -f "$levenshtein_test_awk" ]; then
    echo "error: $levenshtein_test_awk does not exist." >&2
    exit 1
fi

awk -f "$assert_awk" -f "$levenshtein_awk" -f "$levenshtein_test_awk"

