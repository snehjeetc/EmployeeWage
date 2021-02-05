#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program"

present=1
absent=0
FullTime=1
PartTime=0
WagePerHr=20
fullDay=8
partTimeHr=4
dailyPayment=0
checkRandom=$((RANDOM%2))
if [ $present -eq $checkRandom ]
then
    echo "Employee is present"
    jobType=$((RANDOM%2))
    if [ $FullTime -eq $jobType ]
    then
        dailyPayment=$(($WagePerHr * $fullDay))
    else
        dailyPayment=$(($WagePerHr * $partTimeHr))
    fi
else
    echo "Employee is absent"
fi

echo "Daily Payment is : $dailyPayment"
