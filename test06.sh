#!/bin/dash

tmp1=$(mktemp -t tmp.XXX)
tmp2=$(mktemp -t tmp.XXX)

echo 'Punctuation characters include . , ; :' | ./slippy 's?;?semicolon?g; /;/q # comment' > "$tmp1"
echo 'Punctuation characters include . , ; :' | 2041 slippy 's?;?semicolon?g; /;/q # comment' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

seq 1 20 | ./slippy 's1[1-9]1-1' > "$tmp1"
seq 1 20 | 2041 slippy 's1[1-9]1-1' > "$tmp2"

if  diff "$tmp1" "$tmp2" >/dev/null
then
    echo "PASS"
    exit 0
else
    echo "FAIL"
    exit 1
fi