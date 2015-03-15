#!/usr/bin/awk -f

BEGIN {
    test_levenshtein_distance()
}

function test_levenshtein_distance() {
    assert_equals(levenshtein_distance("foo", "bar"), 3, "foo, bar")
    assert_equals(levenshtein_distance("foo", "hoo"), 1, "foo, hoo")
    assert_equals(levenshtein_distance("foo", "foobar"), 3, "foo, foobar")
    assert_equals(levenshtein_distance("bar", "foobar"), 3, "bar, foobar")
}

