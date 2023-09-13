#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)


# yes | ./slippy -n '$p' > "$tmp1"
# yes | 2041 slippy -n '$p' > "$tmp2"


seq 1 100 | ./slippy '1p;1p' > "$tmp1"
seq 1 100 | 2041 slippy '1p;1p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 100 | ./slippy '1p
1p' > "$tmp1"
seq 1 100 | 2041 slippy '1p
1p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi