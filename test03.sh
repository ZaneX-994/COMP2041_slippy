#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)

seq 1 100 | ./slippy '/.5/,/.9/s?[0-9]?-?' > "$tmp1"
seq 1 100 | 2041 slippy '/.5/,/.9/s?[0-9]?-?' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 100 | ./slippy 's?2?-? ; 2q' > "$tmp1"
seq 1 100 | 2041 slippy 's?2?-? ; 2q' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi