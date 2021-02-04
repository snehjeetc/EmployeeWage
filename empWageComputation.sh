#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program"


isFullTime=2
isPartTime=1
WagePerHr=20
fullDay=8
partTimeHr=4
dailyPayment=0
checkRandom=$((RANDOM%3))
if [ $isFullTime -eq $checkRandom ]
then
    echo "Employee does full time job"
    dailyPayment=$(($WagePerHr*$fullDay))
    echo "Daily Payment is: " $dailyPayment
elif [ $isPartTime -eq $checkRandom ]
then
    echo "Employee does part time job"
    dailyPayment=$(($partTimeHr*$WagePerHr))
    echo "Daily Payment is: " $dailyPayment
else
    echo "Employee is absent"
    echo "Daily Payment is: " $dailyPayment 
fi

