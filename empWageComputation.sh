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
workingDay=20
salary=0

for((day=1; day<=$workingDay; day++))
do
    checkRandom=$((RANDOM%2))
    case $checkRandom in
	    $present)
    		    echo "Employee is present"
    		    jobType=$((RANDOM%2))
    		    case $jobType in
                        $FullTime)
                            dailyPayment=$(($WagePerHr * $fullDay))
                            ;;
                        $PartTime)
                            dailyPayment=$(($WagePerHr * $partTimeHr))
                            ;;
                        *)
                            echo "Invalid job type"
                            ;;
                esac
                ;;
	    $absent)
    		    echo "Employee is absent"
			    ;;
        *)
                echo "Invalid attendance"
                ;;
        esac
        salary=$(($dailyPayment+$salary))
done


echo "Daily Payment is : $dailyPayment"
echo "Salary = $salary"
