#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)
# subset 0 test
seq 1 4 | ./slippy '5s/1/2/' > "$tmp1"
seq 1 4 | 2041 slippy '5s/1/2/' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 4 | ./slippy '/2/q' > "$tmp1"
seq 1 4 | 2041 slippy '/2/q' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit
else
    echo "FAIL"
    exit 1
fi

seq 1 4 | ./slippy '/2/p' > "$tmp1"
seq 1 4 | 2041 slippy '/2/p' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 4 | ./slippy '/2/d' > "$tmp1"
seq 1 4 | 2041 slippy '/2/d' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi

