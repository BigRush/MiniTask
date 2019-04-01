#!/usr/bin/env bash

################################################################################
# Task:
#
# Take a list of user inputs, use a while loop to check if there are negative
# numbers and if so, exit the loop.
# Insert the input values as element into an array and use a for loop to
# iterate through the array finding the min, max, and avg of the array elements.
#
################################################################################

# prompt the user with a message.
# the user's input will be saved in a variable named 'number'
read -p "Please enter a positive number (decimal not allowed), press enter with no value when you're done: " number

# if the value of $number is NOT a positive numerical number,
# the script will notify the user and then exit the script with exit code of 1

# (to see the exit code you can run:
# 'echo $?' in the shell after the script is done)

# ^ = starts with
# [0-9] = any number from 0 to 9
# + = reoccurs one ore more times
# $ = ends with
if ! [[ $number =~ ^[0-9]+$ ]]; then
  echo "You did not enter a positive number... exiting..."
  exit 1
fi

# add the user's input to an array
number_array+=("$number")

# while the length of $number is nonzero (NOT empty) enter the loop
while [[ -n $number ]]; do

  # get a new value for variable 'number' from the user
  read number

  # if the length of $number IS zero (empty), break the loop (exit the loop)
  if [[ -z $number ]]; then
    # break the loop (exit the loop)
    break

  # if the value of $number IS a numerical number
  # add the user's input to an array
  elif [[ $number =~ ^[0-9]+$ ]]; then

  # add the user's input to an array
  number_array+=("$number")

  # if none of the conditions above are fulfilled,
  # notify the user with message and exit the script with exit code of 1
  else
    echo "You did not enter a positive number... exiting..."
    exit 1
  fi
done

# declare a minimum number variable with the value of the first element in the numbers array
min_number="${number_array[0]}"

# for each element of the array iterate with variable named 'i'.
for i in ${number_array[*]}; do

  # if $i is less than OR equal to $min_number,
  # set the $min_number to $i
  if [[ $i -le $min_number ]]; then
    min_number=$i
  fi
done

# declare a maximum number variable with the value of the first element in the numbers array
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
# to calculate the summary, each value of $i will be added to a variable
# that represents the summary value of the elements
for i in ${number_array[*]}; do
  sum_number=$(expr $sum_number + $i)
done

# to calculate the average, we divide the summary of the elements
# with the number of elements
# (the '#' before 'number_array' will give the number of elements in the array)
avg_number=$(expr $sum_number / ${#number_array[*]})

# prompt the user with the results
echo "The minimum number is: $min_number"

echo "The maximum number is: $max_number"

echo "The average number is: $avg_number"
