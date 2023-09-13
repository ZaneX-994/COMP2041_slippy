#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)

tmp3=$(mktemp -t tmp.XXX)
echo '/2/ d ; # comment0 ; 2 q' > tmp3

seq 1 100 | ./slippy -f "$tmp3" > "$tmp1"
seq 1 100 | 2041 slippy -f "$tmp3" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

echo '$d   ;  /.1/p' > "$tmp3"

seq 1 15 | ./slippy -f "$tmp3" > "$tmp1"
seq 1 15 | 2041 slippy -f "$tmp3" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi