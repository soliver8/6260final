BIN=.
TV=./testv

# function to compare two files and issue warning if they are different
function pwarn
{
cmp $1 $2
if [ $? != 0 ]
then
print MISMATCH Test file $2
else
print MATCH Test file $2
fi
}

print TESTING..............
print $PWD
date

# test encoder
print encoder test
for i in $TV/*.in
do
x=`basename $i .in`
$BIN/coder $i $x.bs >/dev/null
pwarn $TV/$x.bit $x.bs
done

# test decoder
print decoder test
for i in $TV/*.bit
do
x=`basename $i .bit`
$BIN/decoder $i $x.pf >/dev/null
pwarn $TV/$x.pst $x.pf
done

rm -f *.pf *.bs
