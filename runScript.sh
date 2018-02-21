TEST_FILE=$1

if [ ! -z $2 ]; then
    algos=("$2")
else
	algos=( "rle" "sf" "huff" "lz" "rice8" "rice16" "rice32" "rice8s" "rice16s" "rice32s" )
fi

for algo in "${algos[@]}"
do
	./src/bfc c $algo $TEST_FILE $TEST_FILE.${algo}_comp
	./src/bfc d $TEST_FILE.${algo}_comp $TEST_FILE.${algo}_uncomp
	diff $TEST_FILE $TEST_FILE.${algo}_uncomp
done
zip $TEST_FILE.zip $TEST_FILE