#!/bin/bash

#NB:echo return er o kaj kore + print er kaj kore

#Take an array and print it
echo "---------------------------------------------------------"
fruits=("Apple" "Banana" "Mango" "Orange")

echo "Print only index 1:"
echo "fruit: ${fruits[1]}"

echo ""
echo "Print all value in array in a single line: "
echo "fruit: ${fruits[*]}"

echo ""
echo "Add 2 element in array:"
fruits+=("Pineapple" "Jackfruit")
echo "Fruits: ${fruits[@]}"

echo "---------------------------------------------------------"
#for loop + print er kaj kore
echo "For loop:"
for i in "${fruits[@]}"; do
    echo "fruit: $i"
done
echo "--------------------------------------------------------------"
# element remove using unset
echo "Element removed index = 2";
unset fruits[2];

echo "Fruits: ${fruits[@]}"
echo "--------------------------------------------------------------"

#While loop
echo "While loop:"

count=1;

while [ $count -le 5 ]
do
    echo "count=$((count++))";
done

echo "$count"
echo "$count"

echo "--------------------------------------------------------------"

#Until loop
echo "Until loop:"

count=1;

#-le -> less than equal to ge-> gretar than equal to
until [ $count -le 5 ]
do
    echo "count=$((count++))";
done

echo "$count"
echo "$count"

echo "--------------------------------------------------------------"

#Prints all .txt file
echo "Prints all .txt file:"
array=($(find -name "*.txt"))

for file in "${array[@]}"; do
    echo "File: $file"
done


#prints all the file in the folder
echo ""
echo "Prints all the file in the folder:"
array=($(ls))

for file in "${array[@]}"; do
    echo "File: $file"
done

#Prints manually:
echo ""
echo "Print all the file with .txt in last manually"
array=("c4.txt" "c3.txt")

for file in "${array[@]}"; do
    echo "File: $file"
done

echo "---------------------------------------------------------"

echo "Take back one folder and prints all the files and folders:"
array=($(ls ../))

for file in "${array[@]}"; do
    echo "File: $file"
done


echo "---------------------------------------------------------"
echo "Function: "

greet()
{
    echo "Hello $1" #This $1 is "kafi"
}

greet "Kafi"
greet 1

#class5.sh rafat -> hello rafat
echo "Hello $1" #This $1 is the input of terminal


echo "---------------------------------------------------------"
echo "Print factorial"

factorial() {
    result=1
    while [ $num -ge 1 ]
    do
        result=$((result * num))
        ((num--))
    done
    echo "Factorial: $result"
}

num=5
factorial


echo "---------------------------------------------------------"
echo "Print factorial using recursion:"

factorial_r()
{
    if [ $1 -le 1 ]; then
        echo 1 #echo return er kaj kore
    else
        prev=$(factorial_r $(( $1 -1 )))
        echo $(( $1 * prev ))
    fi
}

result=$(factorial_r 5)

echo "Factorial recursion result $result"

echo "---------------------------------------------------------"
echo "Zip a file"

SOURCE_DIR="../parent" #jei directory ke zip korbo
OUTPUT_ZIP="archive.zip" #ei nam diye zip kore

zip -r "$OUTPUT_ZIP" "$SOURCE_DIR"

if [ $? -eq 0 ]; then # $? -> letest comment er exist status check kore... 0 thakle sucessfully run 0 na thakle error
    echo "Folder '$SOURCE_DIR' sucessfully zipped to 'OUTPUT_ZIP'."
else
    echo "Error: Zipping of folder 'SOURCE_DIR' failed."
fi

echo "---------------------------------------------------------"


echo "Return value"
add() {
    sum=$(( $1 + $2 ))
    echo "$sum"
}

result=$(add 7 8)
echo "Sum is $result"


factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        local temp=$(( $1 - 1 ))
        local result=$(factorial $temp)
        echo $(( $1 * result ))
    fi
}

num=5
result=$(factorial $num)
echo "Factorial of $num is $result"



factorial() {
    local n=$1
    local result=1
    while [ $n -gt 1 ]; do
        result=$((result * n))
        n=$((n - 1))
    done
    echo $result
}

num=5
result=$(factorial $num)
echo "Factorial of $num is $result"




fibonacci() {
    if [ $1 -le 0 ]; then
        echo 0
    elif [ $1 -eq 1 ]; then
        echo 1
    else
        local n1=$(fibonacci $(( $1 - 1 )))
        local n2=$(fibonacci $(( $1 - 2 )))
        echo $((n1 + n2))
    fi
}

num=10
result=$(fibonacci $num)
echo "Fibonacci of $num is $result"




fibonacci() {
    local n=$1
    local a=0
    local b=1

    if [ $n -eq 0 ]; then
        echo 0
        return
    fi

    for (( i=2; i<=n; i++ )); do
        local temp=$((a + b))
        a=$b
        b=$temp
    done

    echo $b
}

num=10
result=$(fibonacci $num)
echo "Fibonacci of $num is $result"
