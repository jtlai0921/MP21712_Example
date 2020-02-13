input1="Hello world"
input2="Hello world2"
while IFS= read -r str; do
    printf '%s\n' "$str"
done <<EOF
$input1
$input2
EOF
