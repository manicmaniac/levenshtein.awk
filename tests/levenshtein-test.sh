#!/bin/sh

cd "$(dirname "$0")"

setUp() {
    levenshtein="../bin/levenshtein"
    words_txt="./words.txt"
}

test_levenshtein() {
    assertEquals 3 "$("$levenshtein" 'foo' 'bar')"
    assertEquals 1 "$("$levenshtein" 'foo' 'hoo')"
    assertEquals 3 "$("$levenshtein" 'foo' 'foobar')"
    assertEquals 3 "$("$levenshtein" 'bar' 'foobar')"
}

test_levenshtein_help() {
    "$levenshtein" -h | grep -q -i 'usage'
    assertEquals 0 $?
    "$levenshtein" --help | grep -q -i 'usage'
    assertEquals 0 $?
}

test_levenshtein_version() {
    "$levenshtein" -v | grep -q -e '[0-9].[0-9].[0-9]'
    assertEquals 0 $?
    "$levenshtein" --version | grep -q -e '[0-9].[0-9].[0-9]'
    assertEquals 0 $?
}

test_levenshtein_nearest() {
    assertEquals 'foo'    "$("$levenshtein" -n -- 'foo'           < "$words_txt")"
    assertEquals 'foobar' "$("$levenshtein" -n 'foobaz'           < "$words_txt")"
    assertEquals 'foo'    "$("$levenshtein" --nearest 'foo'       < "$words_txt")"
    assertEquals 'foobar' "$("$levenshtein" --nearest -- 'foobaz' < "$words_txt")"

    assertEquals 'foo'    "$("$levenshtein" -n 'foo' 'hoo')"
    assertEquals 'foobar' "$("$levenshtein" -n 'foobar' 'hoo')"
}

test_levenshtein_error() {
    "$levenshtein" 2> /dev/null
    assertEquals 1 $?
    "$levenshtein" 'foo' 'bar' 'baz' 2> /dev/null
    assertEquals 1 $?
    "$levenshtein" '-n' 'foo' 'bar' 'baz' 2> /dev/null
    assertEquals 1 $?
}

. ../vendors/shunit2/src/shunit2

