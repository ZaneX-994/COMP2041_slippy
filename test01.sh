#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)
# subset 0 test
seq 2 3 20 | ./slippy -n '/^1/p' > "$tmp1"
seq 2 3 20 | 2041 slippy -n '/^1/p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 2 3 20 | ./slippy -n '/^1/s/[0-9]/-/' > "$tmp1"
seq 2 3 20 | 2041 slippy -n '/^1/s/[0-9]/-/' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 2 3 20 | ./slippy -n '/^1/s/[0-9]/-/g' > "$tmp1"
seq 2 3 20 | 2041 slippy -n '/^1/s/[0-9]/-/g' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi
