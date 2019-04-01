#!/usr/bin/env bash

################################################################################
# Task:
#
# Take a list of user inputs, uses a while loop to check if there are negative
# numbers and if so exit the loop. Then insert the input values as element into
# an array and use a for loop to iterate through the array finding the min, max,
# and avg of the array elements
################################################################################

# prompt the user with a message
echo "Please enter a positive number, press enter with no value when you're done: "

# the user's input will be saved in a variable named 'number'
read number

# if the user's input is less than 0
# OR the value of $number is NOT a numerical number,
# the script will notify the user and then exit with exit code of 1

# (to see the exit code you can run:
# 'echo $?' in the shell after the script is done)

# ^ = starts with
# [0-9] = any number from 0 to 9
# + = reoccurs one ore more times
# $ = ends with
if [[ $number -lt 0 ]] || ! [[ $number =~ ^[0-9]+$ ]]; then
  echo "You did not enter a positive number... exiting..."
  exit 1
fi

# add the user's input to an array
number_array+=("$number")

# while the value of $number is nonzero (not empty)
# AND the value of $number is a numerical number
# the script will continue reading input from the user.
while [[ -n $number && $number =~ ^[0-9]+$ ]]; do
  read number

  # while the value of $number is less than 0, the script will
  # notify the user and then exit with exit code of 1 like before
  while [[ $number -lt 0 ]]; do
    echo "You did not enter a positive number... exiting..."
    exit 1
  done

  # chek again if the value of $number is nonzero (not empty)
  # so we will not insert an empty element into the array
  if [[ -n $number ]]; then
    # add the user's input to an array
    number_array+=("$number")
  fi
done

# declare a min number variable with the value of the first element in the number array
min_number="${number_array[0]}"

# for each element of the array iterate with variable named 'i'.
for i in ${number_array[*]}; do

  # if $i is less than OR equal to $min_number,
  # set the $min_numberto $i
  if [[ $i -le $min_number ]]; then
    min_number=$i
  fi
done

# declare a max number variable with the value of the first element in the number array
max_number="${number_array[0]}"

# for each element of the array iterate with variable named 'i'.
for i in ${number_array[*]}; do

  # if $i is greater than OR equal to $max_number,
  # set the $max_number to $i
  if [[ $i -ge $max_number ]]; then
    max_number=$i
  fi
done

# for each element of the array iterate with variable named 'i'.
# to calculate the summary, each value of $i will be added to the
# summary number of the elements
for i in ${number_array[*]}; do
  sum_number=$(expr $sum_number + $i)
done

# to calculate the average, we divide the summary of the elements
# with the number of elements
avg_number=$(expr $sum_number / ${#number_array[*]})

# prompt the user with the results
echo "The minimum number is: $min_number"

echo "The maximum number is: $max_number"

echo "The average number is: $avg_number"
