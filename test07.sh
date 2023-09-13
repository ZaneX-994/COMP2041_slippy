#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)


seq 1 15 | ./slippy "s/[1/--/g" > "$tmp1"
seq 1 15 | 2041 slippy "s/[1/--/g" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 15 | ./slippy "?a?s?[0-9]?--?g" > "$tmp1"
seq 1 15 | 2041 slippy "?a?s?[0-9]?--?g" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi
