#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)

seq 1 10 | ./slippy -n '1,/1.1/p;/.2/,/.9/p' > "$tmp1"
seq 1 10 | 2041 slippy -n '1,/1.1/p;/.2/,/.9/p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 10 | ./slippy -n '1,/1.1/p;1,/1.1/p' > "$tmp1"
seq 1 10 | 2041 slippy -n '1,/1.1/p;1,/1.1/p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi
