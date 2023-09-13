#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)


seq 1 5 | ./slippy  "1,3c hello ; /3/q" > "$tmp1"
seq 1 5 | 2041 slippy  "1,3c hello ; /3/q" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 5 | ./slippy  "/3/q ; 1,3c hello" > "$tmp1"
seq 1 5 | 2041 slippy  "/3/q ; 1,3c hello" > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi