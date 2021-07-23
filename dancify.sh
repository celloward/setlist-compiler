#!bin/zsh
i=1
echo '' > "out.abc"
while (( "$#" )); do
  case "$1" in
    -t|--title)
    TITLE="$2"
    shift
    shift
    ;;
    -m|--metadata)
    META="$2"
    shift
    shift
    ;;
    *)
    cat "$1" | sed -E "s/(X:) ?[0-9]*/\1$i/" >> "out.abc"
    echo "\n" >> "out.abc"
    i=$((i+1))
    shift
    ;;
  esac
done

echo "%%scale 0.7\nX:0\nT: $TITLE $META" > "output.abc"
cat "out.abc" >> "output.abc"
rm "out.abc"
