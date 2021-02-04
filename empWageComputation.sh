#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program"

isPresent=1;
checkRandom=$((RANDOM%2))
if [ $isPresent -eq $checkRandom ]
then
    echo "Employee is Present"
else
    echo "Employee is absent"
fi

