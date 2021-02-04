#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program"

isPresent=1;
WagePerHr=20
fullDay=8
dailyPayment=0
checkRandom=$((RANDOM%2))
if [ $isPresent -eq $checkRandom ]
then
    echo "Employee is Present"
    dailyPayment=$(($WagePerHr*$fullDay))
    echo "Daily Payment is: " $dailyPayment
else
    echo "Employee is absent"
    echo "Daily Payment is: " $dailyPayment 
fi

