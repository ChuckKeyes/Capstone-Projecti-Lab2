#!/bin/bash
clear
echo "What type of bread do you want to make?"
echo "     "
sleep 1

echo "1 for White Bread"
echo "     "
sleep 1

echo "2 for Wheat Bread"
echo "     "
sleep 1

echo "3 for Corn Bread"
echo "     "
sleep 1

read -p "Enter the number for your choice: " bread_type
echo "    "

if [ "$bread_type" = "1" ]; then
    echo "You have chosen to make White Bread."
     echo "     "
    sleep 2
    cd white-bread/
    python white.py
   

elif [ "$bread_type" = "2" ]; then
    echo "You have chosen to make Wheat Bread."
     echo "     "
    sleep 2
    cd wheat-bread/
    python wheat.py

elif [ "$bread_type" = "3" ]; then
    echo "You have chosen to make Corn Bread."
    echo "     "
    sleep 2
    cd corn-bread/
    python corn.py
else
    echo "Invalid choice. Please select a valid bread type."
    echo "    "
fi
